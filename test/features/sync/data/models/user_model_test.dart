import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:renofax/features/sync/data/models/permission_model.dart';
import 'package:renofax/features/sync/data/models/user_model.dart';
import 'package:renofax/features/sync/domain/entities/user.dart';

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

  final tUserModel = UserModel(
      id: 17,
      username: "renofax-supervisor",
      name: "Renofax Supervisor",
      url: "https://staging.renofax.com/api/users/renofax-supervisor/",
      role: "ADMIN",
      avatar: null,
      permission: tPermissionModel);

  test('should be a subclass of User Entity', () {
    expect(tUserModel, isA<User>());
  });

  group('fromJson', () {
    test('should return a valid model when input with JSON User', () {
      final Map<String, dynamic> jsonUser = json.decode(fixture('user.json'));
      final result = UserModel.fromJson(jsonUser);
      expect(result, tUserModel);
    });
  });

  group('toJson', () {
    test('should return a JSON map containing the proper data', () {
      final result = tUserModel.toJson();
      final expectedMap = {
        "id": 17,
        "username": "renofax-supervisor",
        "name": "Renofax Supervisor",
        "url": "https://staging.renofax.com/api/users/renofax-supervisor/",
        "role": "ADMIN",
        "permission": {
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
          ]
        },
        "avatar": null
      };
      expect(result, expectedMap);
    });
  });
}
