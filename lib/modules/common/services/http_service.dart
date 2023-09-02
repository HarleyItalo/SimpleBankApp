import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:simple_bank_app/modules/common/common_module.dart';

class HttpService {
  final http.Client client;
  HttpService({required this.client});

  Future<Map<String, dynamic>> get({
    required String path,
    Map<String, String>? headers,
  }) async {
    try {
      final response = await client.get(
        mountPath(path: path),
        headers: headers,
      );
      return jsonDecode(response.body);
    } on Exception {
      return <String, dynamic>{};
    }
  }

  Future<Map<String, dynamic>> post({
    required String path,
    required Map<String, dynamic> body,
    Map<String, String>? headers,
  }) async {
    headers ??= <String, String>{};
    headers['Content-Type'] = 'application/json';

    try {
      final response = await client.post(
        mountPath(path: path),
        headers: headers,
        body: jsonEncode(body),
      );
      return jsonDecode(response.body);
    } on Exception {
      return <String, dynamic>{};
    }
  }

  Uri mountPath({required String path}) {
    if (path.contains("http:")) {
      return Uri.parse(path);
    }
    return Uri.parse("$apiUrl/$path");
  }
}
