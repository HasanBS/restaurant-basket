import 'package:easy_localization/easy_localization.dart';

import '../../view/basket/model/restaurant_model.dart';
import '../init/lang/locale_keys.g.dart';

extension StringLocalization on String {
  String get locale => this.tr();
}

extension RestaurantModelExtension on RestaurantModel {
  String get cuisineString {
    final buffer = StringBuffer("${LocaleKeys.basket_cuisine.locale}: ");
    final model = this;
    final _tagGroup =
        model.tagGroups.where((element) => element!.type == "CUISINE").toList();
    if (_tagGroup.first != null) {
      final tagList = _tagGroup.first!.tags;
      for (var i = 0; i < tagList.length; i++) {
        buffer.write("${tagList[i].name}, ");
      }
    }
    final res = buffer.toString();
    return res.substring(0, res.length - 2);
  }

  String get avaibleTimesList {
    final buffer = StringBuffer();
    final model = this;

    final openingTimes = model.openingTimes.standardOpeningTimes;

    if (openingTimes.SUNDAY != null) {
      buffer.write(
          "${LocaleKeys.basket_avaibleTimes_sunday.locale}\n${LocaleKeys.basket_avaibleTimes_open.locale} : ${openingTimes.SUNDAY!.first.start} - ${LocaleKeys.basket_avaibleTimes_close.locale} : ${openingTimes.SUNDAY!.first.end}\n");
    }
    if (openingTimes.MONDAY != null) {
      buffer.write(
          "${LocaleKeys.basket_avaibleTimes_monday.locale}\n${LocaleKeys.basket_avaibleTimes_open.locale} : ${openingTimes.MONDAY!.first.start} - ${LocaleKeys.basket_avaibleTimes_close.locale} : ${openingTimes.MONDAY!.first.end}\n");
    }
    if (openingTimes.TUESDAY != null) {
      buffer.write(
          "${LocaleKeys.basket_avaibleTimes_thursday.locale}\n${LocaleKeys.basket_avaibleTimes_open.locale} : ${openingTimes.TUESDAY!.first.start} - ${LocaleKeys.basket_avaibleTimes_close.locale} : ${openingTimes.TUESDAY!.first.end}\n");
    }
    if (openingTimes.WEDNESDAY != null) {
      buffer.write(
          "${LocaleKeys.basket_avaibleTimes_wednesday.locale}\n${LocaleKeys.basket_avaibleTimes_open.locale} : ${openingTimes.WEDNESDAY!.first.start} - ${LocaleKeys.basket_avaibleTimes_close.locale} : ${openingTimes.WEDNESDAY!.first.end}\n");
    }
    if (openingTimes.THURSDAY != null) {
      buffer.write(
          "${LocaleKeys.basket_avaibleTimes_thursday.locale}\n${LocaleKeys.basket_avaibleTimes_open.locale} : ${openingTimes.THURSDAY!.first.start} - ${LocaleKeys.basket_avaibleTimes_close.locale} : ${openingTimes.THURSDAY!.first.end}\n");
    }
    if (openingTimes.FRIDAY != null) {
      buffer.write(
          "${LocaleKeys.basket_avaibleTimes_friday.locale}\n${LocaleKeys.basket_avaibleTimes_open.locale} : ${openingTimes.FRIDAY!.first.start} - ${LocaleKeys.basket_avaibleTimes_close.locale} : ${openingTimes.FRIDAY!.first.end}\n");
    }
    if (openingTimes.SATURDAY != null) {
      buffer.write(
          "${LocaleKeys.basket_avaibleTimes_saturday.locale}\n${LocaleKeys.basket_avaibleTimes_open.locale} : ${openingTimes.SATURDAY!.first.start} - ${LocaleKeys.basket_avaibleTimes_close.locale} : ${openingTimes.SATURDAY!.first.end}\n");
    }

    return buffer.toString();
  }

  String get phoneString {
    final buffer = StringBuffer();
    final model = this;
    buffer.write("${LocaleKeys.basket_number.locale} ${model.phoneNumber}");
    return buffer.toString();
  }

  String get adressTitleString {
    final buffer = StringBuffer();
    final model = this;
    buffer.write(
        "${model.location.address.city}/${model.location.address.district}");
    return buffer.toString();
  }

  String get adressString {
    final buffer = StringBuffer();
    final model = this;
    buffer.write("${model.location.address.street} ");
    buffer.write("${model.location.address.number} ");
    buffer.write(model.location.address.zipcode);
    return buffer.toString();
  }

  String get priceString {
    final model = this;
    String currency;
    switch (model.currency) {
      case "EUR":
        currency = "€";
        break;
      case "AUD":
        currency = "\$";
        break;
      case "TRY":
        currency = "₺";
        break;
      case "GBP":
        currency = "£";
        break;

      default:
        currency = "\$";
    }

    final buffer = StringBuffer();
    final _tagGroup =
        model.tagGroups.where((element) => element!.type == "PRICE").toList();
    if (_tagGroup.isNotEmpty) {
      final tagList = _tagGroup.first!.tags;
      for (var i = 0; i < tagList.length; i++) {
        switch (tagList[i].name) {
          case "price high class":
            buffer.write(currency + currency + currency + currency);
            break;
          case "price upscale":
            buffer.write(currency + currency + currency);
            break;
          case "price average":
            buffer.write(currency + currency);
            break;
          case "price cheap":
            buffer.write(currency);
            break;
          default:
        }
      }
    }
    return buffer.toString();
  }
}

extension IntegerExtention on String {
  String get intString => toString().padRight(2, '.0');
}
