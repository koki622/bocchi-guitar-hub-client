// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'application_module.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$songUsecaseHash() => r'5a0c83d490579ccbcd6918fa647ae29240e6f0a0';

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

String _$chordDiagramUsecaseHash() =>
    r'936279ba9d992fa84f7c7e66cdb10fc71f370b13';

/// See also [chordDiagramUsecase].
@ProviderFor(chordDiagramUsecase)
const chordDiagramUsecaseProvider = ChordDiagramUsecaseFamily();

/// See also [chordDiagramUsecase].
class ChordDiagramUsecaseFamily
    extends Family<AsyncValue<ChordDiagramUsecase>> {
  /// See also [chordDiagramUsecase].
  const ChordDiagramUsecaseFamily();

  /// See also [chordDiagramUsecase].
  ChordDiagramUsecaseProvider call(
    Song song,
  ) {
    return ChordDiagramUsecaseProvider(
      song,
    );
  }

  @override
  ChordDiagramUsecaseProvider getProviderOverride(
    covariant ChordDiagramUsecaseProvider provider,
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
  String? get name => r'chordDiagramUsecaseProvider';
}

/// See also [chordDiagramUsecase].
class ChordDiagramUsecaseProvider
    extends AutoDisposeFutureProvider<ChordDiagramUsecase> {
  /// See also [chordDiagramUsecase].
  ChordDiagramUsecaseProvider(
    Song song,
  ) : this._internal(
          (ref) => chordDiagramUsecase(
            ref as ChordDiagramUsecaseRef,
            song,
          ),
          from: chordDiagramUsecaseProvider,
          name: r'chordDiagramUsecaseProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$chordDiagramUsecaseHash,
          dependencies: ChordDiagramUsecaseFamily._dependencies,
          allTransitiveDependencies:
              ChordDiagramUsecaseFamily._allTransitiveDependencies,
          song: song,
        );

  ChordDiagramUsecaseProvider._internal(
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
    FutureOr<ChordDiagramUsecase> Function(ChordDiagramUsecaseRef provider)
        create,
  ) {
    return ProviderOverride(
      origin: this,
      override: ChordDiagramUsecaseProvider._internal(
        (ref) => create(ref as ChordDiagramUsecaseRef),
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
  AutoDisposeFutureProviderElement<ChordDiagramUsecase> createElement() {
    return _ChordDiagramUsecaseProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is ChordDiagramUsecaseProvider && other.song == song;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, song.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin ChordDiagramUsecaseRef
    on AutoDisposeFutureProviderRef<ChordDiagramUsecase> {
  /// The parameter `song` of this provider.
  Song get song;
}

class _ChordDiagramUsecaseProviderElement
    extends AutoDisposeFutureProviderElement<ChordDiagramUsecase>
    with ChordDiagramUsecaseRef {
  _ChordDiagramUsecaseProviderElement(super.provider);

  @override
  Song get song => (origin as ChordDiagramUsecaseProvider).song;
}

String _$beatPositionUsecaseHash() =>
    r'63d987523d56180cd22f7deeab6a0b57ffafa5e5';

/// See also [beatPositionUsecase].
@ProviderFor(beatPositionUsecase)
const beatPositionUsecaseProvider = BeatPositionUsecaseFamily();

/// See also [beatPositionUsecase].
class BeatPositionUsecaseFamily extends Family<BeatPositionUsecase> {
  /// See also [beatPositionUsecase].
  const BeatPositionUsecaseFamily();

  /// See also [beatPositionUsecase].
  BeatPositionUsecaseProvider call(
    Song song,
  ) {
    return BeatPositionUsecaseProvider(
      song,
    );
  }

  @override
  BeatPositionUsecaseProvider getProviderOverride(
    covariant BeatPositionUsecaseProvider provider,
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
  String? get name => r'beatPositionUsecaseProvider';
}

/// See also [beatPositionUsecase].
class BeatPositionUsecaseProvider
    extends AutoDisposeProvider<BeatPositionUsecase> {
  /// See also [beatPositionUsecase].
  BeatPositionUsecaseProvider(
    Song song,
  ) : this._internal(
          (ref) => beatPositionUsecase(
            ref as BeatPositionUsecaseRef,
            song,
          ),
          from: beatPositionUsecaseProvider,
          name: r'beatPositionUsecaseProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$beatPositionUsecaseHash,
          dependencies: BeatPositionUsecaseFamily._dependencies,
          allTransitiveDependencies:
              BeatPositionUsecaseFamily._allTransitiveDependencies,
          song: song,
        );

  BeatPositionUsecaseProvider._internal(
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
    BeatPositionUsecase Function(BeatPositionUsecaseRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: BeatPositionUsecaseProvider._internal(
        (ref) => create(ref as BeatPositionUsecaseRef),
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
  AutoDisposeProviderElement<BeatPositionUsecase> createElement() {
    return _BeatPositionUsecaseProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is BeatPositionUsecaseProvider && other.song == song;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, song.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin BeatPositionUsecaseRef on AutoDisposeProviderRef<BeatPositionUsecase> {
  /// The parameter `song` of this provider.
  Song get song;
}

class _BeatPositionUsecaseProviderElement
    extends AutoDisposeProviderElement<BeatPositionUsecase>
    with BeatPositionUsecaseRef {
  _BeatPositionUsecaseProviderElement(super.provider);

  @override
  Song get song => (origin as BeatPositionUsecaseProvider).song;
}

String _$lyricPositionUsecaseHash() =>
    r'15e48712f413bd3b5721d8c02b78ffaca6f5abd5';

/// See also [lyricPositionUsecase].
@ProviderFor(lyricPositionUsecase)
const lyricPositionUsecaseProvider = LyricPositionUsecaseFamily();

/// See also [lyricPositionUsecase].
class LyricPositionUsecaseFamily extends Family<LyricPositionUsecase> {
  /// See also [lyricPositionUsecase].
  const LyricPositionUsecaseFamily();

  /// See also [lyricPositionUsecase].
  LyricPositionUsecaseProvider call(
    Song song,
  ) {
    return LyricPositionUsecaseProvider(
      song,
    );
  }

  @override
  LyricPositionUsecaseProvider getProviderOverride(
    covariant LyricPositionUsecaseProvider provider,
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
  String? get name => r'lyricPositionUsecaseProvider';
}

/// See also [lyricPositionUsecase].
class LyricPositionUsecaseProvider
    extends AutoDisposeProvider<LyricPositionUsecase> {
  /// See also [lyricPositionUsecase].
  LyricPositionUsecaseProvider(
    Song song,
  ) : this._internal(
          (ref) => lyricPositionUsecase(
            ref as LyricPositionUsecaseRef,
            song,
          ),
          from: lyricPositionUsecaseProvider,
          name: r'lyricPositionUsecaseProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$lyricPositionUsecaseHash,
          dependencies: LyricPositionUsecaseFamily._dependencies,
          allTransitiveDependencies:
              LyricPositionUsecaseFamily._allTransitiveDependencies,
          song: song,
        );

  LyricPositionUsecaseProvider._internal(
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
    LyricPositionUsecase Function(LyricPositionUsecaseRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: LyricPositionUsecaseProvider._internal(
        (ref) => create(ref as LyricPositionUsecaseRef),
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
  AutoDisposeProviderElement<LyricPositionUsecase> createElement() {
    return _LyricPositionUsecaseProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is LyricPositionUsecaseProvider && other.song == song;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, song.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin LyricPositionUsecaseRef on AutoDisposeProviderRef<LyricPositionUsecase> {
  /// The parameter `song` of this provider.
  Song get song;
}

class _LyricPositionUsecaseProviderElement
    extends AutoDisposeProviderElement<LyricPositionUsecase>
    with LyricPositionUsecaseRef {
  _LyricPositionUsecaseProviderElement(super.provider);

  @override
  Song get song => (origin as LyricPositionUsecaseProvider).song;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
