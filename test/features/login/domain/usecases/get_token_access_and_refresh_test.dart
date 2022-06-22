import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:renofax/features/membership/domain/entities/login_reponse.dart';
import 'package:renofax/features/membership/domain/repositories/login_repository.dart';
import 'package:renofax/features/membership/domain/usecases/get_token_access_and_refresh.dart';

import 'get_token_access_and_refresh_test.mocks.dart';

@GenerateMocks([LoginRepository])
void main() {
  late GetTokenAccessAndRefresh usecase;
  late MockLoginRepository mockLoginRepository;

  setUp(() {
    mockLoginRepository = MockLoginRepository();
    usecase = GetTokenAccessAndRefresh(repository: mockLoginRepository);
  });

  final tLoginResp = LoginResp('refresh_token', 'access_token', 'obtain');

  test(
    'should get LoginResp for the Login Repository',
    () async {
      final tUsername = 'Username';
      final tPassword = 'Password';
      when(mockLoginRepository.getTokenAccessAndRefresh(any, any))
          .thenAnswer((_) async => Right(tLoginResp));

      final result = await usecase(Params(tUsername, tPassword));

      expect(result, Right(tLoginResp));
      verify(mockLoginRepository.getTokenAccessAndRefresh(tUsername, tPassword));
      verifyNoMoreInteractions(mockLoginRepository);
    },
  );
}
