import 'dart:convert';
import 'package:flutter_test/flutter_test.dart';
import 'package:renofax/features/sync/data/models/permission_model.dart';
import 'package:renofax/features/sync/domain/entities/permission.dart';

import '../../../../fixtures/fixture_reader.dart';

void main() {
  final tPermissionModel = PermissionModel(
    name: "Admin",
    mobilePermission: [
      "can_access_application",
      "can_access_card",
      "can_create_card",
      "can_access_history_card",
      "can_approve_card",
      "can_confirm_card"
    ],
    dashboardPermission: [
      "can_access_dashboard",
      "can_access_member",
      "can_invite_member"
    ],
  );

  test('should be a subclass of Permission Entity', () {
    expect(tPermissionModel, isA<Permission>());
  });

  group('fromJson', () {
    test('should return a valid model when input with JSON Permission', () {
      final Map<String, dynamic> jsonPermission = json.decode(
          fixture('permission.json'));
      final result = PermissionModel.fromJson(jsonPermission);
      expect(result, tPermissionModel);
    });
  });

  group('toJson', () {
    test('should return a JSON map containing the proper data', () {
      final result = tPermissionModel.toJson();
      final expectedMap = {
        "name": "Admin",
        "mobile_app_permission": [
          "can_access_application",
          "can_access_card",
          "can_create_card",
          "can_access_history_card",
          "can_approve_card",
          "can_confirm_card"
        ],
        "dashboard_permission": [
          "can_access_dashboard",
          "can_access_member",
          "can_invite_member"
        ],
      };
      expect(result, expectedMap);
    });
  });
}
