import 'dart:convert';
import 'dart:io';

import 'package:renofax/core/error/exceptions.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:http/http.dart' as http;
import 'package:renofax/core/assets/constantas.dart' as Constanta;

import '../../domain/entities/user.dart';
import '../models/user_model.dart';

abstract class SyncRemoteDataSource {
  Future<List<User>> getUsers();
}

class SyncRemoteDataSourceImpl implements SyncRemoteDataSource {
  final http.Client client;
  final SharedPreferences sharedPreferences;

  SyncRemoteDataSourceImpl({
    required this.client,
    required this.sharedPreferences,
  });

  @override
  Future<List<User>> getUsers() async {
    final url = Uri.parse('https://staging.renofax.com/api/users/');
    final response = await client.get(
      url,
      headers: {
        HttpHeaders.contentTypeHeader: 'application/json',
        HttpHeaders.authorizationHeader:
            'Bearer ${sharedPreferences.get(Constanta.SP_ACCESS_KEY)}',
      },
    );

    if (response.statusCode == 200) {
      return List<User>.from(
        json.decode(response.body).map(
              (user) => UserModel.fromJson(user),
            ),
      );
    } else {
      throw ServerException();
    }
  }
}
