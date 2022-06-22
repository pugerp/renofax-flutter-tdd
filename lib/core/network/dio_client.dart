import 'dart:io';

import 'package:dio/dio.dart';
import 'package:dio_logging_interceptor/dio_logging_interceptor.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:renofax/core/assets/constantas.dart' as Constanta;

class DioClient {
  final Dio _dio;
  final SharedPreferences _sp;

  DioClient(this._dio, this._sp) {
    final access_key = _sp.getString(Constanta.SP_REFRESH_KEY);
    final refresh_key = _sp.getString(Constanta.SP_REFRESH_KEY);

    Map<String, dynamic> headers = {
      HttpHeaders.contentTypeHeader: 'application/json',
    };

    if ((refresh_key != null && refresh_key.isNotEmpty) &&
        (access_key != null && access_key.isNotEmpty)) {
      headers.addAll({HttpHeaders.authorizationHeader: 'Bearer ${access_key}'});
    }

    _dio
      ..options.baseUrl = "https://staging.renofax.com/api/"
      ..options.connectTimeout = 30000
      ..options.receiveTimeout = 30000
      ..options.responseType = ResponseType.json
      ..interceptors
          .add(DioLoggingInterceptor(level: Level.body, compact: false))
      ..options.headers = headers;
  }

  //GET
  Future<Response> get(
    String url, {
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onReceiveProgresss,
  }) async {
    try {
      final Response response = await _dio.get(url,
          queryParameters: queryParameters,
          options: options,
          cancelToken: cancelToken,
          onReceiveProgress: onReceiveProgresss);
      return response;
    } catch (e) {
      rethrow;
    }
  }

  //POST
  Future<Response> post(
    String url, {
    data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    try {
      final Response response = await _dio.post(
        url,
        data: data,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
        onSendProgress: onSendProgress,
        onReceiveProgress: onReceiveProgress,
      );
      return response;
    } catch (e) {
      rethrow;
    }
  }

  //PUT
  Future<Response> put(
    String url, {
    data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    try {
      final Response response = await _dio.put(
        url,
        data: data,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
        onSendProgress: onSendProgress,
        onReceiveProgress: onReceiveProgress,
      );
      return response;
    } catch (e) {
      rethrow;
    }
  }

  //DELETE
  Future<dynamic> delete(
    String url, {
    data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    try {
      final Response response = await _dio.delete(
        url,
        data: data,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
      );
      return response.data;
    } catch (e) {
      rethrow;
    }
  }
}
