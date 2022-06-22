import 'dart:convert';
import 'dart:io';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:renofax/core/assets/constantas.dart';
import 'package:renofax/features/sync/data/data_sources/sync_remote_data_source.dart';
import 'package:renofax/features/sync/data/models/user_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../fixtures/fixture_reader.dart';
import 'synct_remote_data_source_test.mocks.dart';

@GenerateMocks([http.Client, SharedPreferences])
void main() {
  late SyncRemoteDataSourceImpl dataSource;
  late MockClient client;
  late MockSharedPreferences sharedPreferences;
  late Map<String, String> headers;
  final tUserModels = List<UserModel>.from(json.decode(fixture('users.json'))
      .map((u) => UserModel.fromJson(u)));

  setUp((){
    client = MockClient();
    sharedPreferences = MockSharedPreferences();
    dataSource = SyncRemoteDataSourceImpl(client: client, sharedPreferences: sharedPreferences);

    when(sharedPreferences.get(any)).thenReturn('key_access');

    headers = {
      HttpHeaders.contentTypeHeader: 'application/json',
      HttpHeaders.authorizationHeader: 'Bearer ${sharedPreferences.get(SP_ACCESS_KEY)}'

    };
  });

  group('sync data', (){
    test('should perform a GET request on URL get data Users', () async {
      when(client.get(any, headers: headers)).thenAnswer((_) async => http.Response(fixture('users.json'), 200));

      final result = await dataSource.getUsers();
      final url = Uri.parse('https://staging.renofax.com/api/users/');

      verify(client.get(url, headers: headers));
      expect(result, equals(tUserModels));
    });

  });
}
