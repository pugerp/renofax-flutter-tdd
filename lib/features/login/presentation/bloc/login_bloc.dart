import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:renofax/features/login/domain/entities/login_reponse.dart';
import 'package:renofax/features/login/domain/usecases/get_token_access_and_refresh.dart';

part 'login_event.dart';

part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final GetTokenAccessAndRefresh getTokenAccessAndRefresh;

  LoginBloc({required this.getTokenAccessAndRefresh}) : super(Initial()) {
    on<GetToken>(_getToken);
  }

  void _getToken(
    GetToken event,
    Emitter<LoginState> emit,
  ) async {
    emit(Loading());
    final failedOrSuccess = await getTokenAccessAndRefresh(Params(
      event.username,
      event.password,
    ));

    emit(
      failedOrSuccess.fold(
        (failed) => Error(
            message:
                'Failed login, please check your username or password again'),
        (response) => Success(resp: response),
      ),
    );
  }
}
