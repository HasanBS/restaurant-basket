class SplashService {
  static SplashService? _instance;

  static SplashService get instance {
    return _instance ??= SplashService._init();
  }

  SplashService._init();

  Future<void> serviceInit() async {
    //For any init operation on splash screen
  }
}
