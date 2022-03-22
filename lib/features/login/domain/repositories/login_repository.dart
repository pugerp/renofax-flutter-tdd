import 'package:dartz/dartz.dart';
import 'package:renofax/core/error/failures.dart';
import 'package:renofax/features/login/domain/entities/login_reponse.dart';

abstract class LoginRepository {
  Future<Either<Failure, LoginResp>> getTokenAccessAndRefresh(String username, String password);
}