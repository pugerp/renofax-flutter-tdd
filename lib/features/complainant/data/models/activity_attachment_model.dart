import 'dart:convert';

import '../../domain/entities/activity_attachment.dart';


class ActivityAttachmentModel extends ActivityAttachment {
  ActivityAttachmentModel({
    required int id,
    required String created,
    required String modified,
    required String photo,
    required int activity,
    required int complaint,
  }) : super(
          id: id,
          created: created,
          modified: modified,
          photo: photo,
          activity: activity,
          complaint: complaint,
        );

  factory ActivityAttachmentModel.fromJson(String str) =>
      ActivityAttachmentModel.fromMap(json.decode(str));

  Map<String, dynamic> toJson() => toMap();

  factory ActivityAttachmentModel.fromMap(Map<String, dynamic> json) =>
      ActivityAttachmentModel(
        id: json['id'],
        created: json['created'],
        modified: json['modified'],
        photo: json['photo'],
        activity: json['card_activity'],
        complaint: json['card'],
      );

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'created': created,
      'modified': modified,
      'photo': photo,
      'card_activity': activity,
      'card': complaint,
    };
  }
}
