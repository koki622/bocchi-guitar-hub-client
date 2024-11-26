import 'package:hive_flutter/hive_flutter.dart';

import '../../../core/constant/reference/hive_box.dart';
import '../../model/remote_job/job_status.dart';

class JobStatusHive {
  final Box<JobStatusData> _box =
      Hive.box<JobStatusData>(HiveBoxConstant.jobStatusBoxName);

  Future<void> create(JobStatusData jobStatus, int songId) async {
    await _box.put(songId, jobStatus);
  }

  Future<void> delete(int key) async {
    await _box.delete(key);
  }

  Future<void> update(JobStatusData jobStatus, int key) async {
    await _box.put(key, jobStatus);
  }

  JobStatusData? readJobStatus(int key) {
    return _box.get(key);
  }

  List<JobStatusData?> readAllJobStatuses() {
    return _box.values.toList();
  }
}
