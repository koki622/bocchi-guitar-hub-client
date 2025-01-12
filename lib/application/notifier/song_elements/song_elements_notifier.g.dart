// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'song_elements_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$separatedAudioNotifierHash() =>
    r'26615275f524a74a3eebdf4a2543b5819e75de77';

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

abstract class _$SeparatedAudioNotifier
    extends BuildlessAutoDisposeAsyncNotifier<SeparatedAudio> {
  late final Song song;

  FutureOr<SeparatedAudio> build(
    Song song,
  );
}

/// See also [SeparatedAudioNotifier].
@ProviderFor(SeparatedAudioNotifier)
const separatedAudioNotifierProvider = SeparatedAudioNotifierFamily();

/// See also [SeparatedAudioNotifier].
class SeparatedAudioNotifierFamily extends Family<AsyncValue<SeparatedAudio>> {
  /// See also [SeparatedAudioNotifier].
  const SeparatedAudioNotifierFamily();

  /// See also [SeparatedAudioNotifier].
  SeparatedAudioNotifierProvider call(
    Song song,
  ) {
    return SeparatedAudioNotifierProvider(
      song,
    );
  }

  @override
  SeparatedAudioNotifierProvider getProviderOverride(
    covariant SeparatedAudioNotifierProvider provider,
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
  String? get name => r'separatedAudioNotifierProvider';
}

/// See also [SeparatedAudioNotifier].
class SeparatedAudioNotifierProvider
    extends AutoDisposeAsyncNotifierProviderImpl<SeparatedAudioNotifier,
        SeparatedAudio> {
  /// See also [SeparatedAudioNotifier].
  SeparatedAudioNotifierProvider(
    Song song,
  ) : this._internal(
          () => SeparatedAudioNotifier()..song = song,
          from: separatedAudioNotifierProvider,
          name: r'separatedAudioNotifierProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$separatedAudioNotifierHash,
          dependencies: SeparatedAudioNotifierFamily._dependencies,
          allTransitiveDependencies:
              SeparatedAudioNotifierFamily._allTransitiveDependencies,
          song: song,
        );

  SeparatedAudioNotifierProvider._internal(
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
  FutureOr<SeparatedAudio> runNotifierBuild(
    covariant SeparatedAudioNotifier notifier,
  ) {
    return notifier.build(
      song,
    );
  }

  @override
  Override overrideWith(SeparatedAudioNotifier Function() create) {
    return ProviderOverride(
      origin: this,
      override: SeparatedAudioNotifierProvider._internal(
        () => create()..song = song,
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
  AutoDisposeAsyncNotifierProviderElement<SeparatedAudioNotifier,
      SeparatedAudio> createElement() {
    return _SeparatedAudioNotifierProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is SeparatedAudioNotifierProvider && other.song == song;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, song.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin SeparatedAudioNotifierRef
    on AutoDisposeAsyncNotifierProviderRef<SeparatedAudio> {
  /// The parameter `song` of this provider.
  Song get song;
}

class _SeparatedAudioNotifierProviderElement
    extends AutoDisposeAsyncNotifierProviderElement<SeparatedAudioNotifier,
        SeparatedAudio> with SeparatedAudioNotifierRef {
  _SeparatedAudioNotifierProviderElement(super.provider);

  @override
  Song get song => (origin as SeparatedAudioNotifierProvider).song;
}

String _$clickSoundNotifierHash() =>
    r'ceda10225420956e603811470021d59ad07d20c2';

abstract class _$ClickSoundNotifier
    extends BuildlessAutoDisposeAsyncNotifier<ClickSound> {
  late final Song song;

  FutureOr<ClickSound> build(
    Song song,
  );
}

/// See also [ClickSoundNotifier].
@ProviderFor(ClickSoundNotifier)
const clickSoundNotifierProvider = ClickSoundNotifierFamily();

/// See also [ClickSoundNotifier].
class ClickSoundNotifierFamily extends Family<AsyncValue<ClickSound>> {
  /// See also [ClickSoundNotifier].
  const ClickSoundNotifierFamily();

  /// See also [ClickSoundNotifier].
  ClickSoundNotifierProvider call(
    Song song,
  ) {
    return ClickSoundNotifierProvider(
      song,
    );
  }

  @override
  ClickSoundNotifierProvider getProviderOverride(
    covariant ClickSoundNotifierProvider provider,
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
  String? get name => r'clickSoundNotifierProvider';
}

/// See also [ClickSoundNotifier].
class ClickSoundNotifierProvider extends AutoDisposeAsyncNotifierProviderImpl<
    ClickSoundNotifier, ClickSound> {
  /// See also [ClickSoundNotifier].
  ClickSoundNotifierProvider(
    Song song,
  ) : this._internal(
          () => ClickSoundNotifier()..song = song,
          from: clickSoundNotifierProvider,
          name: r'clickSoundNotifierProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$clickSoundNotifierHash,
          dependencies: ClickSoundNotifierFamily._dependencies,
          allTransitiveDependencies:
              ClickSoundNotifierFamily._allTransitiveDependencies,
          song: song,
        );

  ClickSoundNotifierProvider._internal(
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
  FutureOr<ClickSound> runNotifierBuild(
    covariant ClickSoundNotifier notifier,
  ) {
    return notifier.build(
      song,
    );
  }

  @override
  Override overrideWith(ClickSoundNotifier Function() create) {
    return ProviderOverride(
      origin: this,
      override: ClickSoundNotifierProvider._internal(
        () => create()..song = song,
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
  AutoDisposeAsyncNotifierProviderElement<ClickSoundNotifier, ClickSound>
      createElement() {
    return _ClickSoundNotifierProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is ClickSoundNotifierProvider && other.song == song;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, song.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin ClickSoundNotifierRef on AutoDisposeAsyncNotifierProviderRef<ClickSound> {
  /// The parameter `song` of this provider.
  Song get song;
}

class _ClickSoundNotifierProviderElement
    extends AutoDisposeAsyncNotifierProviderElement<ClickSoundNotifier,
        ClickSound> with ClickSoundNotifierRef {
  _ClickSoundNotifierProviderElement(super.provider);

  @override
  Song get song => (origin as ClickSoundNotifierProvider).song;
}

String _$chordSoundNotifierHash() =>
    r'dd95d59af7db94baa6c74c39eb0f9393624ee338';

abstract class _$ChordSoundNotifier
    extends BuildlessAutoDisposeAsyncNotifier<ChordSound> {
  late final Song song;

  FutureOr<ChordSound> build(
    Song song,
  );
}

/// See also [ChordSoundNotifier].
@ProviderFor(ChordSoundNotifier)
const chordSoundNotifierProvider = ChordSoundNotifierFamily();

/// See also [ChordSoundNotifier].
class ChordSoundNotifierFamily extends Family<AsyncValue<ChordSound>> {
  /// See also [ChordSoundNotifier].
  const ChordSoundNotifierFamily();

  /// See also [ChordSoundNotifier].
  ChordSoundNotifierProvider call(
    Song song,
  ) {
    return ChordSoundNotifierProvider(
      song,
    );
  }

  @override
  ChordSoundNotifierProvider getProviderOverride(
    covariant ChordSoundNotifierProvider provider,
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
  String? get name => r'chordSoundNotifierProvider';
}

/// See also [ChordSoundNotifier].
class ChordSoundNotifierProvider extends AutoDisposeAsyncNotifierProviderImpl<
    ChordSoundNotifier, ChordSound> {
  /// See also [ChordSoundNotifier].
  ChordSoundNotifierProvider(
    Song song,
  ) : this._internal(
          () => ChordSoundNotifier()..song = song,
          from: chordSoundNotifierProvider,
          name: r'chordSoundNotifierProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$chordSoundNotifierHash,
          dependencies: ChordSoundNotifierFamily._dependencies,
          allTransitiveDependencies:
              ChordSoundNotifierFamily._allTransitiveDependencies,
          song: song,
        );

  ChordSoundNotifierProvider._internal(
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
  FutureOr<ChordSound> runNotifierBuild(
    covariant ChordSoundNotifier notifier,
  ) {
    return notifier.build(
      song,
    );
  }

  @override
  Override overrideWith(ChordSoundNotifier Function() create) {
    return ProviderOverride(
      origin: this,
      override: ChordSoundNotifierProvider._internal(
        () => create()..song = song,
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
  AutoDisposeAsyncNotifierProviderElement<ChordSoundNotifier, ChordSound>
      createElement() {
    return _ChordSoundNotifierProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is ChordSoundNotifierProvider && other.song == song;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, song.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin ChordSoundNotifierRef on AutoDisposeAsyncNotifierProviderRef<ChordSound> {
  /// The parameter `song` of this provider.
  Song get song;
}

class _ChordSoundNotifierProviderElement
    extends AutoDisposeAsyncNotifierProviderElement<ChordSoundNotifier,
        ChordSound> with ChordSoundNotifierRef {
  _ChordSoundNotifierProviderElement(super.provider);

  @override
  Song get song => (origin as ChordSoundNotifierProvider).song;
}

String _$chordNotifierHash() => r'd9a436436a491210303c3a3b3a8971eb1dc98cde';

abstract class _$ChordNotifier
    extends BuildlessAutoDisposeNotifier<ChordState> {
  late final Song song;
  late final int? defaultCapo;

  ChordState build(
    Song song,
    int? defaultCapo,
  );
}

/// See also [ChordNotifier].
@ProviderFor(ChordNotifier)
const chordNotifierProvider = ChordNotifierFamily();

/// See also [ChordNotifier].
class ChordNotifierFamily extends Family<ChordState> {
  /// See also [ChordNotifier].
  const ChordNotifierFamily();

  /// See also [ChordNotifier].
  ChordNotifierProvider call(
    Song song,
    int? defaultCapo,
  ) {
    return ChordNotifierProvider(
      song,
      defaultCapo,
    );
  }

  @override
  ChordNotifierProvider getProviderOverride(
    covariant ChordNotifierProvider provider,
  ) {
    return call(
      provider.song,
      provider.defaultCapo,
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
  String? get name => r'chordNotifierProvider';
}

/// See also [ChordNotifier].
class ChordNotifierProvider
    extends AutoDisposeNotifierProviderImpl<ChordNotifier, ChordState> {
  /// See also [ChordNotifier].
  ChordNotifierProvider(
    Song song,
    int? defaultCapo,
  ) : this._internal(
          () => ChordNotifier()
            ..song = song
            ..defaultCapo = defaultCapo,
          from: chordNotifierProvider,
          name: r'chordNotifierProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$chordNotifierHash,
          dependencies: ChordNotifierFamily._dependencies,
          allTransitiveDependencies:
              ChordNotifierFamily._allTransitiveDependencies,
          song: song,
          defaultCapo: defaultCapo,
        );

  ChordNotifierProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.song,
    required this.defaultCapo,
  }) : super.internal();

  final Song song;
  final int? defaultCapo;

  @override
  ChordState runNotifierBuild(
    covariant ChordNotifier notifier,
  ) {
    return notifier.build(
      song,
      defaultCapo,
    );
  }

  @override
  Override overrideWith(ChordNotifier Function() create) {
    return ProviderOverride(
      origin: this,
      override: ChordNotifierProvider._internal(
        () => create()
          ..song = song
          ..defaultCapo = defaultCapo,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        song: song,
        defaultCapo: defaultCapo,
      ),
    );
  }

  @override
  AutoDisposeNotifierProviderElement<ChordNotifier, ChordState>
      createElement() {
    return _ChordNotifierProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is ChordNotifierProvider &&
        other.song == song &&
        other.defaultCapo == defaultCapo;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, song.hashCode);
    hash = _SystemHash.combine(hash, defaultCapo.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin ChordNotifierRef on AutoDisposeNotifierProviderRef<ChordState> {
  /// The parameter `song` of this provider.
  Song get song;

  /// The parameter `defaultCapo` of this provider.
  int? get defaultCapo;
}

class _ChordNotifierProviderElement
    extends AutoDisposeNotifierProviderElement<ChordNotifier, ChordState>
    with ChordNotifierRef {
  _ChordNotifierProviderElement(super.provider);

  @override
  Song get song => (origin as ChordNotifierProvider).song;
  @override
  int? get defaultCapo => (origin as ChordNotifierProvider).defaultCapo;
}

String _$beatNotifierHash() => r'30d1bd8ba8d2f258875df2fd2f52df159b402671';

abstract class _$BeatNotifier extends BuildlessAutoDisposeNotifier<List<Beat>> {
  late final Song song;

  List<Beat> build(
    Song song,
  );
}

/// See also [BeatNotifier].
@ProviderFor(BeatNotifier)
const beatNotifierProvider = BeatNotifierFamily();

/// See also [BeatNotifier].
class BeatNotifierFamily extends Family<List<Beat>> {
  /// See also [BeatNotifier].
  const BeatNotifierFamily();

  /// See also [BeatNotifier].
  BeatNotifierProvider call(
    Song song,
  ) {
    return BeatNotifierProvider(
      song,
    );
  }

  @override
  BeatNotifierProvider getProviderOverride(
    covariant BeatNotifierProvider provider,
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
  String? get name => r'beatNotifierProvider';
}

/// See also [BeatNotifier].
class BeatNotifierProvider
    extends AutoDisposeNotifierProviderImpl<BeatNotifier, List<Beat>> {
  /// See also [BeatNotifier].
  BeatNotifierProvider(
    Song song,
  ) : this._internal(
          () => BeatNotifier()..song = song,
          from: beatNotifierProvider,
          name: r'beatNotifierProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$beatNotifierHash,
          dependencies: BeatNotifierFamily._dependencies,
          allTransitiveDependencies:
              BeatNotifierFamily._allTransitiveDependencies,
          song: song,
        );

  BeatNotifierProvider._internal(
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
  List<Beat> runNotifierBuild(
    covariant BeatNotifier notifier,
  ) {
    return notifier.build(
      song,
    );
  }

  @override
  Override overrideWith(BeatNotifier Function() create) {
    return ProviderOverride(
      origin: this,
      override: BeatNotifierProvider._internal(
        () => create()..song = song,
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
  AutoDisposeNotifierProviderElement<BeatNotifier, List<Beat>> createElement() {
    return _BeatNotifierProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is BeatNotifierProvider && other.song == song;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, song.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin BeatNotifierRef on AutoDisposeNotifierProviderRef<List<Beat>> {
  /// The parameter `song` of this provider.
  Song get song;
}

class _BeatNotifierProviderElement
    extends AutoDisposeNotifierProviderElement<BeatNotifier, List<Beat>>
    with BeatNotifierRef {
  _BeatNotifierProviderElement(super.provider);

  @override
  Song get song => (origin as BeatNotifierProvider).song;
}

String _$sectionNotifierHash() => r'2757f95bc3e34abb932b1c611a2ca5d924894a32';

abstract class _$SectionNotifier
    extends BuildlessAutoDisposeNotifier<List<Section>> {
  late final Song song;

  List<Section> build(
    Song song,
  );
}

/// See also [SectionNotifier].
@ProviderFor(SectionNotifier)
const sectionNotifierProvider = SectionNotifierFamily();

/// See also [SectionNotifier].
class SectionNotifierFamily extends Family<List<Section>> {
  /// See also [SectionNotifier].
  const SectionNotifierFamily();

  /// See also [SectionNotifier].
  SectionNotifierProvider call(
    Song song,
  ) {
    return SectionNotifierProvider(
      song,
    );
  }

  @override
  SectionNotifierProvider getProviderOverride(
    covariant SectionNotifierProvider provider,
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
  String? get name => r'sectionNotifierProvider';
}

/// See also [SectionNotifier].
class SectionNotifierProvider
    extends AutoDisposeNotifierProviderImpl<SectionNotifier, List<Section>> {
  /// See also [SectionNotifier].
  SectionNotifierProvider(
    Song song,
  ) : this._internal(
          () => SectionNotifier()..song = song,
          from: sectionNotifierProvider,
          name: r'sectionNotifierProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$sectionNotifierHash,
          dependencies: SectionNotifierFamily._dependencies,
          allTransitiveDependencies:
              SectionNotifierFamily._allTransitiveDependencies,
          song: song,
        );

  SectionNotifierProvider._internal(
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
  List<Section> runNotifierBuild(
    covariant SectionNotifier notifier,
  ) {
    return notifier.build(
      song,
    );
  }

  @override
  Override overrideWith(SectionNotifier Function() create) {
    return ProviderOverride(
      origin: this,
      override: SectionNotifierProvider._internal(
        () => create()..song = song,
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
  AutoDisposeNotifierProviderElement<SectionNotifier, List<Section>>
      createElement() {
    return _SectionNotifierProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is SectionNotifierProvider && other.song == song;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, song.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin SectionNotifierRef on AutoDisposeNotifierProviderRef<List<Section>> {
  /// The parameter `song` of this provider.
  Song get song;
}

class _SectionNotifierProviderElement
    extends AutoDisposeNotifierProviderElement<SectionNotifier, List<Section>>
    with SectionNotifierRef {
  _SectionNotifierProviderElement(super.provider);

  @override
  Song get song => (origin as SectionNotifierProvider).song;
}

String _$lyricNotifierHash() => r'a5ac68e46ce805cd85ef20ce45646e88f03327c5';

abstract class _$LyricNotifier
    extends BuildlessAutoDisposeNotifier<List<Lyric>> {
  late final Song song;

  List<Lyric> build(
    Song song,
  );
}

/// See also [LyricNotifier].
@ProviderFor(LyricNotifier)
const lyricNotifierProvider = LyricNotifierFamily();

/// See also [LyricNotifier].
class LyricNotifierFamily extends Family<List<Lyric>> {
  /// See also [LyricNotifier].
  const LyricNotifierFamily();

  /// See also [LyricNotifier].
  LyricNotifierProvider call(
    Song song,
  ) {
    return LyricNotifierProvider(
      song,
    );
  }

  @override
  LyricNotifierProvider getProviderOverride(
    covariant LyricNotifierProvider provider,
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
  String? get name => r'lyricNotifierProvider';
}

/// See also [LyricNotifier].
class LyricNotifierProvider
    extends AutoDisposeNotifierProviderImpl<LyricNotifier, List<Lyric>> {
  /// See also [LyricNotifier].
  LyricNotifierProvider(
    Song song,
  ) : this._internal(
          () => LyricNotifier()..song = song,
          from: lyricNotifierProvider,
          name: r'lyricNotifierProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$lyricNotifierHash,
          dependencies: LyricNotifierFamily._dependencies,
          allTransitiveDependencies:
              LyricNotifierFamily._allTransitiveDependencies,
          song: song,
        );

  LyricNotifierProvider._internal(
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
  List<Lyric> runNotifierBuild(
    covariant LyricNotifier notifier,
  ) {
    return notifier.build(
      song,
    );
  }

  @override
  Override overrideWith(LyricNotifier Function() create) {
    return ProviderOverride(
      origin: this,
      override: LyricNotifierProvider._internal(
        () => create()..song = song,
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
  AutoDisposeNotifierProviderElement<LyricNotifier, List<Lyric>>
      createElement() {
    return _LyricNotifierProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is LyricNotifierProvider && other.song == song;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, song.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin LyricNotifierRef on AutoDisposeNotifierProviderRef<List<Lyric>> {
  /// The parameter `song` of this provider.
  Song get song;
}

class _LyricNotifierProviderElement
    extends AutoDisposeNotifierProviderElement<LyricNotifier, List<Lyric>>
    with LyricNotifierRef {
  _LyricNotifierProviderElement(super.provider);

  @override
  Song get song => (origin as LyricNotifierProvider).song;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
