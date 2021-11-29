import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

import '../../core/extension/context_extension.dart';
import '../model/city/city_model.dart';

class CityCard extends Card {
  CityCard(
    BuildContext context, {
    required CityModel model,
  }) : super(
          margin: EdgeInsets.zero,
          shape: const Border(bottom: BorderSide(width: 3)),
          color: context.colorScheme.background,
          child: Stack(
            alignment: AlignmentDirectional.topEnd,
            children: [
              Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage(
                      context.isDarkTheme ? model.imgPathD : model.imgPathL,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                    right: context.mediumValueW, top: context.lowValueH),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    AutoSizeText(
                      model.cityText,
                      style: context.textTheme.headline1!
                          .copyWith(color: context.colorScheme.onBackground),
                    ),
                    AutoSizeText(
                      model.countryText,
                      style: context.textTheme.headline3!
                          .copyWith(color: context.colorScheme.onBackground),
                    ),
                  ],
                ),
              )
            ],
          ),
        );
}
