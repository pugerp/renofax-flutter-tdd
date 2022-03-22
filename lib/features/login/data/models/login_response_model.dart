import 'package:renofax/features/login/domain/entities/login_reponse.dart';

class LoginRespModel extends LoginResp {
  LoginRespModel({
    required String refresh,
    required String access,
    required String obtain,
  }) : super(refresh, access, obtain);

  factory LoginRespModel.fromJson(Map<String, dynamic> json) {
    return LoginRespModel(
      refresh: json['refresh'],
      access: json['access'],
      obtain: json['obtain'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'refresh': refresh,
      'access': access,
      'obtain': obtain,
    };
  }
}
