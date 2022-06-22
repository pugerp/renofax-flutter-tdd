import 'package:equatable/equatable.dart';
import '../../../sync/domain/entities/permission.dart';

class User extends Equatable {
  final int id;
  final String username;
  final String name;
  final String url;
  final String role;
  final String? avatar;
  final Permission permission;

  User({
    required this.id,
    required this.username,
    required this.name,
    required this.url,
    required this.role,
    required this.avatar,
    required this.permission,
  });

  @override
  List<Object?> get props => [id];
}
