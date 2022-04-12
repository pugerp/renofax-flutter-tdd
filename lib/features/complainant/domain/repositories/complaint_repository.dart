import 'package:dartz/dartz.dart';

import '../../../../../core/error/failures.dart';
import '../../data/models/complaint.dart';

abstract class ComplaintRepository {
  Future<Either<Failure, List<Complaint>>> getComplaints();
  Future<Either<Failure, Complaint>> getComplaintById(int id);
}