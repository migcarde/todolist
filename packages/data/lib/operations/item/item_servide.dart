import 'dart:io';

import 'package:data/network_request.dart' as httpInterceptor;
import 'package:data/response_parse.dart';
import 'package:data/respository_failure.dart';
import 'package:common_flutter/app_config.dart';

class ItemService {
  Future<List<dynamic>> getItems() async {
    try {
      final response = await httpInterceptor
          .get(Uri.https(AppConfig.instance.baseUrl, '/items'));

      final body = parsedResponse(response);

      return body;
    } on SocketException {
      throw NoInternet;
    } on HttpException {
      throw RepositoryException;
    } on FormatException {
      throw RepositoryException;
    } catch (e) {
      throw Unknown();
    }
  }
}
