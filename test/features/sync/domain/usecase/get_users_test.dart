
import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:renofax/core/usecases/usecase.dart';
import 'package:renofax/features/sync/data/models/user_model.dart';
import 'package:renofax/features/sync/domain/repositories/sync_repository.dart';
import 'package:renofax/features/sync/domain/usecase/get_users.dart';

import '../../../../fixtures/fixture_reader.dart';
import 'get_users_test.mocks.dart';

@GenerateMocks([SyncRepository])
void main() {
  late GetUsers usecase;
  late MockSyncRepository repo;

  final tUserModels = List<UserModel>.from(
      json.decode(fixture('users.json')).map((u) => UserModel.fromJson(u)));

  setUp((){
    repo = MockSyncRepository();
    usecase = GetUsers(repo: repo);
  });

  test('should get Users for the Sync Repository', () async {
    when(repo.getUsers()).thenAnswer((_) async => Right(tUserModels));

    final result = await usecase(NoParams());

    expect(result, Right(tUserModels));
    verify(repo.getUsers());
    verifyNoMoreInteractions(repo);
  });

}