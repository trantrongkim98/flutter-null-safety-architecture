import 'package:flutterarchitecture/src/model/remote/user/sign_in.dart';
import 'package:flutterarchitecture/src/service/user/user_service.dart';

/// [UserRepository] the repository for User
class UserRepository {
  UserRepository._(this._service);

  late UserService _service;

  /// [instance] the singleton for UserRepository
  static UserRepository instance = UserRepository._(UserService());
  /// sign in at repository
  Future<SignInResponse> signIn(SignInRequest request)async{
    final response  = await _service.signIn(request);
    /// handle response at here
    return response;
  }

}
