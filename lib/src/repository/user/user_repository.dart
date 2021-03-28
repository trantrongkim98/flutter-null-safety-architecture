import 'package:flutterarchitecture/src/model/remote/user/sign_in.dart';
import 'package:flutterarchitecture/src/service/user/user_service.dart';

/// [UserRepository] the repository for User
class UserRepository {
  UserRepository(this._service);
  factory UserRepository.initial() => UserRepository(UserService());
  late UserService _service;

  /// sign in at repository
  Future<SignInResponse> signIn(SignInRequest request) async {
    final response = await _service.signIn(request);

    /// handle response at here
    return response;
  }
}
