import 'dart:convert';
import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:renofax/core/error/exceptions.dart';
import 'package:renofax/features/complainant/data/data_sources/complaint_remote_data_source.dart';
import 'package:renofax/features/complainant/data/models/complaint_test.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:renofax/core/assets/constantas.dart' as Constanta;

import '../../../../fixtures/fixture_reader.dart';
import 'complaint_remote_data_source_test.mocks.dart';

@GenerateMocks([http.Client, SharedPreferences])
void main() {
  late ComplaintRemoteDataSourceImpl dataSource;
  late MockClient mockClient;
  late MockSharedPreferences mockSharedPreferences;
  late Map<String, String> headers;

  final tComplaints = List<ComplaintTest>.from(json
      .decode(fixture('complaints.json'))
      .map((c) => ComplaintTest.fromJson(c)));

  final tComplaint = ComplaintTest.fromJson(json.decode(fixture('complaint.json')));

  setUp(() {
    mockClient = MockClient();
    mockSharedPreferences = MockSharedPreferences();
    dataSource = ComplaintRemoteDataSourceImpl(
        client: mockClient, sharedPreferences: mockSharedPreferences);

    when(mockSharedPreferences.get(any)).thenReturn('key_access');

    headers = {
      HttpHeaders.contentTypeHeader: 'application/json',
      HttpHeaders.authorizationHeader:
      'Bearer ${mockSharedPreferences.get(Constanta.SP_ACCESS_KEY)}'
    };
  });

  group('getComplaints', () {
    test(
        'should perform a GET request on a URL',
        () async {


      when(mockClient.get(any, headers: headers)).thenAnswer(
          (_) async => http.Response(fixture('complaints.json'), 200));

      final result = await dataSource.getComplaints();
      final url = Uri.parse('https://staging.renofax.com/api/cards');

      verify(mockClient.get(url, headers: headers));

      expect(result, equals(tComplaints));
    });

    test('should throw a ServerException when the response code not 202', () {
      when(mockClient.get(any, headers: headers)).thenAnswer(
              (_) async => http.Response('Something Wrong', 404));

      expect(() async => await dataSource.getComplaints(), throwsA(isA<ServerException>()));
    });
  });

  group('getComplaintById', (){
    final tComplaintId = 1;
    test('should perform a GET request on a URL with ID complaint', () async {
      when(mockClient.get(any, headers: headers)).thenAnswer((realInvocation) async => http.Response(fixture('complaint.json'), 200));

      final result = await dataSource.getComplaintById(tComplaintId);
      final url = Uri.parse('https://staging.renofax.com/api/cards/${tComplaintId}');

      verify(mockClient.get(url, headers: headers));
      expect(result, equals(tComplaint));
    });

    test('should throw a ServerException when the response code not 202', () {
      when(mockClient.get(any, headers: headers)).thenAnswer((_) async => http.Response('Something Wrong', 404));

      expect(() async => await dataSource.getComplaintById(tComplaintId), throwsA(isA<ServerException>()));
    });
  });
}
