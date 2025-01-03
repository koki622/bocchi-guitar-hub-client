// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chord_diagram_notifier.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SubChordInfoImpl _$$SubChordInfoImplFromJson(Map<String, dynamic> json) =>
    _$SubChordInfoImpl(
      positions: (json['positions'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      fingerings: (json['fingerings'] as List<dynamic>?)
          ?.map((e) => (e as List<dynamic>).map((e) => e as String).toList())
          .toList(),
    );

Map<String, dynamic> _$$SubChordInfoImplToJson(_$SubChordInfoImpl instance) =>
    <String, dynamic>{
      'positions': instance.positions,
      'fingerings': instance.fingerings,
    };

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$chordChangeNotifierHash() =>
    r'fe16bea780ee142572896f9082c6fd6ec1a1aaae';

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

abstract class _$ChordChangeNotifier
    extends BuildlessAutoDisposeNotifier<Map<ChordTimeRange, int>> {
  late final List<Chord> chords;

  Map<ChordTimeRange, int> build(
    List<Chord> chords,
  );
}

/// See also [ChordChangeNotifier].
@ProviderFor(ChordChangeNotifier)
const chordChangeNotifierProvider = ChordChangeNotifierFamily();

/// See also [ChordChangeNotifier].
class ChordChangeNotifierFamily extends Family<Map<ChordTimeRange, int>> {
  /// See also [ChordChangeNotifier].
  const ChordChangeNotifierFamily();

  /// See also [ChordChangeNotifier].
  ChordChangeNotifierProvider call(
    List<Chord> chords,
  ) {
    return ChordChangeNotifierProvider(
      chords,
    );
  }

  @override
  ChordChangeNotifierProvider getProviderOverride(
    covariant ChordChangeNotifierProvider provider,
  ) {
    return call(
      provider.chords,
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
  String? get name => r'chordChangeNotifierProvider';
}

/// See also [ChordChangeNotifier].
class ChordChangeNotifierProvider extends AutoDisposeNotifierProviderImpl<
    ChordChangeNotifier, Map<ChordTimeRange, int>> {
  /// See also [ChordChangeNotifier].
  ChordChangeNotifierProvider(
    List<Chord> chords,
  ) : this._internal(
          () => ChordChangeNotifier()..chords = chords,
          from: chordChangeNotifierProvider,
          name: r'chordChangeNotifierProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$chordChangeNotifierHash,
          dependencies: ChordChangeNotifierFamily._dependencies,
          allTransitiveDependencies:
              ChordChangeNotifierFamily._allTransitiveDependencies,
          chords: chords,
        );

  ChordChangeNotifierProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.chords,
  }) : super.internal();

  final List<Chord> chords;

  @override
  Map<ChordTimeRange, int> runNotifierBuild(
    covariant ChordChangeNotifier notifier,
  ) {
    return notifier.build(
      chords,
    );
  }

  @override
  Override overrideWith(ChordChangeNotifier Function() create) {
    return ProviderOverride(
      origin: this,
      override: ChordChangeNotifierProvider._internal(
        () => create()..chords = chords,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        chords: chords,
      ),
    );
  }

  @override
  AutoDisposeNotifierProviderElement<ChordChangeNotifier,
      Map<ChordTimeRange, int>> createElement() {
    return _ChordChangeNotifierProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is ChordChangeNotifierProvider && other.chords == chords;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, chords.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin ChordChangeNotifierRef
    on AutoDisposeNotifierProviderRef<Map<ChordTimeRange, int>> {
  /// The parameter `chords` of this provider.
  List<Chord> get chords;
}

class _ChordChangeNotifierProviderElement
    extends AutoDisposeNotifierProviderElement<ChordChangeNotifier,
        Map<ChordTimeRange, int>> with ChordChangeNotifierRef {
  _ChordChangeNotifierProviderElement(super.provider);

  @override
  List<Chord> get chords => (origin as ChordChangeNotifierProvider).chords;
}

String _$chordDiagramNotifierHash() =>
    r'f69fd85c606a1a12039fa7d0ea1bc78d96a21884';

abstract class _$ChordDiagramNotifier
    extends BuildlessAutoDisposeAsyncNotifier<List<ChordDiagramState>> {
  late final List<Chord> chords;

  FutureOr<List<ChordDiagramState>> build(
    List<Chord> chords,
  );
}

/// See also [ChordDiagramNotifier].
@ProviderFor(ChordDiagramNotifier)
const chordDiagramNotifierProvider = ChordDiagramNotifierFamily();

/// See also [ChordDiagramNotifier].
class ChordDiagramNotifierFamily
    extends Family<AsyncValue<List<ChordDiagramState>>> {
  /// See also [ChordDiagramNotifier].
  const ChordDiagramNotifierFamily();

  /// See also [ChordDiagramNotifier].
  ChordDiagramNotifierProvider call(
    List<Chord> chords,
  ) {
    return ChordDiagramNotifierProvider(
      chords,
    );
  }

  @override
  ChordDiagramNotifierProvider getProviderOverride(
    covariant ChordDiagramNotifierProvider provider,
  ) {
    return call(
      provider.chords,
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
  String? get name => r'chordDiagramNotifierProvider';
}

/// See also [ChordDiagramNotifier].
class ChordDiagramNotifierProvider extends AutoDisposeAsyncNotifierProviderImpl<
    ChordDiagramNotifier, List<ChordDiagramState>> {
  /// See also [ChordDiagramNotifier].
  ChordDiagramNotifierProvider(
    List<Chord> chords,
  ) : this._internal(
          () => ChordDiagramNotifier()..chords = chords,
          from: chordDiagramNotifierProvider,
          name: r'chordDiagramNotifierProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$chordDiagramNotifierHash,
          dependencies: ChordDiagramNotifierFamily._dependencies,
          allTransitiveDependencies:
              ChordDiagramNotifierFamily._allTransitiveDependencies,
          chords: chords,
        );

  ChordDiagramNotifierProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.chords,
  }) : super.internal();

  final List<Chord> chords;

  @override
  FutureOr<List<ChordDiagramState>> runNotifierBuild(
    covariant ChordDiagramNotifier notifier,
  ) {
    return notifier.build(
      chords,
    );
  }

  @override
  Override overrideWith(ChordDiagramNotifier Function() create) {
    return ProviderOverride(
      origin: this,
      override: ChordDiagramNotifierProvider._internal(
        () => create()..chords = chords,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        chords: chords,
      ),
    );
  }

  @override
  AutoDisposeAsyncNotifierProviderElement<ChordDiagramNotifier,
      List<ChordDiagramState>> createElement() {
    return _ChordDiagramNotifierProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is ChordDiagramNotifierProvider && other.chords == chords;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, chords.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin ChordDiagramNotifierRef
    on AutoDisposeAsyncNotifierProviderRef<List<ChordDiagramState>> {
  /// The parameter `chords` of this provider.
  List<Chord> get chords;
}

class _ChordDiagramNotifierProviderElement
    extends AutoDisposeAsyncNotifierProviderElement<ChordDiagramNotifier,
        List<ChordDiagramState>> with ChordDiagramNotifierRef {
  _ChordDiagramNotifierProviderElement(super.provider);

  @override
  List<Chord> get chords => (origin as ChordDiagramNotifierProvider).chords;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
