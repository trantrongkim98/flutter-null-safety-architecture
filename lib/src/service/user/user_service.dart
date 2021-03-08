import 'package:flutterarchitecture/src/model/remote/user/sign_in.dart';
import 'package:flutterarchitecture/src/service/api_const.dart';

import '../service.dart';

/// [UserService] this's Service for User to call to server
class UserService extends Service {

  /// sign in at Service, this method handle data response from api
  Future<SignInResponse> signIn(SignInRequest request)async{
    final url = _getUrl(SIGN_IN);
    try{
      Map<String,dynamic> response = await this.post(url:url);
      SignInResponse result = SignInResponse.fromJson(response);
      return result;
    }catch(e){
      return SignInResponse(code: -1000);
    }
  }

  String _getUrl(int code){
    switch(code){
      case SIGN_IN:
        return '/signin';
      default:
        return '';
    }
  }
}
