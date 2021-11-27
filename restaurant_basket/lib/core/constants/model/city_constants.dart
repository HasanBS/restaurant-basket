import 'package:restaurant_basket/core/init/lang/locale_keys.g.dart';
import 'package:restaurant_basket/product/model/city/city_model.dart';
import 'package:restaurant_basket/core/extension/string_extension.dart';
import 'package:restaurant_basket/core/constants/image/image_constatns.dart';

class CityConstants {
  static CityConstants? _instace;

  static CityConstants get instance => _instace ??= CityConstants._init();

  CityConstants._init();

  List<CityModel> get cities =>
      [_istanbul, _berlin, _london, _rome, _amsterdam, _sdyney];

  CityModel get _istanbul => CityModel(
      cityText: LocaleKeys.home_buttons_istanbul_name.locale,
      countryText: LocaleKeys.home_buttons_istanbul_country.locale,
      imgPath: ImageConstants.instance.sdneyCard);

  CityModel get _berlin => CityModel(
      cityText: LocaleKeys.home_buttons_berlin_name.locale,
      countryText: LocaleKeys.home_buttons_berlin_country.locale,
      imgPath: ImageConstants.instance.sdneyCard);

  CityModel get _london => CityModel(
      cityText: LocaleKeys.home_buttons_london_name.locale,
      countryText: LocaleKeys.home_buttons_london_country.locale,
      imgPath: ImageConstants.instance.sdneyCard);

  CityModel get _rome => CityModel(
      cityText: LocaleKeys.home_buttons_rome_name.locale,
      countryText: LocaleKeys.home_buttons_rome_country.locale,
      imgPath: ImageConstants.instance.sdneyCard);

  CityModel get _amsterdam => CityModel(
      cityText: LocaleKeys.home_buttons_amsterdam_name.locale,
      countryText: LocaleKeys.home_buttons_amsterdam_country.locale,
      imgPath: ImageConstants.instance.sdneyCard);

  CityModel get _sdyney => CityModel(
      cityText: LocaleKeys.home_buttons_sydney_name.locale,
      countryText: LocaleKeys.home_buttons_sydney_country.locale,
      imgPath: ImageConstants.instance.sdneyCard);
}
