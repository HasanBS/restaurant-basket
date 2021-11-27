class ImageConstants {
  static ImageConstants? _instace;

  static ImageConstants get instance => _instace ??= ImageConstants._init();

  ImageConstants._init();

  //  String get onboardAdd => toSvg('onboard_add');
  String get sdneyCard => toPng('sdney');

  //String get trashDark30Loti => toLotti('moving_trash_dark30');

  String toSvg(String name) => 'assets/images/svg/$name.svg';
  String toPng(String name) => 'assets/images/png/$name.png';
  String toLotti(String name) => 'assets/images/lottie/$name.json';
}
