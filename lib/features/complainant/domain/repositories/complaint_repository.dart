import 'package:dartz/dartz.dart';

import '../../../../../core/error/failures.dart';
import '../../data/models/complaint_test.dart';

abstract class ComplaintRepository {
  Future<Either<Failure, List<ComplaintTest>>> getComplaints();
  Future<Either<Failure, ComplaintTest>> getComplaintById(int id);
}