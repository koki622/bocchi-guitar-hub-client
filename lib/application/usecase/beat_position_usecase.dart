import 'package:bocchi_guitar_hub_client/application/notifier/beat_position/beat_position_notifier.dart';
import 'package:bocchi_guitar_hub_client/domain/entity/song_elements/beat/beat.dart';

class BeatPositionUsecase {
  final BeatPositionNotifier _beatPositionNotifier;
  final List<Beat> _beats;

  const BeatPositionUsecase(this._beatPositionNotifier, this._beats);

  List<Beat> get getBeats => _beats;
}
