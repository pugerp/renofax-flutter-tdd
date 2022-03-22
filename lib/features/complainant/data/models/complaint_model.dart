import 'dart:convert';


import 'package:renofax/features/complainant/data/models/vendor_model.dart';

import '../../domain/entities/complaint.dart';
import 'activity_model.dart';
import 'assignment_model.dart';
import 'attachment_model.dart';

class ComplaintModel extends Complaint {
  ComplaintModel(
      {required int id,
      required List<AttachmentModel> attachments,
      required List<AssignmentModel> assignments,
      required List<ActivityModel> activities,
      required List<VendorModel> vendors,
      required String created,
      required String modified,
      required String title,
      required String description,
      required String unit,
      required String latitude,
      required String longitute,
      required String state,
      required String category,
      required String date,
      required String follow_up,
      required int complainant,
      required int priority})
      : super(
          id: id,
          attachments: attachments,
          assignments: assignments,
          activities: activities,
          vendors: vendors,
          created: created,
          modified: modified,
          title: title,
          description: description,
          unit: unit,
          latitude: latitude,
          longitute: longitute,
          state: state,
          category: category,
          date: date,
          follow_up: follow_up,
          complainant: complainant,
          priority: priority,
        );

  factory ComplaintModel.fromJson(String str) =>
      ComplaintModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory ComplaintModel.fromMap(Map<String, dynamic> json) => ComplaintModel(
        id: json['id'],
        attachments: List<AttachmentModel>.from(json['attachments']
            .map((attachment) => AttachmentModel.fromMap(attachment))),
        assignments: List<AssignmentModel>.from(json['assignments']
            .map((assignment) => AssignmentModel.fromMap(assignment))),
        activities: List<ActivityModel>.from(json['activities']
            .map((activity) => ActivityModel.fromMap(activity))),
        vendors: List<VendorModel>.from(
            json['vendors'].map((vendor) => VendorModel.fromJson(vendor))),
        created: json['created'],
        modified: json['modified'],
        title: json['title'],
        description: json['description'],
        unit: json['unit'],
        latitude: json['latitude'],
        longitute: json['longitute'],
        state: json['state'],
        category: json['category'],
        date: json['date'],
        follow_up: json['followup_by'],
        complainant: json['complainant'],
        priority: json['priority'],
      );

  Map<String, dynamic> toMap() => {
        'id': id,
        'attachments': List<dynamic>.from(
            attachments.map((x) => (x as AttachmentModel).toMap())),
        'assignments': List<dynamic>.from(
            assignments.map((x) => (x as AssignmentModel).toMap())),
        'activities': List<dynamic>.from(
            activities.map((x) => (x as ActivityModel).toMap())),
        'vendors':
            List<dynamic>.from(vendors.map((x) => (x as VendorModel).toMap())),
        'created': created,
        'modified': modified,
        'title': title,
        'description': description,
        'unit': unit,
        'latitude': latitude,
        'longitute': longitute,
        'state': state,
        'category': category,
        'date': date,
        'followup_by': follow_up,
        'priority': priority,
        'complainant' : complainant,
      };
}
