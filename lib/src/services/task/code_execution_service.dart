import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:praxis_server/src/generated/protocol.dart';
import 'package:praxis_server/src/services/task/entities/task_answer_feedback_type.dart';
import 'package:praxis_server/src/services/task/entities/task_answer_result.dart';
import 'package:praxis_server/src/services/task/entities/task_answer_test_case_result.dart';

class CodeExecutionService {
  static const _supportedLanguage = 'dart';
  static const _userCodePlaceholder = '{{USER_CODE}}';
  static const _inputPlaceholder = '{{INPUT}}';
  static const _legacyUserCodePlaceholder = '___';
  static const _executionTimeout = Duration(seconds: 2);
  static const _maxOutputLength = 1000;
  static final List<RegExp> _forbiddenPatterns = [
    RegExp(r"dart:io", caseSensitive: false),
    RegExp(r"dart:ffi", caseSensitive: false),
    RegExp(r"\bProcess\b"),
    RegExp(r"\bSocket\b"),
    RegExp(r"\bServerSocket\b"),
    RegExp(r"\bHttpClient\b"),
    RegExp(r"\bFile\b"),
    RegExp(r"\bDirectory\b"),
    RegExp(r"\bLink\b"),
    RegExp(r"\bPlatform\b"),
    RegExp(r"\bIsolate\b"),
    RegExp(r"\bstdin\b"),
    RegExp(r"\bstdout\b"),
    RegExp(r"\bstderr\b"),
    RegExp(r"\bexit\s*\("),
  ];

  const CodeExecutionService();

  Future<TaskAnswerResult> validateAnswer(
    TaskDto task,
    String userAnswer,
  ) async {
    final validationError = _validateExecutionPolicy(task, userAnswer);
    if (validationError != null) {
      return validationError;
    }

    final totalTestCases = task.testCases.length;
    final results = <TaskAnswerTestCaseResult>[];
    var passedTestCases = 0;

    for (final testCase in task.testCases) {
      final source = _renderProgram(
        template: task.codeTemplate!,
        userCode: userAnswer,
        testInput: testCase.input,
      );
      if (source == null) {
        return TaskAnswerResult(
          isCorrect: false,
          feedbackType: TaskAnswerFeedbackType.executionError,
          feedbackMessage:
              'Code template must contain {{USER_CODE}} or ___ placeholder and {{INPUT}} placeholder',
          xpEarned: 0,
          passedTestCases: passedTestCases,
          totalTestCases: totalTestCases,
          testCaseResults: results,
        );
      }

      final execution = await _executeSource(source);
      if (execution.kind != _ExecutionResultKind.success) {
        results.add(
          _buildExecutionFailureResult(
            testCase: testCase,
            execution: execution,
          ),
        );
        return TaskAnswerResult(
          isCorrect: false,
          feedbackType: TaskAnswerFeedbackType.executionError,
          feedbackMessage: _buildExecutionFailureMessage(execution),
          xpEarned: 0,
          passedTestCases: passedTestCases,
          totalTestCases: totalTestCases,
          testCaseResults: results,
        );
      }

      final expectedOutput = _normalizeOutput(testCase.expectedOutput);
      final actualOutput = _normalizeOutput(execution.stdout);
      final passed = actualOutput == expectedOutput;
      if (passed) {
        passedTestCases++;
      }

      results.add(
        _buildComparisonResult(
          testCase: testCase,
          passed: passed,
          expectedOutput: expectedOutput,
          actualOutput: actualOutput,
        ),
      );
    }

    if (passedTestCases == totalTestCases) {
      return TaskAnswerResult(
        isCorrect: true,
        feedbackType: TaskAnswerFeedbackType.correct,
        feedbackMessage: 'All $totalTestCases test cases passed',
        xpEarned: task.xpValue,
        passedTestCases: passedTestCases,
        totalTestCases: totalTestCases,
        testCaseResults: results,
      );
    }

    final feedbackType = passedTestCases > 0
        ? TaskAnswerFeedbackType.partiallyCorrect
        : TaskAnswerFeedbackType.incorrect;

    return TaskAnswerResult(
      isCorrect: false,
      feedbackType: feedbackType,
      feedbackMessage: '$passedTestCases of $totalTestCases test cases passed',
      xpEarned: 0,
      passedTestCases: passedTestCases,
      totalTestCases: totalTestCases,
      testCaseResults: results,
    );
  }

  TaskAnswerResult? _validateExecutionPolicy(
    TaskDto task,
    String userAnswer,
  ) {
    if ((task.programmingLanguage ?? '').trim().toLowerCase() !=
        _supportedLanguage) {
      return TaskAnswerResult(
        isCorrect: false,
        feedbackType: TaskAnswerFeedbackType.executionError,
        feedbackMessage:
            'Executable coding tasks currently support only dart language',
        xpEarned: 0,
      );
    }

    if (task.codeTemplate == null || task.codeTemplate!.trim().isEmpty) {
      return TaskAnswerResult(
        isCorrect: false,
        feedbackType: TaskAnswerFeedbackType.executionError,
        feedbackMessage: 'Executable coding task is missing code template',
        xpEarned: 0,
      );
    }

    for (final pattern in _forbiddenPatterns) {
      if (pattern.hasMatch(userAnswer)) {
        return TaskAnswerResult(
          isCorrect: false,
          feedbackType: TaskAnswerFeedbackType.executionError,
          feedbackMessage:
              'Submitted code uses restricted APIs and cannot be executed',
          xpEarned: 0,
        );
      }
    }

    return null;
  }

  String? _renderProgram({
    required String template,
    required String userCode,
    required String testInput,
  }) {
    if (!template.contains(_inputPlaceholder)) {
      return null;
    }

    String rendered;
    if (template.contains(_userCodePlaceholder)) {
      rendered = template.replaceAll(_userCodePlaceholder, userCode);
    } else if (template.contains(_legacyUserCodePlaceholder)) {
      rendered = template.replaceAll(_legacyUserCodePlaceholder, userCode);
    } else {
      return null;
    }

    return rendered.replaceAll(_inputPlaceholder, testInput);
  }

  Future<_CodeExecutionResult> _executeSource(String source) async {
    final tempDirectory = await Directory.systemTemp.createTemp(
      'praxis_code_runner_',
    );
    final scriptFile = File('${tempDirectory.path}/main.dart');

    try {
      await scriptFile.writeAsString(source);
      final process = await Process.start(
        _resolveDartExecutable(),
        ['--disable-dart-dev', scriptFile.path],
        workingDirectory: tempDirectory.path,
        runInShell: false,
      );

      final stdoutFuture = process.stdout.transform(utf8.decoder).join();
      final stderrFuture = process.stderr.transform(utf8.decoder).join();

      try {
        final exitCode = await process.exitCode.timeout(_executionTimeout);
        final stdout = await stdoutFuture;
        final stderr = await stderrFuture;

        if (exitCode != 0) {
          return _CodeExecutionResult(
            kind: _ExecutionResultKind.runtimeError,
            stdout: _truncate(stdout),
            stderr: _truncate(stderr),
          );
        }

        return _CodeExecutionResult(
          kind: _ExecutionResultKind.success,
          stdout: _truncate(stdout),
          stderr: _truncate(stderr),
        );
      } on TimeoutException {
        process.kill(ProcessSignal.sigkill);
        try {
          await process.exitCode;
        } catch (_) {}
        return const _CodeExecutionResult(
          kind: _ExecutionResultKind.timeout,
          stdout: '',
          stderr: '',
        );
      }
    } on ProcessException catch (error) {
      return _CodeExecutionResult(
        kind: _ExecutionResultKind.runtimeError,
        stdout: '',
        stderr: _truncate(error.message),
      );
    } finally {
      if (await tempDirectory.exists()) {
        await tempDirectory.delete(recursive: true);
      }
    }
  }

  TaskAnswerTestCaseResult _buildExecutionFailureResult({
    required TaskTestCaseDto testCase,
    required _CodeExecutionResult execution,
  }) {
    if (testCase.isHidden) {
      return TaskAnswerTestCaseResult(
        passed: false,
        isHidden: true,
        message: _buildHiddenFailureMessage(execution.kind),
      );
    }

    return TaskAnswerTestCaseResult(
      passed: false,
      isHidden: false,
      input: testCase.input,
      expectedOutput: testCase.expectedOutput,
      actualOutput: execution.stdout.isEmpty ? null : execution.stdout,
      message: _buildVisibleFailureMessage(execution),
    );
  }

  TaskAnswerTestCaseResult _buildComparisonResult({
    required TaskTestCaseDto testCase,
    required bool passed,
    required String expectedOutput,
    required String actualOutput,
  }) {
    if (testCase.isHidden) {
      return TaskAnswerTestCaseResult(
        passed: passed,
        isHidden: true,
        message: passed ? 'Hidden test passed' : 'A hidden test failed',
      );
    }

    return TaskAnswerTestCaseResult(
      passed: passed,
      isHidden: false,
      input: testCase.input,
      expectedOutput: expectedOutput,
      actualOutput: actualOutput,
      message: passed ? 'Test passed' : 'Output mismatch',
    );
  }

  String _buildExecutionFailureMessage(_CodeExecutionResult execution) {
    return switch (execution.kind) {
      _ExecutionResultKind.timeout => 'Code execution timed out',
      _ExecutionResultKind.runtimeError =>
        execution.stderr.isNotEmpty
            ? 'Code execution failed: ${execution.stderr}'
            : 'Code execution failed',
      _ExecutionResultKind.success => 'Code execution failed',
    };
  }

  String _buildHiddenFailureMessage(_ExecutionResultKind kind) {
    return switch (kind) {
      _ExecutionResultKind.timeout => 'A hidden test timed out',
      _ExecutionResultKind.runtimeError =>
        'A hidden test failed during execution',
      _ExecutionResultKind.success => 'A hidden test failed',
    };
  }

  String _buildVisibleFailureMessage(_CodeExecutionResult execution) {
    return switch (execution.kind) {
      _ExecutionResultKind.timeout => 'Execution timed out',
      _ExecutionResultKind.runtimeError =>
        execution.stderr.isNotEmpty
            ? 'Execution failed: ${execution.stderr}'
            : 'Execution failed',
      _ExecutionResultKind.success => 'Execution failed',
    };
  }

  String _normalizeOutput(String output) {
    return output.replaceAll('\r\n', '\n').trim();
  }

  String _truncate(String output) {
    final normalized = output.trim();
    if (normalized.length <= _maxOutputLength) {
      return normalized;
    }
    return '${normalized.substring(0, _maxOutputLength)}...';
  }

  String _resolveDartExecutable() {
    final configuredExecutable = Platform.environment['PRAXIS_DART_EXECUTABLE']
        ?.trim();
    if (configuredExecutable != null && configuredExecutable.isNotEmpty) {
      return configuredExecutable;
    }

    return 'dart';
  }
}

enum _ExecutionResultKind { success, runtimeError, timeout }

class _CodeExecutionResult {
  final _ExecutionResultKind kind;
  final String stdout;
  final String stderr;

  const _CodeExecutionResult({
    required this.kind,
    required this.stdout,
    required this.stderr,
  });
}
