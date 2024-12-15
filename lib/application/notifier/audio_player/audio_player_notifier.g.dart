// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'audio_player_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$audioPlayerHash() => r'3f22de286b17ef957dc6ade6364006aa825a5bb8';

/// Copied from Dart SDK
class _SystemHash {
  _SystemHash._();

  static int combine(int hash, int value) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + value);
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x0007ffff & hash) << 10));
    return hash ^ (hash >> 6);
  }

  static int finish(int hash) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x03ffffff & hash) << 3));
    // ignore: parameter_assignments
    hash = hash ^ (hash >> 11);
    return 0x1fffffff & (hash + ((0x00003fff & hash) << 15));
  }
}

/// See also [audioPlayer].
@ProviderFor(audioPlayer)
const audioPlayerProvider = AudioPlayerFamily();

/// See also [audioPlayer].
class AudioPlayerFamily extends Family<AsyncValue<AudioPlayerState>> {
  /// See also [audioPlayer].
  const AudioPlayerFamily();

  /// See also [audioPlayer].
  AudioPlayerProvider call(
    Song song,
    Map<SoundType, PlaybackVolumeState> initVolumes,
  ) {
    return AudioPlayerProvider(
      song,
      initVolumes,
    );
  }

  @override
  AudioPlayerProvider getProviderOverride(
    covariant AudioPlayerProvider provider,
  ) {
    return call(
      provider.song,
      provider.initVolumes,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'audioPlayerProvider';
}

/// See also [audioPlayer].
class AudioPlayerProvider extends AutoDisposeFutureProvider<AudioPlayerState> {
  /// See also [audioPlayer].
  AudioPlayerProvider(
    Song song,
    Map<SoundType, PlaybackVolumeState> initVolumes,
  ) : this._internal(
          (ref) => audioPlayer(
            ref as AudioPlayerRef,
            song,
            initVolumes,
          ),
          from: audioPlayerProvider,
          name: r'audioPlayerProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$audioPlayerHash,
          dependencies: AudioPlayerFamily._dependencies,
          allTransitiveDependencies:
              AudioPlayerFamily._allTransitiveDependencies,
          song: song,
          initVolumes: initVolumes,
        );

  AudioPlayerProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.song,
    required this.initVolumes,
  }) : super.internal();

  final Song song;
  final Map<SoundType, PlaybackVolumeState> initVolumes;

  @override
  Override overrideWith(
    FutureOr<AudioPlayerState> Function(AudioPlayerRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: AudioPlayerProvider._internal(
        (ref) => create(ref as AudioPlayerRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        song: song,
        initVolumes: initVolumes,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<AudioPlayerState> createElement() {
    return _AudioPlayerProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is AudioPlayerProvider &&
        other.song == song &&
        other.initVolumes == initVolumes;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, song.hashCode);
    hash = _SystemHash.combine(hash, initVolumes.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin AudioPlayerRef on AutoDisposeFutureProviderRef<AudioPlayerState> {
  /// The parameter `song` of this provider.
  Song get song;

  /// The parameter `initVolumes` of this provider.
  Map<SoundType, PlaybackVolumeState> get initVolumes;
}

class _AudioPlayerProviderElement
    extends AutoDisposeFutureProviderElement<AudioPlayerState>
    with AudioPlayerRef {
  _AudioPlayerProviderElement(super.provider);

  @override
  Song get song => (origin as AudioPlayerProvider).song;
  @override
  Map<SoundType, PlaybackVolumeState> get initVolumes =>
      (origin as AudioPlayerProvider).initVolumes;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
