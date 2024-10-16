import 'dart:async';
import 'dart:convert';

import 'package:bocchi_guitar_hub_client/core/enum/job_status.dart';
import 'package:bocchi_guitar_hub_client/core/exception/http_exceptions.dart';
import 'package:bocchi_guitar_hub_client/core/exception/remote_job_exceptions.dart';
import 'package:http/http.dart' as http;
import 'package:bocchi_guitar_hub_client/core/env/env.dart';
import 'package:bocchi_guitar_hub_client/infrastructure/model/job_status.dart';
import 'package:http_parser/http_parser.dart';

class SongWebapi {
  final baseUrl = Env.apiBaseUrl;

  Stream<JobStatusData> sendRequestJob(String endpoint) async* {
    String url = baseUrl + endpoint;
    var request = http.Request('POST', Uri.parse(url));

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

          if (jobStatus.jobStatus == JobStatusType.jobSuccess.message) {
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

  Future<dynamic> uploadFile(
      String endpoint, String filePath, String mediaType) async {
    String url = baseUrl + endpoint;
    var request = http.MultipartRequest('POST', Uri.parse(url));
    request.files.add(await http.MultipartFile.fromPath('file', filePath,
        contentType: MediaType.parse(mediaType)));
    request.headers.addAll(
        {'Content-Type': 'multipart/form-data', 'accept': 'application/json'});
    var response = await request.send();

    if (response.statusCode == 200) {
      var responseBody = await http.Response.fromStream(response);
      var jsonResponse = jsonDecode(responseBody.body);
      return jsonResponse;
    } else {
      throw Exception('Failed to upload audio file');
    }
  }
}
