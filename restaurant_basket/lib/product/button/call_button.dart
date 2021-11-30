import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:restaurant_basket/core/components/text/auto_locale_text.dart';
import '../../core/init/lang/locale_keys.g.dart';
import '../../view/basket/model/restaurant_model.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../core/extension/context_extension.dart';

class CallButton extends ElevatedButton {
  CallButton(BuildContext context, {required RestaurantModel model})
      : super(
          onPressed: () => launch("tel:${model.phoneNumber}"),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding: EdgeInsets.only(right: context.lowValueW),
                child: Icon(
                  Icons.phone,
                  color: context.colorScheme.onBackground,
                ),
              ),
              AutoLocaleText(
                value: LocaleKeys.basket_number,
                style: context.textTheme.bodyText1,
              ),
              AutoSizeText(
                " ${model.phoneNumber}",
                style: context.textTheme.bodyText1!.apply(
                  decoration: TextDecoration.underline,
                ),
              ),
            ],
          ),
        );
}
