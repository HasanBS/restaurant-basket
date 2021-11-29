import '../../../product/model/city/city_model.dart';
import '../../extension/string_extension.dart';
import '../../init/lang/locale_keys.g.dart';
import '../image/image_constatns.dart';

class CityConstants {
  static CityConstants? _instace;

  static CityConstants get instance => _instace ??= CityConstants._init();

  CityConstants._init();

  List<CityModel> get cities =>
      [_istanbul, _berlin, _london, _rome, _amsterdam, _sdyney];

  CityModel get _istanbul => CityModel(
      cityText: LocaleKeys.home_buttons_istanbul_name.locale,
      countryText: LocaleKeys.home_buttons_istanbul_country.locale,
      imgPathL: ImageConstants.instance.istLight,
      imgPathD: ImageConstants.instance.istDark);

  CityModel get _berlin => CityModel(
      cityText: LocaleKeys.home_buttons_berlin_name.locale,
      countryText: LocaleKeys.home_buttons_berlin_country.locale,
      imgPathL: ImageConstants.instance.berlinLight,
      imgPathD: ImageConstants.instance.berlinDark);

  CityModel get _london => CityModel(
      cityText: LocaleKeys.home_buttons_london_name.locale,
      countryText: LocaleKeys.home_buttons_london_country.locale,
      imgPathL: ImageConstants.instance.londonLight,
      imgPathD: ImageConstants.instance.londonDark);

  CityModel get _rome => CityModel(
      cityText: LocaleKeys.home_buttons_rome_name.locale,
      countryText: LocaleKeys.home_buttons_rome_country.locale,
      imgPathL: ImageConstants.instance.romeLight,
      imgPathD: ImageConstants.instance.romeDark);

  CityModel get _amsterdam => CityModel(
      cityText: LocaleKeys.home_buttons_amsterdam_name.locale,
      countryText: LocaleKeys.home_buttons_amsterdam_country.locale,
      imgPathL: ImageConstants.instance.amstLight,
      imgPathD: ImageConstants.instance.amstDark);

  CityModel get _sdyney => CityModel(
      cityText: LocaleKeys.home_buttons_sydney_name.locale,
      countryText: LocaleKeys.home_buttons_sydney_country.locale,
      imgPathL: ImageConstants.instance.sdneyLight,
      imgPathD: ImageConstants.instance.sdneyDark);
}
