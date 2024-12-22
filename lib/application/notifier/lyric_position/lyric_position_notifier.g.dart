// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'lyric_position_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$segmentedLyricPositionNotifierHash() =>
    r'e7b6102bf3ddca3507f59185a3e5473f8ac838de';

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

abstract class _$SegmentedLyricPositionNotifier
    extends BuildlessAutoDisposeNotifier<int> {
  late final List<Lyric> lyrics;

  int build(
    List<Lyric> lyrics,
  );
}

/// See also [SegmentedLyricPositionNotifier].
@ProviderFor(SegmentedLyricPositionNotifier)
const segmentedLyricPositionNotifierProvider =
    SegmentedLyricPositionNotifierFamily();

/// See also [SegmentedLyricPositionNotifier].
class SegmentedLyricPositionNotifierFamily extends Family<int> {
  /// See also [SegmentedLyricPositionNotifier].
  const SegmentedLyricPositionNotifierFamily();

  /// See also [SegmentedLyricPositionNotifier].
  SegmentedLyricPositionNotifierProvider call(
    List<Lyric> lyrics,
  ) {
    return SegmentedLyricPositionNotifierProvider(
      lyrics,
    );
  }

  @override
  SegmentedLyricPositionNotifierProvider getProviderOverride(
    covariant SegmentedLyricPositionNotifierProvider provider,
  ) {
    return call(
      provider.lyrics,
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
  String? get name => r'segmentedLyricPositionNotifierProvider';
}

/// See also [SegmentedLyricPositionNotifier].
class SegmentedLyricPositionNotifierProvider
    extends AutoDisposeNotifierProviderImpl<SegmentedLyricPositionNotifier,
        int> {
  /// See also [SegmentedLyricPositionNotifier].
  SegmentedLyricPositionNotifierProvider(
    List<Lyric> lyrics,
  ) : this._internal(
          () => SegmentedLyricPositionNotifier()..lyrics = lyrics,
          from: segmentedLyricPositionNotifierProvider,
          name: r'segmentedLyricPositionNotifierProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$segmentedLyricPositionNotifierHash,
          dependencies: SegmentedLyricPositionNotifierFamily._dependencies,
          allTransitiveDependencies:
              SegmentedLyricPositionNotifierFamily._allTransitiveDependencies,
          lyrics: lyrics,
        );

  SegmentedLyricPositionNotifierProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.lyrics,
  }) : super.internal();

  final List<Lyric> lyrics;

  @override
  int runNotifierBuild(
    covariant SegmentedLyricPositionNotifier notifier,
  ) {
    return notifier.build(
      lyrics,
    );
  }

  @override
  Override overrideWith(SegmentedLyricPositionNotifier Function() create) {
    return ProviderOverride(
      origin: this,
      override: SegmentedLyricPositionNotifierProvider._internal(
        () => create()..lyrics = lyrics,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        lyrics: lyrics,
      ),
    );
  }

  @override
  AutoDisposeNotifierProviderElement<SegmentedLyricPositionNotifier, int>
      createElement() {
    return _SegmentedLyricPositionNotifierProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is SegmentedLyricPositionNotifierProvider &&
        other.lyrics == lyrics;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, lyrics.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin SegmentedLyricPositionNotifierRef on AutoDisposeNotifierProviderRef<int> {
  /// The parameter `lyrics` of this provider.
  List<Lyric> get lyrics;
}

class _SegmentedLyricPositionNotifierProviderElement
    extends AutoDisposeNotifierProviderElement<SegmentedLyricPositionNotifier,
        int> with SegmentedLyricPositionNotifierRef {
  _SegmentedLyricPositionNotifierProviderElement(super.provider);

  @override
  List<Lyric> get lyrics =>
      (origin as SegmentedLyricPositionNotifierProvider).lyrics;
}

String _$wordLyricPositionNotifierHash() =>
    r'7ee5ac49ee772f4f518303ab95aaee0482e4a8dc';

abstract class _$WordLyricPositionNotifier
    extends BuildlessAutoDisposeNotifier<WordLyricPosition?> {
  late final List<Lyric> lyrics;
  late final int segmentedLyricIndex;

  WordLyricPosition? build(
    List<Lyric> lyrics,
    int segmentedLyricIndex,
  );
}

/// See also [WordLyricPositionNotifier].
@ProviderFor(WordLyricPositionNotifier)
const wordLyricPositionNotifierProvider = WordLyricPositionNotifierFamily();

/// See also [WordLyricPositionNotifier].
class WordLyricPositionNotifierFamily extends Family<WordLyricPosition?> {
  /// See also [WordLyricPositionNotifier].
  const WordLyricPositionNotifierFamily();

  /// See also [WordLyricPositionNotifier].
  WordLyricPositionNotifierProvider call(
    List<Lyric> lyrics,
    int segmentedLyricIndex,
  ) {
    return WordLyricPositionNotifierProvider(
      lyrics,
      segmentedLyricIndex,
    );
  }

  @override
  WordLyricPositionNotifierProvider getProviderOverride(
    covariant WordLyricPositionNotifierProvider provider,
  ) {
    return call(
      provider.lyrics,
      provider.segmentedLyricIndex,
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
  String? get name => r'wordLyricPositionNotifierProvider';
}

/// See also [WordLyricPositionNotifier].
class WordLyricPositionNotifierProvider extends AutoDisposeNotifierProviderImpl<
    WordLyricPositionNotifier, WordLyricPosition?> {
  /// See also [WordLyricPositionNotifier].
  WordLyricPositionNotifierProvider(
    List<Lyric> lyrics,
    int segmentedLyricIndex,
  ) : this._internal(
          () => WordLyricPositionNotifier()
            ..lyrics = lyrics
            ..segmentedLyricIndex = segmentedLyricIndex,
          from: wordLyricPositionNotifierProvider,
          name: r'wordLyricPositionNotifierProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$wordLyricPositionNotifierHash,
          dependencies: WordLyricPositionNotifierFamily._dependencies,
          allTransitiveDependencies:
              WordLyricPositionNotifierFamily._allTransitiveDependencies,
          lyrics: lyrics,
          segmentedLyricIndex: segmentedLyricIndex,
        );

  WordLyricPositionNotifierProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.lyrics,
    required this.segmentedLyricIndex,
  }) : super.internal();

  final List<Lyric> lyrics;
  final int segmentedLyricIndex;

  @override
  WordLyricPosition? runNotifierBuild(
    covariant WordLyricPositionNotifier notifier,
  ) {
    return notifier.build(
      lyrics,
      segmentedLyricIndex,
    );
  }

  @override
  Override overrideWith(WordLyricPositionNotifier Function() create) {
    return ProviderOverride(
      origin: this,
      override: WordLyricPositionNotifierProvider._internal(
        () => create()
          ..lyrics = lyrics
          ..segmentedLyricIndex = segmentedLyricIndex,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        lyrics: lyrics,
        segmentedLyricIndex: segmentedLyricIndex,
      ),
    );
  }

  @override
  AutoDisposeNotifierProviderElement<WordLyricPositionNotifier,
      WordLyricPosition?> createElement() {
    return _WordLyricPositionNotifierProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is WordLyricPositionNotifierProvider &&
        other.lyrics == lyrics &&
        other.segmentedLyricIndex == segmentedLyricIndex;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, lyrics.hashCode);
    hash = _SystemHash.combine(hash, segmentedLyricIndex.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin WordLyricPositionNotifierRef
    on AutoDisposeNotifierProviderRef<WordLyricPosition?> {
  /// The parameter `lyrics` of this provider.
  List<Lyric> get lyrics;

  /// The parameter `segmentedLyricIndex` of this provider.
  int get segmentedLyricIndex;
}

class _WordLyricPositionNotifierProviderElement
    extends AutoDisposeNotifierProviderElement<WordLyricPositionNotifier,
        WordLyricPosition?> with WordLyricPositionNotifierRef {
  _WordLyricPositionNotifierProviderElement(super.provider);

  @override
  List<Lyric> get lyrics =>
      (origin as WordLyricPositionNotifierProvider).lyrics;
  @override
  int get segmentedLyricIndex =>
      (origin as WordLyricPositionNotifierProvider).segmentedLyricIndex;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
