import 'package:equatable/equatable.dart';

class ActivityAssignment extends Equatable {
  final int id;
  final String created;
  final String modified;
  final int activity;
  final int user;

  ActivityAssignment({
    required this.id,
    required this.created,
    required this.modified,
    required this.activity,
    required this.user,
  });

  @override
  // TODO: implement props
  List<Object?> get props => [
        id,
        created,
        modified,
        activity,
        user,
      ];
}
