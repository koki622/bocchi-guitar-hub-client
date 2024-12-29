import 'package:bocchi_guitar_hub_client/core/env/env.dart';

enum DestApiServerType {
  main,
  sub;

  String? getBaseUrl() {
    String? baseUrl = switch (this) {
      DestApiServerType.main => Env.apiBaseUrl,
      DestApiServerType.sub => Env.subApiBaseUrl,
    };
    return baseUrl;
  }

  static DestApiServerType fromString(String string) {
    return DestApiServerType.values.firstWhere(
      (element) => element.name == string,
      orElse: () => throw ArgumentError('Invalid DestApiServerType: $string'),
    );
  }
}
