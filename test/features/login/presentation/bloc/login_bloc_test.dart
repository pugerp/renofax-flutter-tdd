import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:renofax/core/error/failures.dart';
import 'package:renofax/features/membership/data/models/login_response_model.dart';
import 'package:renofax/features/membership/domain/usecases/get_token_access_and_refresh.dart';
import 'package:renofax/features/membership/domain/usecases/usecase_login.dart';
import 'package:renofax/features/membership/presentation/bloc/login_bloc.dart';

import '../../../../fixtures/fixture_reader.dart';
import 'login_bloc_test.mocks.dart';

@GenerateMocks([GetTokenAccessAndRefresh, UsecaseLogin])
void main() {
  late LoginBloc bloc;
  late MockGetTokenAccessAndRefresh mockGetTokenAccessAndRefresh;
  late MockUsecaseLogin mockUsecaseLogin;

  setUp(() {
    mockGetTokenAccessAndRefresh = MockGetTokenAccessAndRefresh();
    mockUsecaseLogin = MockUsecaseLogin();
    bloc = LoginBloc(getTokenAccessAndRefresh: mockGetTokenAccessAndRefresh, login: mockUsecaseLogin);
  });

  group('GetToken', () {
    final tLoginResp =
        LoginRespModel.fromJson(json.decode(fixture('login_resp.json')));

    test('should emit [Loading, Success] when action login is success', () async* {
      when(mockGetTokenAccessAndRefresh(any))
          .thenAnswer((_) async => Right(tLoginResp));

      final expected = [
        Initial(),
        Loading(),
        Success(resp: tLoginResp),
      ];

      expectLater(bloc, emitsInOrder(expected));
      bloc.add(GetToken(
        username: 'username',
        password: 'password',
      ));
    });

    test('should emit[Loading, Error] when action login is failed', () async* {
      when(mockGetTokenAccessAndRefresh(any))
          .thenAnswer((_) async => Left(ServerFailure()));

      final expected = [
        Initial(),
        Loading(),
        Error(
            message:
                'Failed login, please check your username or password again'),
      ];

      expectLater(bloc, emitsInOrder(expected));
      bloc.add(GetToken(
        username: 'username',
        password: 'password',
      ));
    });
  });
}
