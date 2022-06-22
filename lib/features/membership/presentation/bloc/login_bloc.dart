
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:renofax/core/error/failures.dart';
import 'package:renofax/features/membership/data/models/login_request.dart';
import 'package:renofax/features/membership/domain/entities/login_reponse.dart';
import 'package:renofax/features/membership/domain/usecases/get_token_access_and_refresh.dart' as ver1;
import 'package:renofax/features/membership/domain/usecases/usecase_login.dart' as ver2;

part 'login_event.dart';

part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final ver1.GetTokenAccessAndRefresh getTokenAccessAndRefresh;
  final ver2.UsecaseLogin login;

  LoginBloc({required this.getTokenAccessAndRefresh, required this.login})
      : super(Initial()) {
    on<GetToken2>(_getToken2);
  }

  void _getToken(
    GetToken event,
    Emitter<LoginState> emit,
  ) async {
    emit(Loading());
    final failedOrSuccess = await getTokenAccessAndRefresh(ver1.Params(
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

  void _getToken2(GetToken2 event, Emitter<LoginState> emit) async {
    emit(Loading());
    final failedOrSuccess = await login(ver2.Params(req: event.req));

    emit(
      failedOrSuccess.fold(
            (failure) => Error(message: (failure as RequestFailure).message),
            (response) => Success(resp: LoginResp(response.refresh, response.access, response.obtain)),
      ),
    );
  }
}
