import 'package:dartz/dartz.dart';
import 'package:renofax/core/error/exceptions.dart';
import 'package:renofax/core/error/failures.dart';
import 'package:renofax/core/network/network_info.dart';
import 'package:renofax/features/login/data/data_sources/login_remote_data_source.dart';
import 'package:renofax/features/login/domain/entities/login_reponse.dart';
import 'package:renofax/features/login/domain/repositories/login_repository.dart';

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
}
