// Mocks generated by Mockito 5.0.17 from annotations
// in renofax/test/features/login/presentation/bloc/login_bloc_test.dart.
// Do not manually edit this file.

import 'dart:async' as _i5;

import 'package:dartz/dartz.dart' as _i3;
import 'package:mockito/mockito.dart' as _i1;
import 'package:renofax/core/error/failures.dart' as _i6;
import 'package:renofax/features/membership/data/models/token.dart' as _i9;
import 'package:renofax/features/membership/domain/entities/login_reponse.dart'
    as _i7;
import 'package:renofax/features/membership/domain/repositories/login_repository.dart'
    as _i2;
import 'package:renofax/features/membership/domain/usecases/get_token_access_and_refresh.dart'
    as _i4;
import 'package:renofax/features/membership/domain/usecases/usecase_login.dart'
    as _i8;

// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types

class _FakeLoginRepository_0 extends _i1.Fake implements _i2.LoginRepository {}

class _FakeEither_1<L, R> extends _i1.Fake implements _i3.Either<L, R> {}

/// A class which mocks [GetTokenAccessAndRefresh].
///
/// See the documentation for Mockito's code generation for more information.
class MockGetTokenAccessAndRefresh extends _i1.Mock
    implements _i4.GetTokenAccessAndRefresh {
  MockGetTokenAccessAndRefresh() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i2.LoginRepository get repository =>
      (super.noSuchMethod(Invocation.getter(#repository),
          returnValue: _FakeLoginRepository_0()) as _i2.LoginRepository);
  @override
  _i5.Future<_i3.Either<_i6.Failure, _i7.LoginResp>> call(_i4.Params? params) =>
      (super.noSuchMethod(Invocation.method(#call, [params]),
              returnValue: Future<_i3.Either<_i6.Failure, _i7.LoginResp>>.value(
                  _FakeEither_1<_i6.Failure, _i7.LoginResp>()))
          as _i5.Future<_i3.Either<_i6.Failure, _i7.LoginResp>>);
}

/// A class which mocks [UsecaseLogin].
///
/// See the documentation for Mockito's code generation for more information.
class MockUsecaseLogin extends _i1.Mock implements _i8.UsecaseLogin {
  MockUsecaseLogin() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i2.LoginRepository get repo => (super.noSuchMethod(Invocation.getter(#repo),
      returnValue: _FakeLoginRepository_0()) as _i2.LoginRepository);
  @override
  _i5.Future<_i3.Either<_i6.Failure, _i9.Token>> call(_i8.Params? params) =>
      (super.noSuchMethod(Invocation.method(#call, [params]),
              returnValue: Future<_i3.Either<_i6.Failure, _i9.Token>>.value(
                  _FakeEither_1<_i6.Failure, _i9.Token>()))
          as _i5.Future<_i3.Either<_i6.Failure, _i9.Token>>);
}
