import 'dart:convert';
import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:http/http.dart' as http;
import 'package:mockito/mockito.dart';
import 'package:renofax/core/error/exceptions.dart';
import 'package:renofax/features/login/data/data_sources/login_remote_data_source.dart';
import 'package:renofax/features/login/data/models/login_response_model.dart';

import '../../../../fixtures/fixture_reader.dart';
import 'login_remote_data_source_test.mocks.dart';

@GenerateMocks([http.Client])
void main() {
  late LoginRemoteDataSourceImpl dataSource;
  late MockClient mockClient;

  final tUsername = 'renofax-admin';
  final tPassword = 'testament';

  final tLoginResp =
      LoginRespModel.fromJson(json.decode(fixture('login_resp.json')));

  setUp(() {
    mockClient = MockClient();
    dataSource = LoginRemoteDataSourceImpl(client: mockClient);
  });

  group('getAccessAndRefreshToken', () {
    test(
        'should perform a POST request on a URL token with username and password',
        () async {
      when(
        mockClient.post(
          any,
          body: anyNamed('body'),
          headers: anyNamed('headers'),
        ),
      ).thenAnswer((_) async => http.Response(fixture('login_resp.json'), 200));

      final result = await dataSource.login(tUsername, tPassword);
      final url = Uri.parse('https://staging.renofax.com/api/token/');
      final body = {
        'username': tUsername,
        'password': tPassword,
      };
      final contentType = 'application/json';

      verify(
        mockClient.post(
          url,
          body: json.encode(body),
          headers: {
            HttpHeaders.contentTypeHeader: contentType,
          },
        ),
      );
      expect(result, equals(tLoginResp));
    });

    test(
      'should throw a ServerException when the response code not 202',
      () {
        when(
          mockClient.post(
            any,
            body: anyNamed('body'),
            headers: anyNamed('headers'),
          ),
        ).thenAnswer((_) async => http.Response('Something Wrong', 404));

        expect(
          () async => await dataSource.login(tUsername, tPassword),
          throwsA(isA<ServerException>()),
        );
      },
    );
  });
}
