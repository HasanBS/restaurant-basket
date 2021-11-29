import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../core/extension/string_extension.dart';
import '../../core/extension/context_extension.dart';
import '../../view/basket/model/restaurant_model.dart';

class NavigationButton extends ElevatedButton {
  NavigationButton(BuildContext context, {required RestaurantModel model})
      : super(
          onPressed: () async {
            final url =
                'https://www.google.com/maps/search/?api=1&query=${model.location.coordinates.latitude},${model.location.coordinates.longitude}';
            try {
              await launch(url);
            } catch (e) {
              throw 'Could not launch $url';
            }
          },
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Padding(
                    padding: EdgeInsets.only(right: context.lowValueW),
                    child: Icon(
                      Icons.map,
                      color: context.colorScheme.onBackground,
                    ),
                  ),
                  AutoSizeText(
                    "${model.adressTitleString} ",
                    style: context.textTheme.bodyText1,
                    maxLines: 1,
                  ),
                ],
              ),
              AutoSizeText(
                model.adressString,
                style: context.textTheme.bodyText1,
                maxLines: 1,
              ),
            ],
          ),
        );
}
