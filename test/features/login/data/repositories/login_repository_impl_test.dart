import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:renofax/core/error/exceptions.dart';
import 'package:renofax/core/error/failures.dart';
import 'package:renofax/core/network/network_info.dart';
import 'package:renofax/features/membership/data/data_sources/login_remote_data_source.dart';
import 'package:renofax/features/membership/data/models/login_response_model.dart';
import 'package:renofax/features/membership/data/repositories/login_repository_impl.dart';

import '../../../../fixtures/fixture_reader.dart';
import 'login_repository_impl_test.mocks.dart';

@GenerateMocks([NetworkInfo, LoginRemoteDataSource])
void main() {
  late LoginRepositoryImpl repository;
  late MockLoginRemoteDataSource mockLoginRemoteDataSource;
  late MockNetworkInfo mockNetworkInfo;

  final tLoginRespModel =
      LoginRespModel.fromJson(json.decode(fixture('login_resp.json')));

  setUp(() {
    mockLoginRemoteDataSource = MockLoginRemoteDataSource();
    mockNetworkInfo = MockNetworkInfo();
    repository = LoginRepositoryImpl(
      loginRemote: mockLoginRemoteDataSource,
      networkInfo: mockNetworkInfo,
    );
  });

  group('device is Online', () {
    setUp(() {
      when(mockNetworkInfo.isConnected).thenAnswer((_) async => true);
    });
    test('GetTokenAccessAAndRefresh is success', () async {
      when(mockLoginRemoteDataSource.login(any, any))
          .thenAnswer((_) async => tLoginRespModel);

      final result = await repository.getTokenAccessAndRefresh('username', 'password');
      verify(mockNetworkInfo.isConnected);
      verify(mockLoginRemoteDataSource.login('username', 'password'));
      expect(result, equals(Right(tLoginRespModel)));
    });

    test('GetTokenAccessAAndRefresh is unsuccess', () async {
      when(mockLoginRemoteDataSource.login(any, any)).thenThrow(ServerException());

      final result = await repository.getTokenAccessAndRefresh('username', 'password');
      verify(mockNetworkInfo.isConnected);
      verify(mockLoginRemoteDataSource.login('username', 'password'));
      expect(result, equals(Left(ServerFailure())));
    });
  });

  group('device is Offline', () {
    setUp(() {
      when(mockNetworkInfo.isConnected).thenAnswer((_) async => false);
    });


    test('GetTokenAccessAndRefresh is unsuccess because no connection', () async {

      final result = await repository.getTokenAccessAndRefresh('username', 'password');

      verify(mockNetworkInfo.isConnected);
      expect(result, equals(Left(ConnectionFailure())));
    });
  });
}
