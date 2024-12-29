import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart';
import 'package:path/path.dart' as p;
import 'package:archive/archive_io.dart';
import 'package:bocchi_guitar_hub_client/core/enum/job_status.dart';
import 'package:bocchi_guitar_hub_client/core/exception/http_exceptions.dart';
import 'package:bocchi_guitar_hub_client/core/exception/remote_job_exceptions.dart';
import 'package:http/http.dart' as http;
import 'package:bocchi_guitar_hub_client/infrastructure/model/remote_job/job_status.dart';
import 'package:http_parser/http_parser.dart';
import 'package:path_provider/path_provider.dart';
import 'package:uuid/uuid.dart';

enum HttpMethod { get, post, delete }

class SongWebapi {
  Stream<JobStatusData> sendRequestJob(
      {required String baseUrl,
      required String endpoint,
      String? jobId}) async* {
    String url = baseUrl + endpoint;
    Uri parsedUri = Uri.parse(url);
    final httpMethod;
    if (jobId != null) {
      parsedUri = parsedUri.replace(queryParameters: {'job_id': jobId});
      httpMethod = 'GET';
    } else {
      httpMethod = 'POST';
    }

    var request = http.Request(httpMethod, parsedUri);

    Map<String, String> header = {
      'Accept': 'text/event-stream',
      'Cache-Control': 'no-cache',
    };

    header.forEach((key, value) {
      request.headers[key] = value;
    });

    final client = http.Client();
    final response = await client.send(request);
    int statusCode = response.statusCode;

    if (statusCode != 200) {
      throw handleHttpError(statusCode);
    }

    await for (var dataLine in response.stream
        .transform(const Utf8Decoder())
        .transform(const LineSplitter())) {
      if (dataLine.contains('data:')) {
        // dataLineの中身は'data: 'で始まっているので、それを削除してからMapに変換
        final map = dataLine.replaceAll('data: ', '');
        if (map.isNotEmpty) {
          JobStatusData jobStatus = JobStatusData.fromJson(jsonDecode(map));
          yield jobStatus;

          if (jobStatus.jobStatus == JobStatusType.jobCompleted.message) {
            // jobが成功
            break;
          } else if (jobStatus.jobStatus == JobStatusType.jobFailed.message) {
            // jobが失敗
            throw JobFailedException('Job Failed Exception');
          }
        }
      }
    }
  }

  Future<dynamic> uploadFile(String baseUrl, String endpoint, String filePath,
      String mediaType) async {
    String url = baseUrl + endpoint;
    var request = http.MultipartRequest('POST', Uri.parse(url));
    request.files.add(await http.MultipartFile.fromPath('file', filePath,
        contentType: MediaType.parse(mediaType)));
    request.headers.addAll(
        {'Content-Type': 'multipart/form-data', 'accept': 'application/json'});
    var response = await request.send();

    if (response.statusCode != 200) {
      throw handleHttpError(response.statusCode);
    }
    var responseBody = await http.Response.fromStream(response);
    var jsonResponse = jsonDecode(responseBody.body);
    return jsonResponse;
  }

  // アップロードしたファイルを削除
  Future<void> deleteUploadFile(String baseUrl, String endpoint) async {
    String url = baseUrl + endpoint;
    await _sendHttpRequest(method: HttpMethod.delete, url: url);
  }

  Future<dynamic> downloadJson(
      {required String baseUrl,
      required String endpoint,
      Map<String, String>? queryParams}) async {
    String url = baseUrl + endpoint;
    Response response = await _sendHttpRequest(
        method: HttpMethod.get, url: url, queryParams: queryParams);
    var jsonResponse = jsonDecode(response.body) as Map<String, dynamic>;
    return jsonResponse;
  }

  Future<String> downloadAudioFile(
      {required String baseUrl,
      required String endpoint,
      required String destinationDir,
      Map<String, String>? queryParams,
      required String saveFileName}) async {
    String url = baseUrl + endpoint;
    Response response = await _sendHttpRequest(
        method: HttpMethod.get, url: url, queryParams: queryParams);

    final saveFilePath = File(p.join(destinationDir, saveFileName));
    try {
      await saveFilePath.writeAsBytes(response.bodyBytes);
    } catch (e) {
      throw Exception('ファイルの書きこみで例外発生： $e');
    }
    return saveFilePath.path;
  }

  Future<void> downloadZipFile(
      {required String baseUrl,
      required String endpoint,
      Map<String, String>? queryParams,
      required String destinationDir}) async {
    String url = baseUrl + endpoint;
    Response response = await _sendHttpRequest(
        method: HttpMethod.get, url: url, queryParams: queryParams);

    // 一時ディレクトリ取得
    final tempDir = await getTemporaryDirectory();

    // 一時ファイルにzipファイルを保存
    const uuid = Uuid();
    final saveFilePath = File(p.join(tempDir.path, '${uuid.v4()}.zip'));
    await saveFilePath.writeAsBytes(response.bodyBytes);

    // 解凍
    await extractFileToDisk(saveFilePath.path, destinationDir,
        asyncWrite: true);
  }

  Future<Response> _sendHttpRequest(
      {required HttpMethod method,
      required String url,
      Map<String, String>? queryParams}) async {
    final response = switch (method) {
      HttpMethod.get =>
        await http.get(Uri.parse(url).replace(queryParameters: queryParams)),
      HttpMethod.post =>
        await http.post(Uri.parse(url).replace(queryParameters: queryParams)),
      HttpMethod.delete =>
        await http.delete(Uri.parse(url).replace(queryParameters: queryParams)),
    };

    if (response.statusCode != 200) {
      throw handleHttpError(response.statusCode);
    }
    return response;
  }

  String? _getFileNameFromResponse(Response response) {
    // ヘッダーからContent-Dispositionを取得
    final contentDisposition = response.headers['content-disposition'];

    // ファイル名を取得する正規表現
    final fileNameRegExp = RegExp(r'filename="(.+)"');
    String? fileName;

    if (contentDisposition != null) {
      final match = fileNameRegExp.firstMatch(contentDisposition);
      if (match != null) {
        fileName = match.group(1); // ファイル名を取得
      }
    }
    return fileName;
  }
}
