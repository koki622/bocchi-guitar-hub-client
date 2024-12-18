// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'current_chord_diagram_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$currentChordDiagramNotifierHash() =>
    r'6eec5702d4c220b984e991df96fd034d0fb85155';

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

abstract class _$CurrentChordDiagramNotifier
    extends BuildlessAutoDisposeNotifier<int> {
  late final Map<ChordTimeRange, int> chordChange;

  int build(
    Map<ChordTimeRange, int> chordChange,
  );
}

/// See also [CurrentChordDiagramNotifier].
@ProviderFor(CurrentChordDiagramNotifier)
const currentChordDiagramNotifierProvider = CurrentChordDiagramNotifierFamily();

/// See also [CurrentChordDiagramNotifier].
class CurrentChordDiagramNotifierFamily extends Family<int> {
  /// See also [CurrentChordDiagramNotifier].
  const CurrentChordDiagramNotifierFamily();

  /// See also [CurrentChordDiagramNotifier].
  CurrentChordDiagramNotifierProvider call(
    Map<ChordTimeRange, int> chordChange,
  ) {
    return CurrentChordDiagramNotifierProvider(
      chordChange,
    );
  }

  @override
  CurrentChordDiagramNotifierProvider getProviderOverride(
    covariant CurrentChordDiagramNotifierProvider provider,
  ) {
    return call(
      provider.chordChange,
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
  String? get name => r'currentChordDiagramNotifierProvider';
}

/// See also [CurrentChordDiagramNotifier].
class CurrentChordDiagramNotifierProvider
    extends AutoDisposeNotifierProviderImpl<CurrentChordDiagramNotifier, int> {
  /// See also [CurrentChordDiagramNotifier].
  CurrentChordDiagramNotifierProvider(
    Map<ChordTimeRange, int> chordChange,
  ) : this._internal(
          () => CurrentChordDiagramNotifier()..chordChange = chordChange,
          from: currentChordDiagramNotifierProvider,
          name: r'currentChordDiagramNotifierProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$currentChordDiagramNotifierHash,
          dependencies: CurrentChordDiagramNotifierFamily._dependencies,
          allTransitiveDependencies:
              CurrentChordDiagramNotifierFamily._allTransitiveDependencies,
          chordChange: chordChange,
        );

  CurrentChordDiagramNotifierProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.chordChange,
  }) : super.internal();

  final Map<ChordTimeRange, int> chordChange;

  @override
  int runNotifierBuild(
    covariant CurrentChordDiagramNotifier notifier,
  ) {
    return notifier.build(
      chordChange,
    );
  }

  @override
  Override overrideWith(CurrentChordDiagramNotifier Function() create) {
    return ProviderOverride(
      origin: this,
      override: CurrentChordDiagramNotifierProvider._internal(
        () => create()..chordChange = chordChange,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        chordChange: chordChange,
      ),
    );
  }

  @override
  AutoDisposeNotifierProviderElement<CurrentChordDiagramNotifier, int>
      createElement() {
    return _CurrentChordDiagramNotifierProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is CurrentChordDiagramNotifierProvider &&
        other.chordChange == chordChange;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, chordChange.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin CurrentChordDiagramNotifierRef on AutoDisposeNotifierProviderRef<int> {
  /// The parameter `chordChange` of this provider.
  Map<ChordTimeRange, int> get chordChange;
}

class _CurrentChordDiagramNotifierProviderElement
    extends AutoDisposeNotifierProviderElement<CurrentChordDiagramNotifier, int>
    with CurrentChordDiagramNotifierRef {
  _CurrentChordDiagramNotifierProviderElement(super.provider);

  @override
  Map<ChordTimeRange, int> get chordChange =>
      (origin as CurrentChordDiagramNotifierProvider).chordChange;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
