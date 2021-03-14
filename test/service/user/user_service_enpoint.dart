// @dart = 2.8

import 'package:flutterarchitecture/src/service/api_const.dart';
import 'package:flutterarchitecture/src/service/user/user_service.dart';
import 'package:test/test.dart';

void userServiceEnpointTest() {
  group('[Enpoint UserServiceTest]', () {
    final userService = UserService();
    test('enpoint sign in', () async {
      expect(userService.getUrl(SIGN_IN), equals('/signin'));
    });
  });
}
