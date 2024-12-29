import 'package:bocchi_guitar_hub_client/core/enum/job_status.dart';
import 'package:bocchi_guitar_hub_client/core/enum/process.dart';

class RemoteJobStrings {
  static const Map<RemoteJobType, String> displayNames = {
    RemoteJobType.chordAnalysis: 'コード進行を解析',
    RemoteJobType.separating: 'パート別音源分離',
    RemoteJobType.extractingSpectrograms: 'スペクトログラム抽出',
    RemoteJobType.structureAnalysis: '音楽構造を解析',
    RemoteJobType.lyricAnalysis: '歌詞を解析'
  };
}

class JobStatusStrings {
  static const Map<JobStatusType, String?> displayNames = {
    //JobStatusType.enqueueSuccess: 'リクエストをジョブキューに追加',
    //JobStatusType.queued: 'キューで待機中',
    JobStatusType.processingSoon: '処理中',
    JobStatusType.jobCompleted: '処理完了',
    JobStatusType.jobSuccess: '処理に成功',
    JobStatusType.jobFailed: '処理に失敗'
  };

  static String? displayQueue(int? queue) {
    if (queue == null) return null;
    if (queue < 0) return null;
    return '現在の順番:${queue.toString()}';
  }
}
