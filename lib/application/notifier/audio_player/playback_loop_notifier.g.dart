// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'playback_loop_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$playbackLoopNotifierHash() =>
    r'd7b678c07c136a3b675afc8deca9e20cef5d6783';

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

abstract class _$PlaybackLoopNotifier
    extends BuildlessAutoDisposeNotifier<PlaybackLoopState> {
  late final Duration totalDuration;

  PlaybackLoopState build(
    Duration totalDuration,
  );
}

/// See also [PlaybackLoopNotifier].
@ProviderFor(PlaybackLoopNotifier)
const playbackLoopNotifierProvider = PlaybackLoopNotifierFamily();

/// See also [PlaybackLoopNotifier].
class PlaybackLoopNotifierFamily extends Family<PlaybackLoopState> {
  /// See also [PlaybackLoopNotifier].
  const PlaybackLoopNotifierFamily();

  /// See also [PlaybackLoopNotifier].
  PlaybackLoopNotifierProvider call(
    Duration totalDuration,
  ) {
    return PlaybackLoopNotifierProvider(
      totalDuration,
    );
  }

  @override
  PlaybackLoopNotifierProvider getProviderOverride(
    covariant PlaybackLoopNotifierProvider provider,
  ) {
    return call(
      provider.totalDuration,
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
  String? get name => r'playbackLoopNotifierProvider';
}

/// See also [PlaybackLoopNotifier].
class PlaybackLoopNotifierProvider extends AutoDisposeNotifierProviderImpl<
    PlaybackLoopNotifier, PlaybackLoopState> {
  /// See also [PlaybackLoopNotifier].
  PlaybackLoopNotifierProvider(
    Duration totalDuration,
  ) : this._internal(
          () => PlaybackLoopNotifier()..totalDuration = totalDuration,
          from: playbackLoopNotifierProvider,
          name: r'playbackLoopNotifierProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$playbackLoopNotifierHash,
          dependencies: PlaybackLoopNotifierFamily._dependencies,
          allTransitiveDependencies:
              PlaybackLoopNotifierFamily._allTransitiveDependencies,
          totalDuration: totalDuration,
        );

  PlaybackLoopNotifierProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.totalDuration,
  }) : super.internal();

  final Duration totalDuration;

  @override
  PlaybackLoopState runNotifierBuild(
    covariant PlaybackLoopNotifier notifier,
  ) {
    return notifier.build(
      totalDuration,
    );
  }

  @override
  Override overrideWith(PlaybackLoopNotifier Function() create) {
    return ProviderOverride(
      origin: this,
      override: PlaybackLoopNotifierProvider._internal(
        () => create()..totalDuration = totalDuration,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        totalDuration: totalDuration,
      ),
    );
  }

  @override
  AutoDisposeNotifierProviderElement<PlaybackLoopNotifier, PlaybackLoopState>
      createElement() {
    return _PlaybackLoopNotifierProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is PlaybackLoopNotifierProvider &&
        other.totalDuration == totalDuration;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, totalDuration.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin PlaybackLoopNotifierRef
    on AutoDisposeNotifierProviderRef<PlaybackLoopState> {
  /// The parameter `totalDuration` of this provider.
  Duration get totalDuration;
}

class _PlaybackLoopNotifierProviderElement
    extends AutoDisposeNotifierProviderElement<PlaybackLoopNotifier,
        PlaybackLoopState> with PlaybackLoopNotifierRef {
  _PlaybackLoopNotifierProviderElement(super.provider);

  @override
  Duration get totalDuration =>
      (origin as PlaybackLoopNotifierProvider).totalDuration;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
