import 'dart:convert';

import '../../domain/entities/activity_assignment.dart';


class ActivityAssignmentModel extends ActivityAssignment {
  ActivityAssignmentModel({
    required int id,
    required String created,
    required String modified,
    required int activity,
    required int user,
  }) : super(
          id: id,
          created: created,
          modified: modified,
          activity: activity,
          user: user,
        );

  factory ActivityAssignmentModel.fromJson(String str) =>
      ActivityAssignmentModel.fromMap(json.decode(str));

  Map<String, dynamic> toJson() => toMap();

  factory ActivityAssignmentModel.fromMap(Map<String, dynamic> json) =>
      ActivityAssignmentModel(
        id: json['id'],
        created: json['created'],
        modified: json['modified'],
        activity: json['card_activity'],
        user: json['user'],
      );

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'created': created,
      'modified': modified,
      'card_activity': activity,
      'user': user,
    };
  }
}
