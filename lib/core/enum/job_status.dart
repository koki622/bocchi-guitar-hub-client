enum JobStatusType implements Comparable<JobStatusType> {
  enqueueSuccess(value: 'enqueueSuccess', message: 'enqueue success'),
  queued(value: 'queued', message: 'queued'),
  processingSoon(value: 'processingSoon', message: 'processing soon'),
  jobSuccess(value: 'jobSuccess', message: 'job success'),
  jobFailed(value: 'jobFailed', message: 'job failed');

  const JobStatusType({required this.value, required this.message});

  final String value;
  final String message;

  @override
  int compareTo(JobStatusType other) => message.compareTo(other.message);

  static JobStatusType fromMessage(String message) {
    return JobStatusType.values.firstWhere(
      (element) => element.message == message,
      orElse: () => throw ArgumentError('Invalid JobStatusType: $message'),
    );
  }
}
