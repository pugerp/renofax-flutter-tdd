import 'dart:convert';

import '../../domain/entities/attachment.dart';


class AttachmentModel extends Attachment {
  AttachmentModel({required int id,
    required String created,
    required String modified,
    required String photo,
    required int activity,
    required int complaint})
      : super(
    id: id,
    created: created,
    modified: modified,
    photo: photo,
    activity: activity,
    complaint: complaint,
  );
  factory AttachmentModel.fromJson(String str) => AttachmentModel.fromMap(json.decode(str));
  String toJson() => json.encode(toMap());

  factory AttachmentModel.fromMap(Map<String, dynamic> json) {
    return AttachmentModel(
      id: json['id'],
      created: json['created'],
      modified: json['modified'],
      photo: json['photo'],
      activity: json['card_activity'],
      complaint: json['card'],
    );
  }

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
