import 'package:flutter_test/flutter_test.dart';
import 'package:renofax/features/login/data/models/login_response_model.dart';
import 'package:renofax/features/login/domain/entities/login_reponse.dart';

void main() {
  late LoginRespModel tLoginResponse;
  late Map<String, dynamic> jsonMap;

  setUp(() {
    tLoginResponse = LoginRespModel(
      refresh: 'refresh_token',
      access: 'access_token',
      obtain: 'obtain_token',
    );

    jsonMap = {
      'refresh': 'refresh_token',
      'access': 'access_token',
      'obtain': 'obtain_token',
    };
  });

  test(
    'should be a subclass of LoginResp entitiy',
        () {
      expect(tLoginResponse, isA<LoginResp>());
    },
  );

  group(
    'fromjson',
        () {
      test(
        'should return a valid model when converting JSON response',
            () {
          final result = LoginRespModel.fromJson(jsonMap);
          expect(result, tLoginResponse);
        },
      );
    },
  );

  group(
    'toJson',
        () {
      test(
        'should return a JSON map containing the proper data',
            () {
          final result = tLoginResponse.toJson();
          expect(result, jsonMap);
        },
      );
    },
  );
}
