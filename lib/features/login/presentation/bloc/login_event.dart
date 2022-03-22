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
