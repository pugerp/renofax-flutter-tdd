import 'package:dartz/dartz.dart';
import 'package:renofax/core/error/exceptions.dart';
import 'package:renofax/core/error/failures.dart';
import 'package:renofax/core/network/network_info.dart';

import '../../domain/repositories/complaint_repository.dart';
import '../data_sources/complaint_remote_data_source.dart';
import '../models/complaint.dart';

class ComplaintRepositoryImpl implements ComplaintRepository {
  final ComplaintRemoteDataSource complaintRemote;
  final NetworkInfo networkInfo;

  ComplaintRepositoryImpl({
    required this.complaintRemote,
    required this.networkInfo,
  });

  @override
  Future<Either<Failure, List<Complaint>>> getComplaints() async {
    if (await networkInfo.isConnected) {
      try {
        final response = await complaintRemote.getComplaints();
        //sort desc by priority
        response.sort(
          (a, b) => (b.priority as num).compareTo(a.priority as num),
        );
        return Right(response);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      return Left(ConnectionFailure());
    }
  }

  @override
  Future<Either<Failure, Complaint>> getComplaintById(int id) async {
    if (await networkInfo.isConnected) {
      try {
        final response = await complaintRemote.getComplaintById(id);
        return Right(response);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      return Left(ConnectionFailure());
    }
  }
}
