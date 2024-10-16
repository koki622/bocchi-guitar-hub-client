import 'package:hive/hive.dart';

import '../../../core/constant/reference/hive_box.dart';
import '../../model/job_status.dart';

class JobStatusHive {
  final Box<JobStatusData> box =
      Hive.box<JobStatusData>(HiveBoxConstant.jobStatusBoxName);

  Future<void> create(JobStatusData jobStatus, int songId) async {
    // songId と jobStatusを組み合わせてキーを作成
    String key = '${songId}_${jobStatus.jobStatus}';
    await box.put(key, jobStatus);
  }

  Future<void> delete(String key) async {
    await box.delete(key);
  }

  Future<void> update(JobStatusData jobStatus, String key) async {
    await box.put(key, jobStatus);
  }

  JobStatusData? readJobStatus(String key) {
    return box.get(key);
  }

  List<JobStatusData?> readAllJobStatuses() {
    return box.values.toList();
  }
}
