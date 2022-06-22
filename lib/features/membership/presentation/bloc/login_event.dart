part of 'login_bloc.dart';

@immutable
abstract class LoginEvent extends Equatable {
  const LoginEvent();
}

class GetToken extends LoginEvent {
  final String username;
  final String password;

  GetToken({required this.username, required this.password});

  @override
  List<Object?> get props => [username, password];

}

class GetToken2 extends LoginEvent {
  final LoginRequest req;

  GetToken2({required this.req});
  @override
  List<Object?> get props => [req];

}
