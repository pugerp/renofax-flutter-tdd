import 'package:dartz/dartz.dart';
import 'package:renofax/core/error/failures.dart';
import 'package:renofax/features/membership/domain/entities/login_reponse.dart';

import '../../data/models/login_request.dart';
import '../../data/models/token.dart';

abstract class LoginRepository {
  Future<Either<Failure, LoginResp>> getTokenAccessAndRefresh(String username, String password);
  Future<Either<Failure, Token>> getToken(LoginRequest req);
}