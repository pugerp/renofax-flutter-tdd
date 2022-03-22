import 'package:equatable/equatable.dart';

class ActivityAttachment extends Equatable {
  final int id;
  final String created;
  final String modified;
  final String photo;
  final int activity;
  final int complaint;

  ActivityAttachment({
    required this.id,
    required this.created,
    required this.modified,
    required this.photo,
    required this.activity,
    required this.complaint,
  });

  @override
  // TODO: implement props
  List<Object?> get props => [
        id,
        created,
        modified,
        photo,
        activity,
        complaint,
      ];
}
