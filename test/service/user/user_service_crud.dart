// @dart = 2.8

import 'package:flutterarchitecture/src/model/remote/user/sign_in.dart';
import 'package:flutterarchitecture/src/service/service.dart';
import 'package:flutterarchitecture/src/service/user/user_service.dart';
import 'package:flutterarchitecture/src/utils/mixin/parse_json_mixin.dart';
import 'package:mockito/mockito.dart';
import 'package:test/test.dart';

import '../../data/service_test_data.dart';

class ServiceMock extends Mock implements Service {}

Future<SignInResponse> testSignIn(Service service) async {
  UserService userService = UserService(service: service);
  final response = await userService.signIn(SignInRequest());
  if (response.code == 0) {
    return response;
  } else {
    throw Exception(response.message);
  }
}

void crudTest() {
  group('[UserServiceTest]', () {
    ServiceMock service;
    setUp(() {
      service = ServiceMock();
    });

    tearDown(() {
      service = null;
    });

    test('sign in success', () async {
      final url = '/signin';
      when(service.post(url: url)).thenAnswer((realInvocation) async {
        return ServiceTestData.jsonValid;
      });
      expect(await testSignIn(service), isA<SignInResponse>());
    });

    test('sign in with response diff Map<String,dynamic>', () async {
      final url = '/signin';
      when(service.post(url: url))
          .thenAnswer((realInvocation) async => SignInResponse());
      expect(testSignIn(service), throwsException);
    });
  });
}
