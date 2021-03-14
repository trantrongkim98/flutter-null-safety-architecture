// ignore: prefer_double_quotes
import 'dart:async';

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
class Service with ParseJsonMixin {
  const Service();

  /// [get] method Get
  Future<dynamic>? get({
    String path = '',
    Map<String, String>? headers,
    bool isToken = false,
    http.Client? client,
  }) async {
    final _client = client ?? http.Client();
    try {
      final uri = Uri.https('', path);
      final response = await _client
          .get(uri, headers: headers)
          .timeout(Duration(seconds: 10));
      if (response.statusCode == 200) {
        return parseResponse(response);
      } else {
        return {'code': response.statusCode, 'message': response.body};
      }
    } on TimeoutException catch (e) {
      return {'code': -1001, 'message': e.message};
    } on http.ClientException catch (e) {
      return {'code': -1002, 'message': e.message};
    } finally {
      _client.close();
    }
  }

  ///[post] method post
  Future<dynamic>? post({
    String url = '',
    Object? body,
    http.Client? client,
    Map<String, String>? headers,
  }) async {
    final _client = client ?? http.Client();
    try {
      final uri = Uri.https('', url);
      final response = await _client
          .post(uri, headers: headers, body: body)
          .timeout(Duration(seconds: 10));
      if (response.statusCode == 200) {
        return parseResponse(response);
      } else {
        return {'code': response.statusCode, 'message': response.body};
      }
    } on TimeoutException catch (e) {
      return {'code': -1001, 'message': e.message};
    } on http.ClientException catch (e) {
      return {'code': -1002, 'message': e.message};
    } finally {
      _client.close();
    }
  }
}
