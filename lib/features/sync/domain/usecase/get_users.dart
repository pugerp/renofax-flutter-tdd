import 'package:dartz/dartz.dart';
import 'package:renofax/core/error/failures.dart';
import 'package:renofax/core/usecases/usecase.dart';

import '../../../sync/domain/repositories/sync_repository.dart';
import '../entities/user.dart';

class GetUsers implements UseCase<List<User>, NoParams> {
  final SyncRepository repo;

  GetUsers({required this.repo});

  @override
  Future<Either<Failure, List<User>>> call(NoParams params) async {
    return await repo.getUsers();
  }

}