import 'dart:convert';

import '../../domain/entities/assignment.dart';


class AssignmentModel extends Assignment {
  AssignmentModel(
      {required int id,
      required String created,
      required String modified,
      required int user,
      required int complaint})
      : super(
          id: id,
          created: created,
          modified: modified,
          user: user,
          complaint: complaint,
        );

  factory AssignmentModel.fromJson(String str) => AssignmentModel.fromMap(json.decode(str));
  String toJson() => json.encode(toMap());

  factory AssignmentModel.fromMap(Map<String, dynamic> json) => AssignmentModel(
        id: json['id'],
        created: json['created'],
        modified: json['modified'],
        user: json['user'],
        complaint: json['card'],
      );

  Map<String, dynamic> toMap() => {
        'id': id,
        'created': created,
        'modified': modified,
        'user': user,
        'card': complaint,
      };
}
