import 'package:bocchi_guitar_hub_client/core/constant/reference/webapi.dart';
import 'package:bocchi_guitar_hub_client/core/enum/dest_api_server.dart';
import 'package:bocchi_guitar_hub_client/core/exception/http_exceptions.dart';
import 'package:bocchi_guitar_hub_client/domain/repository/server_repository.dart';
import 'package:bocchi_guitar_hub_client/infrastructure/datasource/webapi/song_webapi.dart';

class ServerRepositoryImpl implements ServerRepository {
  final SongWebapi _songWebapi;

  ServerRepositoryImpl(this._songWebapi);
  @override
  Future<bool> isServerAvailable(
      {required DestApiServerType destApiServerType}) async {
    final baseUrl = destApiServerType.getBaseUrl();
    if (baseUrl == null) throw Exception('NullなbaseUrlが渡されました');
    try {
      var response = await _songWebapi.downloadJson(
          baseUrl: baseUrl, endpoint: WebapiEndpointConstant.checkServerStatus);
      return response['status'] == 'ok' ? true : false;
    } on HttpException catch (e) {
      return false;
    }
  }
}
