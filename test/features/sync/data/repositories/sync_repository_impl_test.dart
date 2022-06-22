import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:renofax/core/error/exceptions.dart';
import 'package:renofax/core/error/failures.dart';
import 'package:renofax/core/network/network_info.dart';
import 'package:renofax/features/sync/data/data_sources/sync_remote_data_source.dart';
import 'package:renofax/features/sync/data/models/user_model.dart';
import 'package:renofax/features/sync/data/repositories/sync_repository_impl.dart';

import '../../../../fixtures/fixture_reader.dart';
import 'sync_repository_impl_test.mocks.dart';


@GenerateMocks([SyncRemoteDataSource, NetworkInfo])
void main() {
  late SyncRepositoryImpl repo;
  late MockNetworkInfo networkInfo;
  late MockSyncRemoteDataSource remote;

  final tUserModels = List<UserModel>.from(
      json.decode(fixture('users.json')).map((u) => UserModel.fromJson(u)));

  setUp(() {
    networkInfo = MockNetworkInfo();
    remote = MockSyncRemoteDataSource();
    repo = SyncRepositoryImpl(remote: remote, networkInfo: networkInfo);
  });

  group('device is Online', () {
    setUp(() {
      when(networkInfo.isConnected).thenAnswer((_) async => true);
    });

    group('GetUsers', () {
      test('GetUsers is Success', () async {
        when(remote.getUsers()).thenAnswer((_) async => tUserModels);
        final result = await repo.getUsers();

        verify(networkInfo.isConnected);
        verify(remote.getUsers());
        expect(result, equals(Right(tUserModels)));
      });

      test('GetUsers is Failed', () async {
        when(remote.getUsers()).thenThrow(ServerException());
        final result = await repo.getUsers();

        verify(networkInfo.isConnected);
        verify(remote.getUsers());
        expect(result, equals(Left(ServerFailure())));
      });
    });
  });

  group('device is Offline', (){
    setUp((){
      when(networkInfo.isConnected).thenAnswer((_) async => false);
    });

    test('GetUsers is failed cause no internet connection', () async {
      final result = await repo.getUsers();
      verify(networkInfo.isConnected);
      expect(result, equals(Left(ConnectionFailure())));
    });
  });
}