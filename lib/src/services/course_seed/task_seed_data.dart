import 'dart:convert';

import 'package:praxis_server/src/generated/protocol.dart';
import 'package:praxis_server/src/services/course_seed/course_seed_models.dart';

class TaskSeedData {
  static List<TaskSeed> getTasksForLesson(
    String lessonTitle,
    String moduleTitle,
  ) {
    if (moduleTitle == 'Variables and Data Types') {
      return _variablesTasks(lessonTitle);
    } else if (moduleTitle == 'Functions') {
      return _functionsTasks(lessonTitle);
    } else if (moduleTitle == 'Loops and Iteration') {
      return _loopsTasks(lessonTitle);
    }
    return _createGenericTasks(lessonTitle);
  }

  static List<TaskSeed> _variablesTasks(String lessonTitle) {
    if (lessonTitle == 'Introduction to Variables') {
      return _introToVariablesTasks();
    } else if (lessonTitle == 'Primitive Data Types') {
      return _primitiveDataTypesTasks();
    } else if (lessonTitle == 'Type Conversion') {
      return _typeConversionTasks();
    }
    return _createGenericTasks(lessonTitle);
  }

  static List<TaskSeed> _functionsTasks(String lessonTitle) {
    if (lessonTitle == 'Function Basics') {
      return _functionBasicsTasks();
    } else if (lessonTitle == 'Parameters and Arguments') {
      return _parametersTasks();
    }
    return _createGenericTasks(lessonTitle);
  }

  static List<TaskSeed> _loopsTasks(String lessonTitle) {
    if (lessonTitle == 'For Loops') {
      return _forLoopsTasks();
    } else if (lessonTitle == 'While Loops') {
      return _whileLoopsTasks();
    }
    return _createGenericTasks(lessonTitle);
  }

  static List<TaskSeed> _introToVariablesTasks() {
    return [
      TaskSeed(
        taskType: TaskType.multipleChoice,
        questionText: 'What is a variable in programming?',
        correctAnswer: 'A container for storing data values',
        options: const [
          'A container for storing data values',
          'A type of loop',
          'A function that returns nothing',
          'A constant value that never changes',
        ],
        codeTemplate: null,
        testCasesJson: null,
        programmingLanguage: null,
        difficultyLevel: 1,
        xpValue: 10,
        orderIndex: 0,
        fallbackHint: 'Think about what variables do in a program',
        fallbackExplanation:
            'Variables are containers that store data values which can change during program execution.',
        topic: 'variables',
      ),
      TaskSeed(
        taskType: TaskType.multipleChoice,
        questionText: 'Which keyword is used to declare a variable in Dart?',
        correctAnswer: 'var',
        options: const ['var', 'let', 'variable', 'declare'],
        codeTemplate: null,
        testCasesJson: null,
        programmingLanguage: 'dart',
        difficultyLevel: 1,
        xpValue: 10,
        orderIndex: 1,
        fallbackHint: 'Look at the Dart syntax examples',
        fallbackExplanation:
            'In Dart, you can use var, int, String, or other type names to declare variables.',
        topic: 'variables',
      ),
      TaskSeed(
        taskType: TaskType.codeCompletion,
        questionText:
            'Complete the code to declare a variable named age with value 25',
        correctAnswer: 'var age = 25;',
        options: null,
        codeTemplate: 'var age = ___;',
        testCasesJson: null,
        programmingLanguage: 'dart',
        difficultyLevel: 2,
        xpValue: 15,
        orderIndex: 2,
        fallbackHint: 'Use an integer value',
        fallbackExplanation:
            'To declare a variable, use var followed by the name and assign a value with =',
        topic: 'variables',
      ),
      TaskSeed(
        taskType: TaskType.matching,
        questionText: 'Match the variable declaration with its description',
        correctAnswer: jsonEncode({
          'var name = "Alice"': 'String variable',
          'int count = 10': 'Integer variable',
          'bool isActive = true': 'Boolean variable',
        }),
        options: null,
        codeTemplate: null,
        testCasesJson: null,
        programmingLanguage: 'dart',
        difficultyLevel: 2,
        xpValue: 15,
        orderIndex: 3,
        fallbackHint: 'Look at the data types',
        fallbackExplanation:
            'Each variable type stores different kinds of data: String for text, int for numbers, bool for true/false.',
        topic: 'variables',
      ),
      TaskSeed(
        taskType: TaskType.multipleChoice,
        questionText:
            'What happens when you declare a variable without initializing it?',
        correctAnswer: 'It has a null value by default',
        options: const [
          'It has a null value by default',
          'It causes a compile error',
          'It automatically gets value 0',
          'It gets deleted immediately',
        ],
        codeTemplate: null,
        testCasesJson: null,
        programmingLanguage: 'dart',
        difficultyLevel: 3,
        xpValue: 20,
        orderIndex: 4,
        fallbackHint: 'Think about uninitialized variables',
        fallbackExplanation:
            'In Dart, uninitialized variables have null value by default unless they are non-nullable.',
        topic: 'variables',
      ),
    ];
  }

  static List<TaskSeed> _primitiveDataTypesTasks() {
    return [
      TaskSeed(
        taskType: TaskType.multipleChoice,
        questionText: 'Which data type is used for whole numbers?',
        correctAnswer: 'int',
        options: const ['int', 'double', 'String', 'bool'],
        codeTemplate: null,
        testCasesJson: null,
        programmingLanguage: null,
        difficultyLevel: 1,
        xpValue: 10,
        orderIndex: 0,
        fallbackHint: 'Think about integer numbers',
        fallbackExplanation: 'int is used for whole numbers without decimals.',
        topic: 'data_types',
      ),
      TaskSeed(
        taskType: TaskType.multipleChoice,
        questionText: 'What data type would you use to store the value 3.14?',
        correctAnswer: 'double',
        options: const ['int', 'double', 'String', 'num'],
        codeTemplate: null,
        testCasesJson: null,
        programmingLanguage: null,
        difficultyLevel: 2,
        xpValue: 15,
        orderIndex: 1,
        fallbackHint: 'This is a decimal number',
        fallbackExplanation: 'double is used for decimal numbers.',
        topic: 'data_types',
      ),
      TaskSeed(
        taskType: TaskType.codeCompletion,
        questionText:
            'Declare a boolean variable named isValid with value true',
        correctAnswer: 'bool isValid = true;',
        options: null,
        codeTemplate: 'bool isValid = ___;',
        testCasesJson: null,
        programmingLanguage: 'dart',
        difficultyLevel: 2,
        xpValue: 15,
        orderIndex: 2,
        fallbackHint: 'Use true or false',
        fallbackExplanation: 'Boolean variables can only be true or false.',
        topic: 'data_types',
      ),
      TaskSeed(
        taskType: TaskType.multipleChoice,
        questionText: 'Which data type is used for text?',
        correctAnswer: 'String',
        options: const ['String', 'Text', 'char', 'str'],
        codeTemplate: null,
        testCasesJson: null,
        programmingLanguage: null,
        difficultyLevel: 1,
        xpValue: 10,
        orderIndex: 3,
        fallbackHint: 'Think about text data',
        fallbackExplanation: 'String is used to store sequences of characters.',
        topic: 'data_types',
      ),
      TaskSeed(
        taskType: TaskType.matching,
        questionText: 'Match the data type with its example',
        correctAnswer: jsonEncode({
          'int': '42',
          'double': '3.14',
          'String': 'Hello',
          'bool': 'true',
        }),
        options: null,
        codeTemplate: null,
        testCasesJson: null,
        programmingLanguage: 'dart',
        difficultyLevel: 2,
        xpValue: 15,
        orderIndex: 4,
        fallbackHint: 'Think about what each type represents',
        fallbackExplanation:
            'Each data type represents a specific kind of value: int for whole numbers, double for decimals, String for text, bool for true/false.',
        topic: 'data_types',
      ),
    ];
  }

  static List<TaskSeed> _typeConversionTasks() {
    return [
      TaskSeed(
        taskType: TaskType.multipleChoice,
        questionText: 'How do you convert a String to an int in Dart?',
        correctAnswer: 'int.parse()',
        options: const ['int.parse()', 'toInt()', 'parseInt()', 'convert()'],
        codeTemplate: null,
        testCasesJson: null,
        programmingLanguage: 'dart',
        difficultyLevel: 2,
        xpValue: 15,
        orderIndex: 0,
        fallbackHint: 'Look for a parsing method',
        fallbackExplanation:
            'int.parse() is used to convert a String to an integer in Dart.',
        topic: 'type_conversion',
      ),
      TaskSeed(
        taskType: TaskType.codeCompletion,
        questionText: 'Convert the string "123" to an integer',
        correctAnswer: 'int.parse("123")',
        options: null,
        codeTemplate: 'int number = ___; // convert "123"',
        testCasesJson: null,
        programmingLanguage: 'dart',
        difficultyLevel: 2,
        xpValue: 15,
        orderIndex: 1,
        fallbackHint: 'Use int.parse()',
        fallbackExplanation:
            'Use int.parse("123") to convert the string to an integer.',
        topic: 'type_conversion',
      ),
      TaskSeed(
        taskType: TaskType.multipleChoice,
        questionText: 'What method converts a number to a String?',
        correctAnswer: 'toString()',
        options: const ['toString()', 'string()', 'toStr()', 'convert()'],
        codeTemplate: null,
        testCasesJson: null,
        programmingLanguage: null,
        difficultyLevel: 1,
        xpValue: 10,
        orderIndex: 2,
        fallbackHint: 'Look for a method on the number',
        fallbackExplanation:
            'Use toString() on a number to convert it to a String.',
        topic: 'type_conversion',
      ),
      TaskSeed(
        taskType: TaskType.matching,
        questionText: 'Match the conversion with the result type',
        correctAnswer: jsonEncode({
          'int.parse("42")': 'int',
          'double.parse("3.14")': 'double',
          '42.toString()': 'String',
        }),
        options: null,
        codeTemplate: null,
        testCasesJson: null,
        programmingLanguage: 'dart',
        difficultyLevel: 3,
        xpValue: 20,
        orderIndex: 3,
        fallbackHint: 'Think about what each method returns',
        fallbackExplanation:
            'Parsing methods convert strings to numbers, while toString converts numbers to strings.',
        topic: 'type_conversion',
      ),
      TaskSeed(
        taskType: TaskType.multipleChoice,
        questionText: 'What happens if int.parse() fails?',
        correctAnswer: 'It throws an exception',
        options: const [
          'It throws an exception',
          'It returns 0',
          'It returns null',
          'It returns -1',
        ],
        codeTemplate: null,
        testCasesJson: null,
        programmingLanguage: null,
        difficultyLevel: 3,
        xpValue: 20,
        orderIndex: 4,
        fallbackHint: 'Think about error handling',
        fallbackExplanation:
            'int.parse() throws a FormatException if the string cannot be parsed as an integer.',
        topic: 'type_conversion',
      ),
    ];
  }

  static List<TaskSeed> _functionBasicsTasks() {
    return [
      TaskSeed(
        taskType: TaskType.multipleChoice,
        questionText: 'What is a function?',
        correctAnswer: 'A reusable block of code that performs a specific task',
        options: const [
          'A reusable block of code that performs a specific task',
          'A type of variable',
          'A loop that never ends',
          'A class property',
        ],
        codeTemplate: null,
        testCasesJson: null,
        programmingLanguage: null,
        difficultyLevel: 1,
        xpValue: 10,
        orderIndex: 0,
        fallbackHint: 'Think about why we use functions',
        fallbackExplanation:
            'Functions let you group reusable code and call it multiple times.',
        topic: 'functions',
      ),
      TaskSeed(
        taskType: TaskType.codeCompletion,
        questionText: 'Complete the function to return the sum of two numbers',
        correctAnswer: 'return a + b;',
        options: null,
        codeTemplate: 'int add(int a, int b) { ___ }',
        testCasesJson: null,
        programmingLanguage: 'dart',
        difficultyLevel: 2,
        xpValue: 15,
        orderIndex: 1,
        fallbackHint: 'Use return to output the sum',
        fallbackExplanation:
            'Functions return values using the return keyword.',
        topic: 'functions',
      ),
      TaskSeed(
        taskType: TaskType.multipleChoice,
        questionText: 'Which keyword is used to define a function in Dart?',
        correctAnswer: 'No keyword is required',
        options: const [
          'No keyword is required',
          'function',
          'def',
          'fn',
        ],
        codeTemplate: null,
        testCasesJson: null,
        programmingLanguage: 'dart',
        difficultyLevel: 1,
        xpValue: 10,
        orderIndex: 2,
        fallbackHint: 'Look at Dart function syntax',
        fallbackExplanation:
            'Dart defines functions by specifying a return type and name, without a special keyword.',
        topic: 'functions',
      ),
      TaskSeed(
        taskType: TaskType.textInput,
        questionText:
            'What is the return type of a function that returns nothing?',
        correctAnswer: 'void',
        options: null,
        codeTemplate: null,
        testCasesJson: null,
        programmingLanguage: null,
        difficultyLevel: 1,
        xpValue: 10,
        orderIndex: 3,
        fallbackHint: 'Think about empty returns',
        fallbackExplanation:
            'Functions that return nothing have a void return type.',
        topic: 'functions',
      ),
      TaskSeed(
        taskType: TaskType.matching,
        questionText: 'Match function parts with their descriptions',
        correctAnswer: jsonEncode({
          'Function name': 'Identifies the function',
          'Parameters': 'Input values',
          'Return type': 'Type of output',
          'Function body': 'Code to execute',
        }),
        options: null,
        codeTemplate: null,
        testCasesJson: null,
        programmingLanguage: null,
        difficultyLevel: 2,
        xpValue: 15,
        orderIndex: 4,
        fallbackHint: 'Think about function structure',
        fallbackExplanation: 'Each part has a specific role in the function.',
        topic: 'functions',
      ),
    ];
  }

  static List<TaskSeed> _parametersTasks() {
    return _createGenericTasks('Parameters');
  }

  static List<TaskSeed> _forLoopsTasks() {
    return _createGenericTasks('For Loops');
  }

  static List<TaskSeed> _whileLoopsTasks() {
    return _createGenericTasks('While Loops');
  }

  static List<TaskSeed> _createGenericTasks(String topic) {
    final tasks = <TaskSeed>[];
    final topicLower = topic.toLowerCase().replaceAll(' ', '_');

    for (int i = 0; i < 7; i++) {
      final difficulty = (i ~/ 2) + 1;
      final xp = difficulty * 10;
      final taskType = TaskType.values[i % TaskType.values.length];

      tasks.add(
        TaskSeed(
          taskType: taskType,
          questionText: 'Question ${i + 1} about $topic',
          correctAnswer: _getCorrectAnswer(taskType, i),
          options: taskType == TaskType.multipleChoice
              ? [
                  _getCorrectAnswer(taskType, i),
                  'Option B',
                  'Option C',
                  'Option D',
                ]
              : null,
          codeTemplate: taskType == TaskType.codeCompletion
              ? '// Complete this code\nvar result = ___;'
              : null,
          testCasesJson: null,
          programmingLanguage: 'dart',
          difficultyLevel: difficulty.clamp(1, 5),
          xpValue: xp,
          orderIndex: i,
          fallbackHint: 'Think about $topic concepts',
          fallbackExplanation: 'This tests your understanding of $topic.',
          topic: topicLower,
        ),
      );
    }

    return tasks;
  }

  static String _getCorrectAnswer(TaskType taskType, int index) {
    if (taskType == TaskType.multipleChoice) {
      return 'Correct answer ${index + 1}';
    } else if (taskType == TaskType.codeCompletion) {
      return 'result';
    } else if (taskType == TaskType.matching) {
      return jsonEncode({'Term A': 'Definition A', 'Term B': 'Definition B'});
    } else {
      return 'Answer ${index + 1}';
    }
  }
}
