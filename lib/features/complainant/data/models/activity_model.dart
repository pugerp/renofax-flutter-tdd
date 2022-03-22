import 'dart:convert';

import '../../domain/entities/activity.dart';
import '../../domain/entities/activity_assignment.dart';
import '../../domain/entities/activity_attachment.dart';
import 'activity_assignment_model.dart';
import 'activity_attachment_model.dart';


class ActivityModel extends Activity {
  ActivityModel(
      {required int id,
      required List<ActivityAssignment> assignments,
      required List<ActivityAttachment> attachments,
      required String created,
      required String modified,
      required String type,
      required String comment,
      required String date,
      required String state_change,
      required String log_tags_change,
      required String external_change,
      required int user,
      required int complaint,
      required int priority_change})
      : super(
          id: id,
          assignments: assignments,
          attachments: attachments,
          created: created,
          modified: modified,
          type: type,
          comment: comment,
          date: date,
          state_change: state_change,
          log_tags_change: log_tags_change,
          external_change: external_change,
          user: user,
          complaint: complaint,
          priority_change: priority_change,
        );

  factory ActivityModel.fromJson(String str) =>
      ActivityModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory ActivityModel.fromMap(Map<String, dynamic> json) => ActivityModel(
        id: json['id'],
        assignments: List<ActivityAssignmentModel>.from(json['assignments']
            .map((assignment) => ActivityAssignmentModel.fromMap(assignment))),
        attachments: List<ActivityAttachmentModel>.from(json['attachments']
            .map((attachment) => ActivityAttachmentModel.fromJson(attachment))),
        created: json['created'],
        modified: json['modified'],
        type: json['type'],
        comment: json['comment'],
        date: json['date'],
        state_change: json['state_change'],
        log_tags_change: json['log_tags_change'],
        external_change: json['external_change'],
        user: json['user'],
        complaint: json['card'],
        priority_change: json['priority_change'],
      );

  Map<String, dynamic> toMap() => {
        'id': id,
        'assignments': assignments,
        'attachments': attachments,
        'created': created,
        'modified': modified,
        'type': type,
        'comment': comment,
        'date': date,
        'state_change': state_change,
        'log_tags_change': log_tags_change,
        'external_change': external_change,
        'user': user,
        'card': complaint,
        'priority_change': priority_change,
      };
}
