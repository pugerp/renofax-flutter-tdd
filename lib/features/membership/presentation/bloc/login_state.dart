part of 'login_bloc.dart';

@immutable
abstract class LoginState extends Equatable {
  const LoginState();

  @override
  List<Object?> get props => [];
}

class Initial extends LoginState {}

class Loading extends LoginState {}

class Success extends LoginState {
  final LoginResp resp;

  Success({required this.resp});
}

class Error extends LoginState {
  final String message;

  Error({required this.message});

}
