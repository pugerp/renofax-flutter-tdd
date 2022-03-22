part of 'complaint_bloc.dart';

abstract class ComplaintState extends Equatable {
  const ComplaintState();

  @override
  List<Object> get props => [];
}

class Initial extends ComplaintState {}
class Loading extends ComplaintState {}
class Success extends ComplaintState {
  final List<ComplaintTest> complaints;

  Success({required this.complaints});
}
class SuccessById extends ComplaintState {
  final ComplaintTest complaint;

  SuccessById({required this.complaint});
}
class Error extends ComplaintState {
  final String message;

  Error({required this.message});

}
