import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

/// [ParseJsonMixin] at where handle of all parse json of app
abstract class ParseJsonMixin {
  /// [parseResponse] this's method convert String of http.Response to json
  dynamic parseResponse(http.Response response) {
    try {
      final json = convert.jsonDecode(response.body);
      return json;
    } catch (e) {
      return {'code': -1002, 'message': e.toString()};
    }
  }

  /// [stringToJson] this's method convert String to Json
  dynamic stringToJson(String str) {
    try {
      final json = convert.jsonDecode(str);
      return json;
    } catch (e) {
      return {'code': -1002, 'message': e.toString()};
    }
  }
}
