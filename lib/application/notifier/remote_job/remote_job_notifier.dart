import 'package:bocchi_guitar_hub_client/domain/entity/remote_job/remote_job_status.dart';
import 'package:bocchi_guitar_hub_client/infrastructure/infrastructure_module.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'remote_job_notifier.g.dart';

@riverpod
class RemoteJobNotifier extends _$RemoteJobNotifier {
  @override
  RemoteJobStatus? build(int songId) {
    return ref
        .watch(remoteJobRepositoryProvider)
        .fetchRemoteJobStatus(songId: songId);
  }

  void update(RemoteJobStatus remoteJobStatus) {
    state = remoteJobStatus.copyWith();
  }
}
