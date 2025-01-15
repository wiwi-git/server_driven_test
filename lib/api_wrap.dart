import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:server_app_test/api_result.dart';

class ApiWrap {
  String get apiBase {
    return 'https://mockURLS~~~';
  }

  Future<ApiResult<String>> get(
    String url,
  ) async {
    Map<String, String> headers = {
      'Content-Type': 'application/json',
    };

    String baseUrl = apiBase;
    String fullUrl = '$baseUrl/$url';

    final http.Response response = await http.get(
      Uri.parse(fullUrl),
      headers: headers,
    );

    final bool success =
        response.statusCode >= 200 && response.statusCode < 400;

    return ApiResult<String>(
      success: success,
      statusCode: response.statusCode,
      headers: response.headers,
      body: response.body,
    );
  }

  Future<ApiResult<String>> post(
    String url, {
    required Object body,
  }) async {
    Map<String, String> headers = {
      'Content-Type': 'application/json',
    };

    String baseUrl = apiBase;

    final response = await http.post(
      Uri.parse('$baseUrl/$url'),
      headers: headers,
      body: json.encode(body),
    );

    final bool success =
        response.statusCode >= 200 && response.statusCode < 400;
    return ApiResult(
      success: success,
      statusCode: response.statusCode,
      headers: response.headers,
      body: response.body,
    );
  }
}
