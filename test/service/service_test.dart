// @dart = 2.8

import 'dart:convert';

import 'package:test/test.dart';
import 'package:flutterarchitecture/src/service/service.dart';
import 'package:mockito/mockito.dart';
import 'package:http/http.dart' as http;

import '../data/service_test_data.dart';

class MockClient extends Mock implements http.Client {}

Future<dynamic> testGet(http.Client client) async {
  final _service = Service();
  final response = await _service.get(client: client, path: '/signin');
  if (response is Map<String, dynamic>) {
    if (response['code'] == 0) {
      return response;
    } else {
      throw Exception(response['message']);
    }
  } else {
    throw Exception('get error');
  }
}

Future<dynamic> testPost(http.Client client) async {
  final _service = Service();

  final response = await _service.post(
    client: client,
    url: '/signin',
  );
  if (response is Map<String, dynamic>) {
    if (response['code'] == 0) {
      return response;
    } else {
      throw Exception(response['message']);
    }
  }
}

void main() {
  group('[SERVICE] [GET]', () {
    MockClient client;
    Uri uri;
    setUp(() {
      client = MockClient();
      uri = Uri.https('', '/signin');
    });
    tearDown(() {
      client = null;
      uri = null;
    });
    test('method GET success', () async {
      // api success
      when(client.get(uri)).thenAnswer((realInvocation) => Future.value(
          http.Response(jsonEncode(ServiceTestData.jsonValid), 200)));
      expect(await testGet(client), isA<Map<String, dynamic>>());
    });
    // test('method GET with statusCode = 404', () async {
    //   when(client.get(uri)).thenAnswer(
    //     (realInvocation) => Future.value(
    //       http.Response(jsonEncode(ServiceTestData.jsonError404), 404),
    //     ),
    //   );
    //   expect(testGet(client), throwsException);
    // });
  });

  group('[ServiceTest] [POST]', () {
    MockClient client;
    Uri uri;
    setUp(() {
      client = MockClient();
      uri = Uri.https('', '/signin');
    });
    tearDown(() {
      client = null;
      uri = null;
    });
    test('method POST success', () async {
      // api success
      when(client.post(uri)).thenAnswer((realInvocation) => Future.value(
          http.Response(jsonEncode(ServiceTestData.jsonValid), 200)));
      expect(await testPost(client), isA<Map<String, dynamic>>());
    });

    test('method post with statusCode = 404', () async {
      // api 404
      when(client.post(uri)).thenAnswer(
        (realInvocation) => Future.value(
          http.Response(jsonEncode(ServiceTestData.jsonError404), 404),
        ),
      );
      expect(testPost(client), throwsException);
    });
  });
}
