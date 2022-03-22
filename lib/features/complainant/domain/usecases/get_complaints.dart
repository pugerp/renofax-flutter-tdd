import 'package:dartz/dartz.dart';
import 'package:renofax/core/error/failures.dart';
import 'package:renofax/core/usecases/usecase.dart';
import 'package:renofax/features/complainant/data/models/complaint_test.dart';
import 'package:renofax/features/complainant/domain/repositories/complaint_repository.dart';

class GetComplaints implements UseCase<List<ComplaintTest>, NoParams> {
  final ComplaintRepository repository;

  GetComplaints({required this.repository});

  @override
  Future<Either<Failure, List<ComplaintTest>>> call(NoParams params) async {
    return await repository.getComplaints();
  }
}