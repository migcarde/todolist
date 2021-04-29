import 'dart:convert';
import 'dart:typed_data';

import 'package:http/http.dart';
import 'utils.dart';

class NetworkRequest extends BaseClient {
  @override
  Future<StreamedResponse> send(BaseRequest request) {
    request.headers.putIfAbsent('Content-Type', () => 'application/json');

    return request.send();
  }
}

const DEFAULT_DURATION = Duration(seconds: 30);

Future<Response> head(Uri url, {Map<String, String>? headers}) =>
    _withClient((client) => client.head(url, headers: headers));

Future<Response> get(Uri url, {Map<String, String>? headers}) =>
    _withClient((client) => client.get(url, headers: headers));

Future<Response> post(Uri url,
        {Map<String, String>? headers, Object? body, Encoding? encoding}) =>
    _withClient((client) =>
        client.post(url, headers: headers, body: body, encoding: encoding));

Future<Response> put(Uri url,
        {Map<String, String>? headers, Object? body, Encoding? encoding}) =>
    _withClient((client) =>
        client.put(url, headers: headers, body: body, encoding: encoding));

Future<Response> patch(Uri url,
        {Map<String, String>? headers, Object? body, Encoding? encoding}) =>
    _withClient((client) =>
        client.patch(url, headers: headers, body: body, encoding: encoding));

Future<Response> delete(Uri url,
        {Map<String, String>? headers, Object? body, Encoding? encoding}) =>
    _withClient((client) =>
        client.delete(url, headers: headers, body: body, encoding: encoding));

Future<String> read(Uri url, {Map<String, String>? headers}) =>
    _withClient((client) => client.read(url, headers: headers));

Future<Uint8List> readBytes(Uri url, {Map<String, String>? headers}) =>
    _withClient((client) => client.readBytes(url, headers: headers));

Future<T> _withClient<T>(Future<T> Function(Client) fn) async {
  final client = NetworkRequest();

  try {
    final response = await fn(client).timeout(DEFAULT_DURATION);

    if (response is Response) {
      printResponse(response);
    }

    return response;
  } finally {
    client.close();
  }
}
