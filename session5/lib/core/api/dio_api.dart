import 'package:dio/dio.dart';

import 'api.dart';
import 'api_exception.dart';

class DioApi implements Api {
  final Dio dio;

  DioApi({required this.dio});

  @override
  Future<dynamic> delete(String url) async {
    try {
      final Response response = await dio.delete(url);
      return response.data;
    } on DioException catch (e) {
      throw ApiException(
          message: e.message ?? 'get failed',
          statusCode: e.response?.statusCode);
    }
  }

  @override
  Future<dynamic> get(String url) async {
    try {
      final Response response = await dio.get(url);
      return response.data;
    } on DioException catch (e) {
      throw ApiException(
          message: e.message ?? 'get failed',
          statusCode: e.response?.statusCode);
    }
  }

  @override
  Future<dynamic> patch(String url, {body}) async {
    try {
      final Response response = await dio.patch(url, data: body);
      return response.data;
    } on DioException catch (e) {
      throw ApiException(
          message: e.message ?? 'get failed',
          statusCode: e.response?.statusCode);
    }
  }

  @override
  Future<dynamic> post(String url, {body}) async {
    try {
      final Response response = await dio.post(url, data: body);
      return response.data;
    } on DioException catch (e) {
      throw ApiException(
          message: e.message ?? 'get failed',
          statusCode: e.response?.statusCode);
    }
  }

  @override
  Future<dynamic> put(String url, {body}) async {
    try {
      final Response response = await dio.put(url, data: body);
      return response.data;
    } on DioException catch (e) {
      throw ApiException(
          message: e.message ?? 'get failed',
          statusCode: e.response?.statusCode);
    }
  }
}
