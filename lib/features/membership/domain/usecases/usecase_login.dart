import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import 'package:renofax/core/error/failures.dart';
import 'package:renofax/features/membership/data/models/login_request.dart';
import 'package:renofax/features/membership/domain/repositories/login_repository.dart';

import '../../../../core/usecases/usecase.dart';
import '../../data/models/token.dart';

class UsecaseLogin implements UseCase<Token, Params> {
  final LoginRepository repo;

  UsecaseLogin({required this.repo});

  @override
  Future<Either<Failure, Token>> call(Params params) async {
    return await repo.getToken(params.req);
  }

}

class Params extends Equatable {
  final LoginRequest req;

  Params({required this.req});

  @override
  List<Object?> get props => [req];
}