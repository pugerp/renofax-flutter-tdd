import 'package:dartz/dartz.dart';
import 'package:renofax/core/error/failures.dart';

import '../../data/models/user_model.dart';
import '../entities/user.dart';

abstract class SyncRepository{
  Future<Either<Failure, List<User>>> getUsers();
}