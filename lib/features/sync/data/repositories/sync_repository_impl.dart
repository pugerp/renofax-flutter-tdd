import 'package:dartz/dartz.dart';
import 'package:renofax/core/error/failures.dart';
import 'package:renofax/core/network/network_info.dart';

import '../../../../core/error/exceptions.dart';
import '../../domain/entities/user.dart';
import '../../domain/repositories/sync_repository.dart';
import '../data_sources/sync_remote_data_source.dart';

class SyncRepositoryImpl implements SyncRepository {
  final SyncRemoteDataSource remote;
  final NetworkInfo networkInfo;

  SyncRepositoryImpl({
    required this.remote,
    required this.networkInfo,
  });

  @override
  Future<Either<Failure, List<User>>> getUsers() async {
    if (await networkInfo.isConnected) {
      try {
        //TODO : implement local data source and save response to local data storage
        final response = await remote.getUsers();
        return Right(response);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      return Left(ConnectionFailure());
    }
  }
}
