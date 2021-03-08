// ignore: prefer_double_quotes
import 'package:http/http.dart' as http;
import 'package:flutterarchitecture/src/utils/mixin/parse_json_mixin.dart';

/// [Service] this's base Service of app to handle Api
/// class UserService extends Service{
///  Future<SignInResponse> signIn(SignInRequest request)async{
///    final url = _getUrl(SIGN_IN);
///     try{
///       Map<String,dynamic> response = await this.post(url:url);
///       SignInResponse result = SignInResponse.fromJson(response);
///       return result;
///     }catch(e){
///       return SignInResponse(code: -1000);
///     }
///   }
/// }
abstract class Service with ParseJsonMixin {
  /// [get] method Get
  Future<dynamic>? get({
    String path = '',
    Map<String, String>? headers,
    bool isToken = false,
  }) async {
    final client = http.Client();
    try {
      final uri = Uri.dataFromString(path);
      final response = await client.get(uri, headers: headers);
      return parseResponse(response);
    } on http.ClientException catch (_) {
      return null;
    } finally {
      client.close();
    }
  }

  ///[post] method post
  Future<dynamic>? post({String url = ''}) async {
    final client = http.Client();
    try {
      final uri = Uri.dataFromString(url);
      final response = await client.post(uri);
      return parseResponse(response);
    } catch (e) {
      print(e);
      return null;
    } finally {
      client.close();
    }
  }
}
