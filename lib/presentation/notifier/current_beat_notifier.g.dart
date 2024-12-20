// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'current_beat_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$currentBeatNotifierHash() =>
    r'15482b24aa01525a02b4975dea26bf88aee0ac5b';

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

abstract class _$CurrentBeatNotifier
    extends BuildlessAutoDisposeNotifier<List<bool>> {
  late final List<Beat> beats;

  List<bool> build(
    List<Beat> beats,
  );
}

/// See also [CurrentBeatNotifier].
@ProviderFor(CurrentBeatNotifier)
const currentBeatNotifierProvider = CurrentBeatNotifierFamily();

/// See also [CurrentBeatNotifier].
class CurrentBeatNotifierFamily extends Family<List<bool>> {
  /// See also [CurrentBeatNotifier].
  const CurrentBeatNotifierFamily();

  /// See also [CurrentBeatNotifier].
  CurrentBeatNotifierProvider call(
    List<Beat> beats,
  ) {
    return CurrentBeatNotifierProvider(
      beats,
    );
  }

  @override
  CurrentBeatNotifierProvider getProviderOverride(
    covariant CurrentBeatNotifierProvider provider,
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
  String? get name => r'currentBeatNotifierProvider';
}

/// See also [CurrentBeatNotifier].
class CurrentBeatNotifierProvider
    extends AutoDisposeNotifierProviderImpl<CurrentBeatNotifier, List<bool>> {
  /// See also [CurrentBeatNotifier].
  CurrentBeatNotifierProvider(
    List<Beat> beats,
  ) : this._internal(
          () => CurrentBeatNotifier()..beats = beats,
          from: currentBeatNotifierProvider,
          name: r'currentBeatNotifierProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$currentBeatNotifierHash,
          dependencies: CurrentBeatNotifierFamily._dependencies,
          allTransitiveDependencies:
              CurrentBeatNotifierFamily._allTransitiveDependencies,
          beats: beats,
        );

  CurrentBeatNotifierProvider._internal(
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
  List<bool> runNotifierBuild(
    covariant CurrentBeatNotifier notifier,
  ) {
    return notifier.build(
      beats,
    );
  }

  @override
  Override overrideWith(CurrentBeatNotifier Function() create) {
    return ProviderOverride(
      origin: this,
      override: CurrentBeatNotifierProvider._internal(
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
  AutoDisposeNotifierProviderElement<CurrentBeatNotifier, List<bool>>
      createElement() {
    return _CurrentBeatNotifierProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is CurrentBeatNotifierProvider && other.beats == beats;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, beats.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin CurrentBeatNotifierRef on AutoDisposeNotifierProviderRef<List<bool>> {
  /// The parameter `beats` of this provider.
  List<Beat> get beats;
}

class _CurrentBeatNotifierProviderElement
    extends AutoDisposeNotifierProviderElement<CurrentBeatNotifier, List<bool>>
    with CurrentBeatNotifierRef {
  _CurrentBeatNotifierProviderElement(super.provider);

  @override
  List<Beat> get beats => (origin as CurrentBeatNotifierProvider).beats;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
