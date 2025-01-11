// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'selected_section_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$selectedSectionNotifierHash() =>
    r'45e295d8a5d24e93a340fcd0396b8b6ebe57b8b2';

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

abstract class _$SelectedSectionNotifier
    extends BuildlessAutoDisposeNotifier<List<int>> {
  late final Song song;

  List<int> build(
    Song song,
  );
}

/// See also [SelectedSectionNotifier].
@ProviderFor(SelectedSectionNotifier)
const selectedSectionNotifierProvider = SelectedSectionNotifierFamily();

/// See also [SelectedSectionNotifier].
class SelectedSectionNotifierFamily extends Family<List<int>> {
  /// See also [SelectedSectionNotifier].
  const SelectedSectionNotifierFamily();

  /// See also [SelectedSectionNotifier].
  SelectedSectionNotifierProvider call(
    Song song,
  ) {
    return SelectedSectionNotifierProvider(
      song,
    );
  }

  @override
  SelectedSectionNotifierProvider getProviderOverride(
    covariant SelectedSectionNotifierProvider provider,
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
  String? get name => r'selectedSectionNotifierProvider';
}

/// See also [SelectedSectionNotifier].
class SelectedSectionNotifierProvider extends AutoDisposeNotifierProviderImpl<
    SelectedSectionNotifier, List<int>> {
  /// See also [SelectedSectionNotifier].
  SelectedSectionNotifierProvider(
    Song song,
  ) : this._internal(
          () => SelectedSectionNotifier()..song = song,
          from: selectedSectionNotifierProvider,
          name: r'selectedSectionNotifierProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$selectedSectionNotifierHash,
          dependencies: SelectedSectionNotifierFamily._dependencies,
          allTransitiveDependencies:
              SelectedSectionNotifierFamily._allTransitiveDependencies,
          song: song,
        );

  SelectedSectionNotifierProvider._internal(
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
  List<int> runNotifierBuild(
    covariant SelectedSectionNotifier notifier,
  ) {
    return notifier.build(
      song,
    );
  }

  @override
  Override overrideWith(SelectedSectionNotifier Function() create) {
    return ProviderOverride(
      origin: this,
      override: SelectedSectionNotifierProvider._internal(
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
  AutoDisposeNotifierProviderElement<SelectedSectionNotifier, List<int>>
      createElement() {
    return _SelectedSectionNotifierProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is SelectedSectionNotifierProvider && other.song == song;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, song.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin SelectedSectionNotifierRef on AutoDisposeNotifierProviderRef<List<int>> {
  /// The parameter `song` of this provider.
  Song get song;
}

class _SelectedSectionNotifierProviderElement
    extends AutoDisposeNotifierProviderElement<SelectedSectionNotifier,
        List<int>> with SelectedSectionNotifierRef {
  _SelectedSectionNotifierProviderElement(super.provider);

  @override
  Song get song => (origin as SelectedSectionNotifierProvider).song;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
