import '../../../sync/data/models/permission_model.dart';
import '../../domain/entities/user.dart';

/// id : 17
/// username : "renofax-supervisor"
/// name : "Renofax Supervisor"
/// url : "https://staging.renofax.com/api/users/renofax-supervisor/"
/// role : "ADMIN"
/// permission : {"name":"Admin","mobile_app_permission":["can_access_application","can_access_card","can_create_card","can_access_history_card","can_approve_card","can_confirm_card"],"dashboard_permission":["can_access_dashboard","can_access_member","can_invite_member"]}
/// avatar : null

// User userFromJson(String str) => User.fromJson(json.decode(str));
//
// String userToJson(User data) => json.encode(data.toJson());
//
// @Entity()
// class User extends Equatable {
//   User({
//     int? id,
//     String? username,
//     String? name,
//     String? url,
//     String? role,
//     Permission? permission,
//     String? avatar,
//   }) {
//     _id = id;
//     _username = username;
//     _name = name;
//     _url = url;
//     _role = role;
//     _permission = permission;
//     _avatar = avatar;
//   }
//
//   User.fromJson(dynamic json) {
//     _id = json['id'];
//     _username = json['username'];
//     _name = json['name'];
//     _url = json['url'];
//     _role = json['role'];
//     _permission = json['permission'] != null
//         ? Permission.fromJson(json['permission'])
//         : null;
//     _avatar = json['avatar'];
//   }
//
//   int? _id;
//   String? _username;
//   String? _name;
//   String? _url;
//   String? _role;
//   Permission? _permission;
//   String? _avatar;
//
//   int? get id => _id;
//
//   String? get username => _username;
//
//   String? get name => _name;
//
//   String? get url => _url;
//
//   String? get role => _role;
//
//   Permission? get permission => _permission;
//
//   String? get avatar => _avatar;
//
//   Map<String, dynamic> toJson() {
//     final map = <String, dynamic>{};
//     map['id'] = _id;
//     map['username'] = _username;
//     map['name'] = _name;
//     map['url'] = _url;
//     map['role'] = _role;
//     if (_permission != null) {
//       map['permission'] = _permission?.toJson();
//     }
//     map['avatar'] = _avatar;
//     return map;
//   }
//
//   @override
//   List<Object?> get props => [id];
// }

class UserModel extends User {
  UserModel({
    required int id,
    required String username,
    required String name,
    required String url,
    required String role,
    required String? avatar,
    required PermissionModel permission,
  }) : super(
    id: id,
    username: username,
    name: name,
    url: url,
    role: role,
    avatar: avatar,
    permission: permission,
  );

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
        id: json['id'],
        username: json['username'],
        name: json['name'],
        url: json['url'],
        role: json['role'],
        avatar: json['avatar'],
        permission: PermissionModel.fromJson(json['permission'])
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'username': username,
      'name': name,
      'url': url,
      'role': role,
      'avatar': avatar,
      'permission': (permission as PermissionModel).toJson()
    };
  }
}
