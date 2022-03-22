part of 'complaint_bloc.dart';

abstract class ComplaintEvent extends Equatable {
  const ComplaintEvent();
}

class fetchComplaint extends ComplaintEvent {
  @override
  List<Object?> get props => [];
}

class fetchComplaintById extends ComplaintEvent {
  final int id;

  fetchComplaintById({required this.id});
  @override
  List<Object?> get props => [id];

}
