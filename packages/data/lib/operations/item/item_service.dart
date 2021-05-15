import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:data/network_request.dart' as httpInterceptor;
import 'package:data/response_parse.dart';
import 'package:data/respository_failure.dart';
import 'package:common_flutter/app_config.dart';
import 'package:firebase_database/firebase_database.dart';

class ItemService {
  /* Future<List<dynamic>> getItems() async {
    try {
      final firestore = FirebaseFirestore.instance;
      final Stream itemsSnapshots = firestore.collection('items').snapshots();
      itemsSnapshots.handleError(onError)
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
  } */

  Stream getItems() {
    final firestore = FirebaseFirestore.instance;

    return firestore.collection('items').snapshots();
  }
}
