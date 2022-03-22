import 'dart:convert';
import 'dart:developer';

import 'package:flutter_test/flutter_test.dart';
import 'package:renofax/features/complainant/data/models/complaint_test.dart';

import '../../../../fixtures/fixture_reader.dart';


void main() {
  // final tAttachment = AttachmentModel(
  //   id: 0,
  //   created: '2022-02-23T08:27:37.881Z',
  //   modified: '2022-02-23T08:27:37.881Z',
  //   photo: 'string',
  //   complaint: 0,
  //   activity: 0,
  // );
  // final tAssignment = AssignmentModel(
  //   id: 0,
  //   created: '2022-02-23T08:27:37.881Z',
  //   modified: '2022-02-23T08:27:37.881Z',
  //   user: 0,
  //   complaint: 0,
  // );
  // final tAssigmentActivity = ActivityAssignmentModel(
  //   id: 0,
  //   created: '2022-02-23T08:27:37.881Z',
  //   modified: '2022-02-23T08:27:37.881Z',
  //   activity: 0,
  //   user: 0,
  // );
  // final tAttachmentActivity = ActivityAttachmentModel(
  //     id: 0,
  //     created: '2022-02-23T08:27:37.881Z',
  //     modified: '2022-02-23T08:27:37.881Z',
  //     photo: 'string',
  //     complaint: 0,
  //     activity: 0);
  // final tVendor = VendorModel(
  //   external: 'string',
  //   complaint: 0,
  //   created: '2022-02-23T08:27:37.881Z',
  // );
  // final tActivity = ActivityModel(
  //   id: 0,
  //   attachments: [tAttachmentActivity],
  //   assignments: [tAssigmentActivity],
  //   created: '2022-02-23T08:27:37.881Z',
  //   modified: '2022-02-23T08:27:37.881Z',
  //   type: 'COMMENT',
  //   comment: 'string',
  //   date: '2022-02-23T08:27:37.881Z',
  //   state_change: 'PENDING',
  //   log_tags_change: 'STATE',
  //   external_change: 'string',
  //   user: 0,
  //   complaint: 0,
  //   priority_change: 0,
  // );
  // final tComplaint = ComplaintModel(
  //   id: 0,
  //   attachments: [tAttachment],
  //   assignments: [tAssignment],
  //   activities: [tActivity],
  //   vendors: [tVendor],
  //   created: '2022-02-23T08:27:37.881Z',
  //   modified: '2022-02-23T08:27:37.881Z',
  //   title: 'string',
  //   description: 'string',
  //   unit: 'string',
  //   latitude: 'string',
  //   longitute: 'string',
  //   state: 'PENDING',
  //   category: 'string',
  //   date: '2022-02-23T08:27:37.881Z',
  //   follow_up: 'inhouse',
  //   complainant: 0,
  //   priority: 0,
  // );

  final tAttachment = Attachments(
    id: 0,
    created: '2022-02-23T08:27:37.881Z',
    modified: '2022-02-23T08:27:37.881Z',
    photo: 'string',
    card: 0,
    cardActivity: 0,
  );
  final tAssignment = Assignments(
    id: 0,
    created: '2022-02-23T08:27:37.881Z',
    modified: '2022-02-23T08:27:37.881Z',
    user: 0,
    card: 0,
  );
  final tAssigmentActivity = ActivityAssignment(
    id: 0,
    created: '2022-02-23T08:27:37.881Z',
    modified: '2022-02-23T08:27:37.881Z',
    cardActivity: 0,
    user: 0,
  );
  final tAttachmentActivity = ActivityAttachment(
      id: 0,
      created: '2022-02-23T08:27:37.881Z',
      modified: '2022-02-23T08:27:37.881Z',
      photo: 'string',
      card: 0,
      cardActivity: 0);
  final tVendor = Vendors(
    external: 'string',
    card: 0,
    created: '2022-02-23T08:27:37.881Z',
  );
  final tActivity = Activities(
    id: 0,
    attachments: [tAttachmentActivity],
    assignments: [tAssigmentActivity],
    created: '2022-02-23T08:27:37.881Z',
    modified: '2022-02-23T08:27:37.881Z',
    type: 'COMMENT',
    comment: 'string',
    date: '2022-02-23T08:27:37.881Z',
    stateChange: 'PENDING',
    logTagsChange: 'STATE',
    externalChange: 'string',
    user: 0,
    card: 0,
    priorityChange: 0,
  );
  final tComplaint = ComplaintTest(
    id: 0,
    attachments: [tAttachment],
    assignments: [tAssignment],
    activities: [tActivity],
    vendors: [tVendor],
    created: '2022-02-23T08:27:37.881Z',
    modified: '2022-02-23T08:27:37.881Z',
    title: 'string',
    description: 'string',
    unit: 'string',
    latitude: 'string',
    longitute: 'string',
    state: 'PENDING',
    category: 'string',
    date: '2022-02-23T08:27:37.881Z',
    followupBy: 'inhouse',
    complainant: 0,
    priority: 0,
  );

  test('tComplaint is a ComplaintModel', () {
    expect(tComplaint, isA<ComplaintTest>());
  });

  group('Model Complaint', () {
    test('should return a valid model from JSON response', () {
      final result = ComplaintTest.fromJson(json.decode(fixture('complaint.json')));
      expect(result, tComplaint);
    });

    test('should return a JSON map containing the proper data', () {
      final result = tComplaint.toJson();
      final expectedMap = {
        'id': 0,
        'attachments': [
          {
            'id': 0,
            'created': '2022-02-23T08:27:37.881Z',
            'modified': '2022-02-23T08:27:37.881Z',
            'photo': 'string',
            'card_activity': 0,
            'card': 0
          }
        ],
        'assignments': [
          {
            'id': 0,
            'created': '2022-02-23T08:27:37.881Z',
            'modified': '2022-02-23T08:27:37.881Z',
            'user': 0,
            'card': 0
          }
        ],
        'activities': [
          {
            'id': 0,
            'assignments': [
              {
                'id': 0,
                'created': '2022-02-23T08:27:37.881Z',
                'modified': '2022-02-23T08:27:37.881Z',
                'card_activity': 0,
                'user': 0
              }
            ],
            'attachments': [
              {
                'id': 0,
                'created': '2022-02-23T08:27:37.881Z',
                'modified': '2022-02-23T08:27:37.881Z',
                'photo': 'string',
                'card_activity': 0,
                'card': 0
              }
            ],
            'created': '2022-02-23T08:27:37.881Z',
            'modified': '2022-02-23T08:27:37.881Z',
            'type': 'COMMENT',
            'comment': 'string',
            'date': '2022-02-23T08:27:37.881Z',
            'state_change': 'PENDING',
            'log_tags_change': 'STATE',
            'external_change': 'string',
            'user': 0,
            'card': 0,
            'priority_change': 0
          }
        ],
        'vendors': [
          {
            'external': 'string',
            'card': 0,
            'created': '2022-02-23T08:27:37.881Z'
          }
        ],
        'created': '2022-02-23T08:27:37.881Z',
        'modified': '2022-02-23T08:27:37.881Z',
        'title': 'string',
        'description': 'string',
        'unit': 'string',
        'latitude': 'string',
        'longitute': 'string',
        'state': 'PENDING',
        'category': 'string',
        'date': '2022-02-23T08:27:37.881Z',
        'followup_by': 'inhouse',
        'complainant': 0,
        'priority': 0
      };

      expect(result, expectedMap);
    });
  });
}
