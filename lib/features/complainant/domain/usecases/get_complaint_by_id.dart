import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:renofax/core/error/failures.dart';
import 'package:renofax/core/usecases/usecase.dart';
import 'package:renofax/features/complainant/domain/repositories/complaint_repository.dart';

import '../../data/models/complaint.dart';



class GetComplaintById implements UseCase<Complaint, Params> {
  final ComplaintRepository repository;

  GetComplaintById({required this.repository});

  @override
  Future<Either<Failure, Complaint>> call(Params params) async {
    return await repository.getComplaintById(params.id);
  }


}

class Params extends Equatable {
  final int id;

  Params({required this.id});

  @override
  List<Object?> get props => [id];

}