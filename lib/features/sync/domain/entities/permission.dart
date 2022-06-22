import 'package:equatable/equatable.dart';

class Permission extends Equatable {
  final String name;
  final List<String> mobilePermission;
  final List<String> dashboardPermission;

  Permission({
    required this.name,
    required this.mobilePermission,
    required this.dashboardPermission,
  });

  @override
  List<Object?> get props => [name, mobilePermission];
}
