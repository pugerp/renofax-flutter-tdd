import 'dart:convert';
import 'dart:io';

import 'package:renofax/core/assets/constantas.dart' as Constanta;
import 'package:renofax/core/error/exceptions.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../models/complaint.dart';


abstract class ComplaintRemoteDataSource {
  Future<List<Complaint>> getComplaints();
  Future<Complaint> getComplaintById(int id);
}

class ComplaintRemoteDataSourceImpl implements ComplaintRemoteDataSource {
  final http.Client client;
  final SharedPreferences sharedPreferences;

  ComplaintRemoteDataSourceImpl({
    required this.client,
    required this.sharedPreferences,
  });

  @override
  Future<List<Complaint>> getComplaints() async {
    final url = Uri.parse('https://staging.renofax.com/api/cards');
    final response = await client.get(
      url,
      headers: {
        HttpHeaders.contentTypeHeader: 'application/json',
        HttpHeaders.authorizationHeader:
            'Bearer ${sharedPreferences.get(Constanta.SP_ACCESS_KEY)}',
      },
    );

    if (response.statusCode == 200) {
      return List<Complaint>.from(
        json.decode(response.body).map(
              (complaint) => Complaint.fromJson(complaint),
            ),
      );
    } else {
      throw ServerException();
    }
  }

  @override
  Future<Complaint> getComplaintById(int id) async {
    final url = Uri.parse('https://staging.renofax.com/api/cards/${id}');
    final response = await client.get(
      url,
      headers: {
        HttpHeaders.contentTypeHeader: 'application/json',
        HttpHeaders.authorizationHeader:
        'Bearer ${sharedPreferences.get(Constanta.SP_ACCESS_KEY)}',
      },
    );

    if (response.statusCode == 200) {
      return Complaint.fromJson(json.decode(response.body));
    } else {
      throw ServerException();
    }
  }
}
