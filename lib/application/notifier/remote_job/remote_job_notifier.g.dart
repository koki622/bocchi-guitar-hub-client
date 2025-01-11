// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'remote_job_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$remoteJobNotifierHash() => r'473d28ac3b6bbb61fdf1db7125166f464d7f39e0';

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

abstract class _$RemoteJobNotifier
    extends BuildlessAutoDisposeNotifier<RemoteJobStatus?> {
  late final int songId;

  RemoteJobStatus? build(
    int songId,
  );
}

/// See also [RemoteJobNotifier].
@ProviderFor(RemoteJobNotifier)
const remoteJobNotifierProvider = RemoteJobNotifierFamily();

/// See also [RemoteJobNotifier].
class RemoteJobNotifierFamily extends Family<RemoteJobStatus?> {
  /// See also [RemoteJobNotifier].
  const RemoteJobNotifierFamily();

  /// See also [RemoteJobNotifier].
  RemoteJobNotifierProvider call(
    int songId,
  ) {
    return RemoteJobNotifierProvider(
      songId,
    );
  }

  @override
  RemoteJobNotifierProvider getProviderOverride(
    covariant RemoteJobNotifierProvider provider,
  ) {
    return call(
      provider.songId,
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
  String? get name => r'remoteJobNotifierProvider';
}

/// See also [RemoteJobNotifier].
class RemoteJobNotifierProvider extends AutoDisposeNotifierProviderImpl<
    RemoteJobNotifier, RemoteJobStatus?> {
  /// See also [RemoteJobNotifier].
  RemoteJobNotifierProvider(
    int songId,
  ) : this._internal(
          () => RemoteJobNotifier()..songId = songId,
          from: remoteJobNotifierProvider,
          name: r'remoteJobNotifierProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$remoteJobNotifierHash,
          dependencies: RemoteJobNotifierFamily._dependencies,
          allTransitiveDependencies:
              RemoteJobNotifierFamily._allTransitiveDependencies,
          songId: songId,
        );

  RemoteJobNotifierProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.songId,
  }) : super.internal();

  final int songId;

  @override
  RemoteJobStatus? runNotifierBuild(
    covariant RemoteJobNotifier notifier,
  ) {
    return notifier.build(
      songId,
    );
  }

  @override
  Override overrideWith(RemoteJobNotifier Function() create) {
    return ProviderOverride(
      origin: this,
      override: RemoteJobNotifierProvider._internal(
        () => create()..songId = songId,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        songId: songId,
      ),
    );
  }

  @override
  AutoDisposeNotifierProviderElement<RemoteJobNotifier, RemoteJobStatus?>
      createElement() {
    return _RemoteJobNotifierProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is RemoteJobNotifierProvider && other.songId == songId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, songId.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin RemoteJobNotifierRef on AutoDisposeNotifierProviderRef<RemoteJobStatus?> {
  /// The parameter `songId` of this provider.
  int get songId;
}

class _RemoteJobNotifierProviderElement
    extends AutoDisposeNotifierProviderElement<RemoteJobNotifier,
        RemoteJobStatus?> with RemoteJobNotifierRef {
  _RemoteJobNotifierProviderElement(super.provider);

  @override
  int get songId => (origin as RemoteJobNotifierProvider).songId;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
