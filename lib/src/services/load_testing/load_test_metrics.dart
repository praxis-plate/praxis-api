class LoadTestScenarioMetrics {
  final String scenario;
  final int totalRequests;
  final int successCount;
  final int errorCount;
  final double errorRatePercent;
  final double minMs;
  final double meanMs;
  final double p50Ms;
  final double p95Ms;
  final double maxMs;
  final int totalDurationMs;
  final double requestsPerSecond;
  final Map<String, int> errorKinds;

  const LoadTestScenarioMetrics({
    required this.scenario,
    required this.totalRequests,
    required this.successCount,
    required this.errorCount,
    required this.errorRatePercent,
    required this.minMs,
    required this.meanMs,
    required this.p50Ms,
    required this.p95Ms,
    required this.maxMs,
    required this.totalDurationMs,
    required this.requestsPerSecond,
    required this.errorKinds,
  });

  Map<String, dynamic> toJson() {
    return {
      'scenario': scenario,
      'totalRequests': totalRequests,
      'successCount': successCount,
      'errorCount': errorCount,
      'errorRatePercent': errorRatePercent,
      'minMs': minMs,
      'meanMs': meanMs,
      'p50Ms': p50Ms,
      'p95Ms': p95Ms,
      'maxMs': maxMs,
      'totalDurationMs': totalDurationMs,
      'requestsPerSecond': requestsPerSecond,
      'errorKinds': errorKinds,
    };
  }
}

class LoadTestScenarioRecorder {
  final String scenario;
  final List<int> _latencyMicros = [];
  final Map<String, int> _errorKinds = {};
  int _successCount = 0;
  int _errorCount = 0;

  LoadTestScenarioRecorder(this.scenario);

  void recordSuccess(Duration duration) {
    _latencyMicros.add(duration.inMicroseconds);
    _successCount++;
  }

  void recordFailure(Duration duration, Object error) {
    _latencyMicros.add(duration.inMicroseconds);
    _errorCount++;
    final key = error.toString().split('\n').first.trim();
    _errorKinds.update(key, (count) => count + 1, ifAbsent: () => 1);
  }

  LoadTestScenarioMetrics build({required Duration totalDuration}) {
    final latencies = List<int>.from(_latencyMicros)..sort();
    final totalRequests = _successCount + _errorCount;

    if (totalRequests == 0) {
      return LoadTestScenarioMetrics(
        scenario: scenario,
        totalRequests: 0,
        successCount: 0,
        errorCount: 0,
        errorRatePercent: 0,
        minMs: 0,
        meanMs: 0,
        p50Ms: 0,
        p95Ms: 0,
        maxMs: 0,
        totalDurationMs: totalDuration.inMilliseconds,
        requestsPerSecond: 0,
        errorKinds: const {},
      );
    }

    final totalMicros = latencies.fold<int>(0, (sum, value) => sum + value);
    final totalDurationMs = totalDuration.inMilliseconds;
    final durationSeconds = totalDuration.inMicroseconds <= 0
        ? 0.0
        : totalDuration.inMicroseconds / 1000000;

    return LoadTestScenarioMetrics(
      scenario: scenario,
      totalRequests: totalRequests,
      successCount: _successCount,
      errorCount: _errorCount,
      errorRatePercent: _errorCount * 100 / totalRequests,
      minMs: _toMilliseconds(latencies.first),
      meanMs: _toMilliseconds(totalMicros / totalRequests),
      p50Ms: _percentileMs(latencies, 0.50),
      p95Ms: _percentileMs(latencies, 0.95),
      maxMs: _toMilliseconds(latencies.last),
      totalDurationMs: totalDurationMs,
      requestsPerSecond: durationSeconds <= 0
          ? 0
          : totalRequests / durationSeconds,
      errorKinds: Map<String, int>.unmodifiable(_errorKinds),
    );
  }

  static double _percentileMs(List<int> sortedValues, double percentile) {
    if (sortedValues.isEmpty) {
      return 0;
    }

    final rank = (percentile * sortedValues.length).ceil().clamp(
      1,
      sortedValues.length,
    );
    return _toMilliseconds(sortedValues[rank - 1]);
  }

  static double _toMilliseconds(num microseconds) {
    return microseconds / 1000;
  }
}
