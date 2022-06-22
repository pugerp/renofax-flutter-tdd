import 'package:equatable/equatable.dart';

class LoginResp extends Equatable {
  final String refresh;
  final String access;
  final String obtain;

  LoginResp(this.refresh, this.access, this.obtain);

  @override
  List<Object?> get props => [
        refresh,
        access,
        obtain,
      ];
}
