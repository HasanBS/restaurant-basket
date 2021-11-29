import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

import '../../core/constants/image/image_constatns.dart';
import '../../core/extension/context_extension.dart';
import '../../core/extension/string_extension.dart';
import '../../view/basket/model/restaurant_model.dart';

class RestaurantCard extends Card {
  RestaurantCard(
    BuildContext context, {
    required RestaurantModel model,
    double? imgSize,
  }) : super(
          margin: EdgeInsets.zero,
          shape: const Border(bottom: BorderSide(width: 3)),
          color: context.colorScheme.background,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Row(
                children: [
                  FadeInImage(
                    height: imgSize ?? context.dynamicHeight(0.15),
                    width: imgSize ?? context.dynamicHeight(0.15),
                    fit: BoxFit.cover,
                    image: NetworkImage(model.images.isNotEmpty
                        ? model.images.first!.url!
                        : context.isDarkTheme
                            ? 'https://raw.githubusercontent.com/HasanBS/Abacus-App/main/assets/basketImgDark.png'
                            : 'https://raw.githubusercontent.com/HasanBS/Abacus-App/main/assets/basketImgLight.png'),
                    placeholder: AssetImage(context.isDarkTheme
                        ? ImageConstants.instance.basketImgDark
                        : ImageConstants.instance.basketImgLight),
                  ),
                  SizedBox(
                    width: context.dynamicWidth(0.76) -
                        (imgSize ?? context.dynamicHeight(0.15)),
                    child: Padding(
                      padding: EdgeInsets.all(context.normalValueW),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          AutoSizeText(
                            model.name,
                            style: context.textTheme.headline3,
                            overflow: TextOverflow.fade,
                            maxLines: 2,
                          ),
                          AutoSizeText(
                            model.priceString,
                            style: context.textTheme.subtitle1,
                          ),
                          AutoSizeText(
                            model.location.address.district ?? '',
                            style: context.textTheme.bodyText1,
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              Container(
                padding: EdgeInsets.all(context.normalValueW),
                width: context.dynamicWidth(0.24),
                child: AutoSizeText(
                  '${model.reviewScore.intString}/6',
                  style: context.textTheme.headline1,
                  maxLines: 1,
                ),
              ),
            ],
          ),
        );
}
