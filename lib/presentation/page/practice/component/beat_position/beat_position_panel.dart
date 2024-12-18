import 'package:bocchi_guitar_hub_client/application/application_module.dart';
import 'package:bocchi_guitar_hub_client/application/notifier/beat_position/beat_position_notifier.dart';
import 'package:bocchi_guitar_hub_client/application/usecase/audio_player_usecase.dart';
import 'package:bocchi_guitar_hub_client/application/usecase/beat_position_usecase.dart';
import 'package:bocchi_guitar_hub_client/domain/entity/song/song.dart';
import 'package:bocchi_guitar_hub_client/domain/entity/song_elements/beat/beat.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class BeatPositionPanel extends ConsumerWidget {
  final Song song;

  const BeatPositionPanel({super.key, required this.song});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final beatPositionUsecase = ref.watch(BeatPositionUsecaseProvider(song));
    return BeatBox(beatPositionUsecase: beatPositionUsecase);
  }
}

class BeatBox extends ConsumerStatefulWidget {
  final BeatPositionUsecase beatPositionUsecase;
  const BeatBox({super.key, required this.beatPositionUsecase});

  @override
  ConsumerState<BeatBox> createState() {
    return _BeatBoxState(beatPositionUsecase: beatPositionUsecase);
  }
}

class _BeatBoxState extends ConsumerState<BeatBox> {
  final BeatPositionUsecase beatPositionUsecase;
  late final List<Beat> _beats;
  late int _currentIndex;
  _BeatBoxState({required this.beatPositionUsecase});

  @override
  void initState() {
    super.initState();
    _beats = beatPositionUsecase.getBeats;
    _currentIndex = ref.read(beatPositionNotifierProvider(_beats));
  }

  @override
  Widget build(BuildContext context) {
    /**
     * 
    ref.listen<int>(beatPositionNotifierProvider(_beats), (previous, next) {

    });
     */
    _currentIndex = ref.watch(beatPositionNotifierProvider(_beats));
    return Text(_beats[_currentIndex].beatPosition.toString());
  }
}
