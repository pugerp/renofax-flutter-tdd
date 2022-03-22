import 'dart:convert';
import 'dart:io';

import 'package:renofax/core/error/exceptions.dart';
import 'package:renofax/features/login/data/models/login_response_model.dart';
import 'package:http/http.dart' as http;

abstract class LoginRemoteDataSource {
  Future<LoginRespModel> login(String username, String password);
}

class LoginRemoteDataSourceImpl implements LoginRemoteDataSource {
  final http.Client client;

  LoginRemoteDataSourceImpl({required this.client});

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
    );

    if (response.statusCode == 200) {
      return LoginRespModel.fromJson(json.decode(response.body));
    } else {
      throw ServerException();
    }
  }
}
