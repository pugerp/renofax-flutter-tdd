import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:renofax/core/error/failures.dart';
import 'package:renofax/core/usecases/usecase.dart';
import 'package:renofax/features/membership/domain/entities/login_reponse.dart';
import 'package:renofax/features/membership/domain/repositories/login_repository.dart';

class GetTokenAccessAndRefresh implements UseCase<LoginResp, Params> {
  final LoginRepository repository;

  GetTokenAccessAndRefresh({required this.repository});

  @override
  Future<Either<Failure, LoginResp>> call(params) async {
    return await repository.getTokenAccessAndRefresh(
      params.username,
      params.password,
    );
  }
}

class Params extends Equatable {
  final String username;
  final String password;

  Params(this.username, this.password);

  @override
  List<Object?> get props => [username, password];
}
