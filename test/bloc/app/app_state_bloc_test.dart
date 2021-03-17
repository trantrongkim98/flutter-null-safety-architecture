// @dart = 2.8
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutterarchitecture/src/bloc/app_bloc/app_cubit.dart';
import 'package:flutterarchitecture/src/model/remote/user/sign_in.dart';
import 'package:flutterarchitecture/src/repository/user/user_repository.dart';
import 'package:mockito/mockito.dart';

// class AppStateFake extends Fake implements AppState {}

// class AppCubitMock extends MockCubit<AppState> implements AppCubit {}
class UserRepositoryMock extends Mock implements UserRepository {}

void main() {
  group('when listener', () {
    test('demo', () async {
      final userRepository = UserRepositoryMock();
      final appCubitMock = AppCubit(userRepository);
      when(userRepository.signIn(SignInRequest()))
          .thenAnswer((realInvocation) async {
        return SignInResponse();
      });
      appCubitMock.onSwitchTheme();
      expect(appCubitMock.state.themeMode, equals(ThemeMode.dark));
    });
  });
}
