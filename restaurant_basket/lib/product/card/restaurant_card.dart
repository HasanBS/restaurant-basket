import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:restaurant_basket/core/extension/context_extension.dart';
import 'package:restaurant_basket/core/extension/string_extension.dart';
import 'package:restaurant_basket/view/basket/model/restaurant_model.dart';

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
                    image: NetworkImage(model.images.first!.url!),
                    placeholder: const AssetImage(
                      'assets/images/png/sdney.png',
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(context.normalValueW),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: context.dynamicWidth(0.4),
                          child: AutoSizeText(
                            model.name,
                            style: context.textTheme.headline3,
                            overflow: TextOverflow.fade,
                          ),
                        ),
                        AutoSizeText(
                          '',
                          style: context.textTheme.subtitle1,
                        ),
                        AutoSizeText(
                          model.location.address!.city!,
                          style: context.textTheme.bodyText1,
                        )
                      ],
                    ),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.all(context.normalValueW),
                child: AutoSizeText(
                  '${model.reviewScore.intString}/6',
                  style: context.textTheme.headline1,
                ),
              ),
            ],
          ),
        );
}
