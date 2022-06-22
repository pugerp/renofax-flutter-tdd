import '../../domain/entities/permission.dart';

/// name : "Admin"
/// mobile_app_permission : ["can_access_application","can_access_card","can_create_card","can_access_history_card","can_approve_card","can_confirm_card"]
/// dashboard_permission : ["can_access_dashboard","can_access_member","can_invite_member"]

// Permission permissionFromJson(String str) =>
//     Permission.fromJson(json.decode(str));
//
// String permissionToJson(Permission data) => json.encode(data.toJson());
//
// @Entity()
// class Permission extends Equatable {
//   Permission({
//     String? name,
//     List<String>? mobileAppPermission,
//     List<String>? dashboardPermission,
//   }) {
//     _name = name;
//     _mobileAppPermission = mobileAppPermission;
//     _dashboardPermission = dashboardPermission;
//   }
//
//   Permission.fromJson(dynamic json) {
//     _name = json['name'];
//     _mobileAppPermission = json['mobile_app_permission'] != null
//         ? json['mobile_app_permission'].cast<String>()
//         : [];
//     _dashboardPermission = json['dashboard_permission'] != null
//         ? json['dashboard_permission'].cast<String>()
//         : [];
//   }
//
//   String? _name;
//   List<String>? _mobileAppPermission;
//   List<String>? _dashboardPermission;
//
//   String? get name => _name;
//
//   List<String>? get mobileAppPermission => _mobileAppPermission;
//
//   List<String>? get dashboardPermission => _dashboardPermission;
//
//   Map<String, dynamic> toJson() {
//     final map = <String, dynamic>{};
//     map['name'] = _name;
//     map['mobile_app_permission'] = _mobileAppPermission;
//     map['dashboard_permission'] = _dashboardPermission;
//     return map;
//   }
//
//   @override
//   List<Object?> get props => [name];
// }

class PermissionModel extends Permission {
  PermissionModel({
    required String name,
    required List<String> mobilePermission,
    required List<String> dashboardPermission,
  }) : super(
          name: name,
          mobilePermission: mobilePermission,
          dashboardPermission: dashboardPermission,
        );

  factory PermissionModel.fromJson(Map<String, dynamic> json) {
    return PermissionModel(
      name: json['name'],
      mobilePermission: (json['mobile_app_permission'] as List<dynamic>).cast<String>(),
      dashboardPermission: (json['dashboard_permission'] as List<dynamic>).cast<String>(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'mobile_app_permission': mobilePermission,
      'dashboard_permission': dashboardPermission,
    };
  }
}
