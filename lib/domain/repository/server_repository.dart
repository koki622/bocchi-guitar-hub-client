import 'package:bocchi_guitar_hub_client/core/enum/dest_api_server.dart';

abstract interface class ServerRepository {
  Future<bool> isServerAvailable(
      {required DestApiServerType destApiServerType});
}
