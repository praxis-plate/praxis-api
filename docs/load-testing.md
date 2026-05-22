# Load Testing

This document describes the reproducible backend load-testing workflow for `praxis_server`.

## What is included

- `bin/generate_load_test_data.dart`
  Creates a deterministic development dataset for load testing.
- `bin/run_load_test.dart`
  Executes real Serverpod endpoint scenarios against the API server and reports latency and error metrics.

## Dataset profile

Default generated profile:

- `40` published courses
- `4-6` modules per course
- `5-10` lessons per module
- `3-5` tasks per lesson
- multiple supported task types:
  - `multipleChoice`
  - `codeCompletion`
  - `matching`
  - `textInput`

The generator is idempotent for a given title prefix. Existing generated courses are reused and only missing indices are created.

Default generated learner credentials for authenticated runs:

- email: `loadtest.learner@praxis.local`
- password: `LoadTest123!`

## Recommended workflow

1. Apply migrations and start the API server:

```bash
fvm dart run bin/main.dart --apply-migrations
```

2. In a second terminal, generate load-test data:

```bash
fvm dart run bin/generate_load_test_data.dart --course-count=40
```

3. Run the read profile with the baseline thesis target:

```bash
fvm dart run bin/run_load_test.dart \
  --profile=read \
  --clients=20 \
  --requests-per-scenario=250 \
  --json-out=build/load-test-read.json
```

This produces `1000` measured read requests in total.

4. Run the answer profile separately:

```bash
fvm dart run bin/run_load_test.dart \
  --profile=answer \
  --clients=20 \
  --requests-per-scenario=1000 \
  --json-out=build/load-test-answer.json
```

## Measured scenarios

Read profile:

- `health.ping`
- `course.get`
- `course.getTableOfContents`
- `task.getByLessonId`

Answer profile:

- `task.answer`

Mixed profile combines all scenarios and distributes them uniformly across the configured request count.

## Reported metrics

For every scenario and for the overall run the script prints:

- total requests
- successful requests
- failed requests
- error rate
- minimum latency
- mean latency
- `p50`
- `p95`
- maximum latency
- total execution time
- requests per second

Percentiles are calculated with the nearest-rank method on the measured latency sample.

## Notes for thesis usage

- Use the `read` and `answer` profiles as separate benchmark tables.
- Keep the same seed prefix and the same client/request configuration across repeated runs.
- If you need stricter reproducibility, keep the default `--shuffle-seed=42`.
- The load test targets the `apiServer`, not the `webServer`.
