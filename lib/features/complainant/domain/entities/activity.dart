import 'package:equatable/equatable.dart';

import 'activity_assignment.dart';
import 'activity_attachment.dart';

class Activity extends Equatable {
  final int id;
  final List<ActivityAssignment> assignments;
  final List<ActivityAttachment> attachments;
  final String created;
  final String modified;
  final String type;
  final String comment;
  final String date;
  final String state_change;
  final String log_tags_change;
  final String external_change;
  final int user;
  final int complaint;
  final int priority_change;

  Activity({
    required this.id,
    required this.assignments,
    required this.attachments,
    required this.created,
    required this.modified,
    required this.type,
    required this.comment,
    required this.date,
    required this.state_change,
    required this.log_tags_change,
    required this.external_change,
    required this.user,
    required this.complaint,
    required this.priority_change,
  });

  @override
  // TODO: implement props
  List<Object?> get props => [
        id,
        assignments,
        attachments,
        created,
        modified,
        type,
        comment,
        date,
        state_change,
        log_tags_change,
        external_change,
        user,
        complaint,
        priority_change,
      ];
}
