class ImageConstants {
  static ImageConstants? _instace;

  static ImageConstants get instance => _instace ??= ImageConstants._init();

  ImageConstants._init();

  String get istLight => toPng('istLight');
  String get romeLight => toPng('romeLight');
  String get amstLight => toPng('amstLight');
  String get berlinLight => toPng('berlinLight');
  String get londonLight => toPng('londonLight');
  String get sdneyLight => toPng('sdneyLight');
  String get basketImgLight => toPng('basketImgLight');
  String get restImgLight => toPng('restImgLight');

  String get istDark => toPng('istDark');
  String get romeDark => toPng('romeDark');
  String get amstDark => toPng('amstDark');
  String get berlinDark => toPng('berlinDark');
  String get londonDark => toPng('londonDark');
  String get sdneyDark => toPng('sdneyDark');
  String get basketImgDark => toPng('basketImgDark');
  String get restImgDark => toPng('restImgDark');

  String get lottie => toLotti('lottie');
  String get lottieDark => toLotti('lottieDark');

  String toPng(String name) => 'assets/images/png/$name.png';
  String toLotti(String name) => 'assets/images/lottie/$name.json';
}
