import 'package:equatable/equatable.dart';

class Assignment extends Equatable {
  final int id;
  final String created;
  final String modified;
  final int user;
  final int complaint;

  Assignment({
    required this.id,
    required this.created,
    required this.modified,
    required this.user,
    required this.complaint,
  });

  @override
  // TODO: implement props
  List<Object?> get props => [
        id,
        created,
        modified,
        user,
        complaint,
      ];
}
