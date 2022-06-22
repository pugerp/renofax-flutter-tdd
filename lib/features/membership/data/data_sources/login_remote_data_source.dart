import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:renofax/core/error/exceptions.dart';
import 'package:renofax/core/network/dio_client.dart';
import 'package:renofax/features/membership/data/models/login_request.dart';
import 'package:renofax/features/membership/data/models/login_response_model.dart';
import 'package:http/http.dart' as http;

abstract class LoginRemoteDataSource {
  Future<LoginRespModel> login(String username, String password);
  Future<Response> getToken(LoginRequest req);
}

class LoginRemoteDataSourceImpl implements LoginRemoteDataSource {
  final http.Client client;
  final DioClient dioClient;

  LoginRemoteDataSourceImpl({required this.client, required this.dioClient});

  @override
  Future<LoginRespModel> login(String username, String password) async {
    final url = Uri.parse('https://staging.renofax.com/api/token/');
    final parameter = {
      'username': username,
      'password': password,
    };
    final body = json.encode(parameter);

    final response = await client.post(
      url,
      headers: {
        HttpHeaders.contentTypeHeader: 'application/json',
      },
      body: body,
    ).timeout(Duration(seconds: 30));

    if (response.statusCode == 200) {
      return LoginRespModel.fromJson(json.decode(response.body));
    } else {
      throw ServerException();
    }
  }

  @override
  Future<Response> getToken(LoginRequest req) async {
    try {
      final response = await dioClient.post(
        'token/',
        data: req,
        options: Options(
            headers: {HttpHeaders.contentTypeHeader: 'application/json'}),
      );
      return response;
    } catch (e) {
      rethrow;
    }
  }
}
