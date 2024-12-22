// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'current_beat_segment_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$currentBeatSegmentNotifierHash() =>
    r'72bbdcd6f02d9647790dfc4bb2cdfbbfbb1c29f7';

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

abstract class _$CurrentBeatSegmentNotifier
    extends BuildlessAutoDisposeNotifier<int> {
  late final List<Beat> beats;

  int build(
    List<Beat> beats,
  );
}

/// See also [CurrentBeatSegmentNotifier].
@ProviderFor(CurrentBeatSegmentNotifier)
const currentBeatSegmentNotifierProvider = CurrentBeatSegmentNotifierFamily();

/// See also [CurrentBeatSegmentNotifier].
class CurrentBeatSegmentNotifierFamily extends Family<int> {
  /// See also [CurrentBeatSegmentNotifier].
  const CurrentBeatSegmentNotifierFamily();

  /// See also [CurrentBeatSegmentNotifier].
  CurrentBeatSegmentNotifierProvider call(
    List<Beat> beats,
  ) {
    return CurrentBeatSegmentNotifierProvider(
      beats,
    );
  }

  @override
  CurrentBeatSegmentNotifierProvider getProviderOverride(
    covariant CurrentBeatSegmentNotifierProvider provider,
  ) {
    return call(
      provider.beats,
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
  String? get name => r'currentBeatSegmentNotifierProvider';
}

/// See also [CurrentBeatSegmentNotifier].
class CurrentBeatSegmentNotifierProvider
    extends AutoDisposeNotifierProviderImpl<CurrentBeatSegmentNotifier, int> {
  /// See also [CurrentBeatSegmentNotifier].
  CurrentBeatSegmentNotifierProvider(
    List<Beat> beats,
  ) : this._internal(
          () => CurrentBeatSegmentNotifier()..beats = beats,
          from: currentBeatSegmentNotifierProvider,
          name: r'currentBeatSegmentNotifierProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$currentBeatSegmentNotifierHash,
          dependencies: CurrentBeatSegmentNotifierFamily._dependencies,
          allTransitiveDependencies:
              CurrentBeatSegmentNotifierFamily._allTransitiveDependencies,
          beats: beats,
        );

  CurrentBeatSegmentNotifierProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.beats,
  }) : super.internal();

  final List<Beat> beats;

  @override
  int runNotifierBuild(
    covariant CurrentBeatSegmentNotifier notifier,
  ) {
    return notifier.build(
      beats,
    );
  }

  @override
  Override overrideWith(CurrentBeatSegmentNotifier Function() create) {
    return ProviderOverride(
      origin: this,
      override: CurrentBeatSegmentNotifierProvider._internal(
        () => create()..beats = beats,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        beats: beats,
      ),
    );
  }

  @override
  AutoDisposeNotifierProviderElement<CurrentBeatSegmentNotifier, int>
      createElement() {
    return _CurrentBeatSegmentNotifierProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is CurrentBeatSegmentNotifierProvider && other.beats == beats;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, beats.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin CurrentBeatSegmentNotifierRef on AutoDisposeNotifierProviderRef<int> {
  /// The parameter `beats` of this provider.
  List<Beat> get beats;
}

class _CurrentBeatSegmentNotifierProviderElement
    extends AutoDisposeNotifierProviderElement<CurrentBeatSegmentNotifier, int>
    with CurrentBeatSegmentNotifierRef {
  _CurrentBeatSegmentNotifierProviderElement(super.provider);

  @override
  List<Beat> get beats => (origin as CurrentBeatSegmentNotifierProvider).beats;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
