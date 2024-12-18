// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'beat_position_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$beatPositionNotifierHash() =>
    r'63d0b9cdb2ba05ee5d7d9157fb14a90e9222b0cc';

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

abstract class _$BeatPositionNotifier
    extends BuildlessAutoDisposeNotifier<int> {
  late final List<Beat> beats;

  int build(
    List<Beat> beats,
  );
}

/// See also [BeatPositionNotifier].
@ProviderFor(BeatPositionNotifier)
const beatPositionNotifierProvider = BeatPositionNotifierFamily();

/// See also [BeatPositionNotifier].
class BeatPositionNotifierFamily extends Family<int> {
  /// See also [BeatPositionNotifier].
  const BeatPositionNotifierFamily();

  /// See also [BeatPositionNotifier].
  BeatPositionNotifierProvider call(
    List<Beat> beats,
  ) {
    return BeatPositionNotifierProvider(
      beats,
    );
  }

  @override
  BeatPositionNotifierProvider getProviderOverride(
    covariant BeatPositionNotifierProvider provider,
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
  String? get name => r'beatPositionNotifierProvider';
}

/// See also [BeatPositionNotifier].
class BeatPositionNotifierProvider
    extends AutoDisposeNotifierProviderImpl<BeatPositionNotifier, int> {
  /// See also [BeatPositionNotifier].
  BeatPositionNotifierProvider(
    List<Beat> beats,
  ) : this._internal(
          () => BeatPositionNotifier()..beats = beats,
          from: beatPositionNotifierProvider,
          name: r'beatPositionNotifierProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$beatPositionNotifierHash,
          dependencies: BeatPositionNotifierFamily._dependencies,
          allTransitiveDependencies:
              BeatPositionNotifierFamily._allTransitiveDependencies,
          beats: beats,
        );

  BeatPositionNotifierProvider._internal(
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
    covariant BeatPositionNotifier notifier,
  ) {
    return notifier.build(
      beats,
    );
  }

  @override
  Override overrideWith(BeatPositionNotifier Function() create) {
    return ProviderOverride(
      origin: this,
      override: BeatPositionNotifierProvider._internal(
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
  AutoDisposeNotifierProviderElement<BeatPositionNotifier, int>
      createElement() {
    return _BeatPositionNotifierProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is BeatPositionNotifierProvider && other.beats == beats;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, beats.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin BeatPositionNotifierRef on AutoDisposeNotifierProviderRef<int> {
  /// The parameter `beats` of this provider.
  List<Beat> get beats;
}

class _BeatPositionNotifierProviderElement
    extends AutoDisposeNotifierProviderElement<BeatPositionNotifier, int>
    with BeatPositionNotifierRef {
  _BeatPositionNotifierProviderElement(super.provider);

  @override
  List<Beat> get beats => (origin as BeatPositionNotifierProvider).beats;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
