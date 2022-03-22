import 'package:equatable/equatable.dart';

class Menu extends Equatable {
  final String title;
  final String description;
  final String icon;

  Menu({
    required this.title,
    required this.description,
    required this.icon,
  });

  @override
  List<Object?> get props => [
        title,
        description,
        icon,
      ];
}
