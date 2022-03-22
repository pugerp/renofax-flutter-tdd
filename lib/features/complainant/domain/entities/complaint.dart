import 'package:equatable/equatable.dart';

import 'activity.dart';
import 'assignment.dart';
import 'attachment.dart';
import 'vendor.dart';


class Complaint extends Equatable {
  final int id;
  final List<Attachment> attachments;
  final List<Assignment> assignments;
  final List<Activity> activities;
  final List<Vendor> vendors;
  final String created;
  final String modified;
  final String title;
  final String description;
  final String unit;
  final String latitude;
  final String longitute;
  final String state;
  final String category;
  final String date;
  final String follow_up;
  final int complainant;
  final int priority;

  Complaint({
    required this.id,
    required this.attachments,
    required this.assignments,
    required this.activities,
    required this.vendors,
    required this.created,
    required this.modified,
    required this.title,
    required this.description,
    required this.unit,
    required this.latitude,
    required this.longitute,
    required this.state,
    required this.category,
    required this.date,
    required this.follow_up,
    required this.complainant,
    required this.priority,
  });

  @override
  List<Object?> get props => [
        id,
        attachments,
        assignments,
        activities,
        vendors,
        created,
        modified,
        title,
        description,
        unit,
        latitude,
        longitute,
        state,
        category,
        date,
        follow_up,
        complainant,
        priority,
      ];
}
