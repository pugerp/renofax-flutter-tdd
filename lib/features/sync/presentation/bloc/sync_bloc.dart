import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:renofax/core/usecases/usecase.dart';
import '../../../../core/assets/constantas.dart';
import '../../domain/usecase/get_users.dart';
part 'sync_event.dart';
part 'sync_state.dart';

class SyncBloc extends Bloc<SyncEvent, SyncState> {
  final GetUsers getUsers;

  SyncBloc({
    required this.getUsers,
  }) : super(Initial()) {
    on<syncData>(_sync);
  }

  void _sync(
      syncData event,
    Emitter<SyncState> emit,
  ) async {
    emit(Loading());

    if(event.syncEvent.contains(SYNC_USER)) {
    }


    final failedOrSuccess = await getUsers(NoParams());

    emit(
      failedOrSuccess.fold(
        (failed) => Error(),
        (success) => Success(),
      ),
    );
  }
}
