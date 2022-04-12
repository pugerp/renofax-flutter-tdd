import 'package:dartz/dartz.dart';
import 'package:renofax/core/error/failures.dart';
import 'package:renofax/core/usecases/usecase.dart';
import 'package:renofax/features/complainant/domain/repositories/complaint_repository.dart';
import '../../data/models/complaint.dart';

class GetComplaints implements UseCase<List<Complaint>, NoParams> {
  final ComplaintRepository repository;

  GetComplaints({required this.repository});

  @override
  Future<Either<Failure, List<Complaint>>> call(NoParams params) async {
    return await repository.getComplaints();
  }
}