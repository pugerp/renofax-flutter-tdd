import 'dart:convert';

import '../../domain/entities/vendor.dart';


class VendorModel extends Vendor {
  VendorModel({
    required String external,
    required int complaint,
    required String created,
  }) : super(
          external: external,
          complaint: complaint,
          created: created,
        );

  factory VendorModel.fromJson(String str) => VendorModel.fromMap(json.decode(str));
  String toJson() => json.encode(toMap());

  factory VendorModel.fromMap(Map<String, dynamic> json) {
    return VendorModel(
      external: json['external'],
      complaint: json['card'],
      created: json['created'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'external': external,
      'card': complaint,
      'created': created,
    };
  }
}
