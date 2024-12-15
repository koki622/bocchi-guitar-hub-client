// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'selected_tab_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$selectedTabNotifierHash() =>
    r'87ffc208d58f8e58eb1ec34dd0831b753fb0a474';

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

abstract class _$SelectedTabNotifier
    extends BuildlessAutoDisposeNotifier<Map<SelectedTabType, bool>> {
  late final SelectedTabType initTabType;

  Map<SelectedTabType, bool> build(
    SelectedTabType initTabType,
  );
}

/// See also [SelectedTabNotifier].
@ProviderFor(SelectedTabNotifier)
const selectedTabNotifierProvider = SelectedTabNotifierFamily();

/// See also [SelectedTabNotifier].
class SelectedTabNotifierFamily extends Family<Map<SelectedTabType, bool>> {
  /// See also [SelectedTabNotifier].
  const SelectedTabNotifierFamily();

  /// See also [SelectedTabNotifier].
  SelectedTabNotifierProvider call(
    SelectedTabType initTabType,
  ) {
    return SelectedTabNotifierProvider(
      initTabType,
    );
  }

  @override
  SelectedTabNotifierProvider getProviderOverride(
    covariant SelectedTabNotifierProvider provider,
  ) {
    return call(
      provider.initTabType,
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
  String? get name => r'selectedTabNotifierProvider';
}

/// See also [SelectedTabNotifier].
class SelectedTabNotifierProvider extends AutoDisposeNotifierProviderImpl<
    SelectedTabNotifier, Map<SelectedTabType, bool>> {
  /// See also [SelectedTabNotifier].
  SelectedTabNotifierProvider(
    SelectedTabType initTabType,
  ) : this._internal(
          () => SelectedTabNotifier()..initTabType = initTabType,
          from: selectedTabNotifierProvider,
          name: r'selectedTabNotifierProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$selectedTabNotifierHash,
          dependencies: SelectedTabNotifierFamily._dependencies,
          allTransitiveDependencies:
              SelectedTabNotifierFamily._allTransitiveDependencies,
          initTabType: initTabType,
        );

  SelectedTabNotifierProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.initTabType,
  }) : super.internal();

  final SelectedTabType initTabType;

  @override
  Map<SelectedTabType, bool> runNotifierBuild(
    covariant SelectedTabNotifier notifier,
  ) {
    return notifier.build(
      initTabType,
    );
  }

  @override
  Override overrideWith(SelectedTabNotifier Function() create) {
    return ProviderOverride(
      origin: this,
      override: SelectedTabNotifierProvider._internal(
        () => create()..initTabType = initTabType,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        initTabType: initTabType,
      ),
    );
  }

  @override
  AutoDisposeNotifierProviderElement<SelectedTabNotifier,
      Map<SelectedTabType, bool>> createElement() {
    return _SelectedTabNotifierProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is SelectedTabNotifierProvider &&
        other.initTabType == initTabType;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, initTabType.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin SelectedTabNotifierRef
    on AutoDisposeNotifierProviderRef<Map<SelectedTabType, bool>> {
  /// The parameter `initTabType` of this provider.
  SelectedTabType get initTabType;
}

class _SelectedTabNotifierProviderElement
    extends AutoDisposeNotifierProviderElement<SelectedTabNotifier,
        Map<SelectedTabType, bool>> with SelectedTabNotifierRef {
  _SelectedTabNotifierProviderElement(super.provider);

  @override
  SelectedTabType get initTabType =>
      (origin as SelectedTabNotifierProvider).initTabType;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
