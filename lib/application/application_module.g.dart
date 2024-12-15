// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'application_module.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$songUsecaseHash() => r'd97c43b78e6affa43c8f21da92d76eeaa03f9ba4';

/// See also [songUsecase].
@ProviderFor(songUsecase)
final songUsecaseProvider = AutoDisposeProvider<SongUsecase>.internal(
  songUsecase,
  name: r'songUsecaseProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$songUsecaseHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef SongUsecaseRef = AutoDisposeProviderRef<SongUsecase>;
String _$audioPlayerUsecaseHash() =>
    r'b9fac63f3d8cff1f005c27de2e67bace68850546';

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

/// See also [audioPlayerUsecase].
@ProviderFor(audioPlayerUsecase)
const audioPlayerUsecaseProvider = AudioPlayerUsecaseFamily();

/// See also [audioPlayerUsecase].
class AudioPlayerUsecaseFamily extends Family<AsyncValue<AudioPlayerUsecase>> {
  /// See also [audioPlayerUsecase].
  const AudioPlayerUsecaseFamily();

  /// See also [audioPlayerUsecase].
  AudioPlayerUsecaseProvider call(
    Song song,
  ) {
    return AudioPlayerUsecaseProvider(
      song,
    );
  }

  @override
  AudioPlayerUsecaseProvider getProviderOverride(
    covariant AudioPlayerUsecaseProvider provider,
  ) {
    return call(
      provider.song,
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
  String? get name => r'audioPlayerUsecaseProvider';
}

/// See also [audioPlayerUsecase].
class AudioPlayerUsecaseProvider
    extends AutoDisposeFutureProvider<AudioPlayerUsecase> {
  /// See also [audioPlayerUsecase].
  AudioPlayerUsecaseProvider(
    Song song,
  ) : this._internal(
          (ref) => audioPlayerUsecase(
            ref as AudioPlayerUsecaseRef,
            song,
          ),
          from: audioPlayerUsecaseProvider,
          name: r'audioPlayerUsecaseProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$audioPlayerUsecaseHash,
          dependencies: AudioPlayerUsecaseFamily._dependencies,
          allTransitiveDependencies:
              AudioPlayerUsecaseFamily._allTransitiveDependencies,
          song: song,
        );

  AudioPlayerUsecaseProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.song,
  }) : super.internal();

  final Song song;

  @override
  Override overrideWith(
    FutureOr<AudioPlayerUsecase> Function(AudioPlayerUsecaseRef provider)
        create,
  ) {
    return ProviderOverride(
      origin: this,
      override: AudioPlayerUsecaseProvider._internal(
        (ref) => create(ref as AudioPlayerUsecaseRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        song: song,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<AudioPlayerUsecase> createElement() {
    return _AudioPlayerUsecaseProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is AudioPlayerUsecaseProvider && other.song == song;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, song.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin AudioPlayerUsecaseRef
    on AutoDisposeFutureProviderRef<AudioPlayerUsecase> {
  /// The parameter `song` of this provider.
  Song get song;
}

class _AudioPlayerUsecaseProviderElement
    extends AutoDisposeFutureProviderElement<AudioPlayerUsecase>
    with AudioPlayerUsecaseRef {
  _AudioPlayerUsecaseProviderElement(super.provider);

  @override
  Song get song => (origin as AudioPlayerUsecaseProvider).song;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
