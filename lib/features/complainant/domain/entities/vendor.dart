import 'package:equatable/equatable.dart';

class Vendor extends Equatable {
  final String external;
  final int complaint;
  final String created;

  Vendor({
    required this.external,
    required this.complaint,
    required this.created,
  });

  @override
  List<Object?> get props => [
        external,
        complaint,
        created,
      ];
}
