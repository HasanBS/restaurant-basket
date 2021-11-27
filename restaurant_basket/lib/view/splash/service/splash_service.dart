import 'package:flutter/material.dart';

class SplashService {
  static SplashService? _instance;

  static SplashService get instance {
    if (_instance != null) return _instance!;
    _instance = SplashService._init();
    return _instance!;
  }

  SplashService._init();

  Future<void> serviceInit() async {
    WidgetsFlutterBinding.ensureInitialized();
    // await CounterDatabaseProvider.instance.initDB();
    // await CountdownDatabaseProvider.instance.initDB();
    // await TodoDatabaseProvider.instance.initDB();
  }
}
