import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:renofax/core/error/exceptions.dart';
import 'package:renofax/core/error/failures.dart';
import 'package:renofax/core/network/network_info.dart';
import 'package:renofax/features/membership/data/data_sources/login_remote_data_source.dart';
import 'package:renofax/features/membership/data/models/login_request.dart';
import 'package:renofax/features/membership/domain/entities/login_reponse.dart';
import 'package:renofax/features/membership/domain/repositories/login_repository.dart';

import '../models/token.dart';

class LoginRepositoryImpl implements LoginRepository {
  final LoginRemoteDataSource loginRemote;
  final NetworkInfo networkInfo;

  LoginRepositoryImpl({
    required this.loginRemote,
    required this.networkInfo,
  });

  @override
  Future<Either<Failure, LoginResp>> getTokenAccessAndRefresh(
      String username, String password) async {
    if (await networkInfo.isConnected) {
      try {
        final respone = await loginRemote.login(username, password);
        return Right(respone);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      return Left(ConnectionFailure());
    }
  }

  @override
  Future<Either<Failure, Token>> getToken(LoginRequest req) async {
    if (await networkInfo.isConnected) {
      try {
        final response = await loginRemote.getToken(req);
        final token = Token.fromJson(response.data);
        return Right(token);
      } on DioError catch (e) {
        final responseError = CustomException.fromDioError(e);
        return Left(RequestFailure(message: responseError.message));
      }
    } else {
      return Left(ConnectionFailure());
    }
  }


}
