//import 'dart:html';

import 'package:dio/dio.dart';
import 'package:restaurant_basket/core/constants/app/app_constants.dart';

import 'core_dio.dart';
import 'icore_dio.dart';

class NetworkManager {
  static NetworkManager? _instance;

  static NetworkManager get instance {
    return _instance ??= NetworkManager._init();
  }

  late ICoreDio coreDio;

  NetworkManager._init() {
    final baseOptions = BaseOptions(baseUrl: AppConstants.API_URL);
    coreDio = CoreDio(baseOptions);
  }
}
