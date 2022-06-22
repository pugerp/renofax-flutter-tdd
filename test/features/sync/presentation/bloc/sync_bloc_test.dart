import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:renofax/features/sync/domain/usecase/get_users.dart';
import 'package:renofax/features/sync/presentation/bloc/sync_bloc.dart';

import 'sync_bloc_test.mocks.dart';

@GenerateMocks([GetUsers])
void main() {
  late SyncBloc bloc;
  late MockGetUsers getUsers;

  setUp((){
    getUsers = MockGetUsers();
    bloc = SyncBloc(getUsers: getUsers);
  });

  group('Sync data', () {

  });
}