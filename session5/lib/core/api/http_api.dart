import 'dart:convert';
import 'package:http/http.dart' as http;

import 'api.dart';
import 'api_exception.dart';

class HttpApi implements Api {
  @override
  Future<dynamic> get(String url) async {
    final response = await http.get(
      Uri.parse(url),
    );

    if (response.statusCode >= 200 && response.statusCode < 300) {
      return jsonDecode(response.body);
    }

    throw ApiException(
      message: 'Request failed',
      statusCode: response.statusCode,
    );
  }

  @override
  Future<dynamic> post(
    String url, {
    dynamic body,
  }) async {
    final response = await http.post(
      Uri.parse(url),
      headers: {
        'Content-Type': 'application/json',
      },
      body: jsonEncode(body),
    );

    if (response.statusCode >= 200 && response.statusCode < 300) {
      return jsonDecode(response.body);
    }

    throw ApiException(
      message: 'Request failed',
      statusCode: response.statusCode,
    );
  }

  @override
  Future<dynamic> put(
    String url, {
    dynamic body,
  }) async {
    final response = await http.put(
      Uri.parse(url),
      headers: {
        'Content-Type': 'application/json',
      },
      body: jsonEncode(body),
    );

    if (response.statusCode >= 200 && response.statusCode < 300) {
      return jsonDecode(response.body);
    }

    throw ApiException(
      message: 'Request failed',
      statusCode: response.statusCode,
    );
  }

  @override
  Future<dynamic> delete(String url) async {
    final response = await http.delete(
      Uri.parse(url),
    );

    if (response.statusCode >= 200 && response.statusCode < 300) {
      return null;
    }

    throw ApiException(
      message: 'Request failed',
      statusCode: response.statusCode,
    );
  }

  @override
  Future<dynamic> patch(String url, {body}) async {
    final response = await http.patch(
      Uri.parse(url),
      headers: {
        'Content-Type': 'application/json',
      },
      body: jsonEncode(body),
    );

    if (response.statusCode >= 200 && response.statusCode < 300) {
      return jsonDecode(response.body);
    }

    throw ApiException(
      message: 'Request failed',
      statusCode: response.statusCode,
    );
  }
}
