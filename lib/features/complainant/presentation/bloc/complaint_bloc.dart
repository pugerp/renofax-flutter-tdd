import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:renofax/core/usecases/usecase.dart';
import 'package:renofax/features/complainant/domain/usecases/get_complaint_by_id.dart';

import '../../data/models/complaint.dart';
import '../../domain/usecases/get_complaints.dart';

part 'complaint_event.dart';

part 'complaint_state.dart';

class ComplaintBloc extends Bloc<ComplaintEvent, ComplaintState> {
  final GetComplaints getComplaints;
  final GetComplaintById getComplaintById;

  ComplaintBloc({required this.getComplaints, required this.getComplaintById}) : super(Initial()) {
    on<fetchComplaint>(_fetchComplaints);
    on<fetchComplaintById>(_fetchComplaintByid);
  }

  void _fetchComplaints(
    fetchComplaint event,
    Emitter<ComplaintState> emit,
  ) async {
    emit(Loading());

    final failedOrSuccess = await getComplaints(NoParams());

    emit(
      failedOrSuccess.fold(
        (failed) => Error(message: 'Failed fetching complaints data'),
        (response) => Success(complaints: response)
      ),
    );
  }


  void _fetchComplaintByid(
      fetchComplaintById event,
      Emitter<ComplaintState> emit,
      ) async {
    emit(Loading());

    final failedOrSuccess = await getComplaintById(Params(id: event.id));

    emit(
      failedOrSuccess.fold(
              (failed) => Error(message: 'Failed fetching complaints data'),
              (response) => SuccessById(complaint: response)
      ),
    );
  }
}
