import 'package:connectivity/connectivity.dart';
import 'package:flutter/foundation.dart';

class NetworkManager {
  late final Connectivity connectivity;

  NetworkManager({required this.connectivity});

  Future<bool> get hasInternetConnection async {
    if (!kIsWeb) {
      final result = await connectivity.checkConnectivity();

      return result != ConnectivityResult.none;
    } else {
      return true;
    }
  }
}
