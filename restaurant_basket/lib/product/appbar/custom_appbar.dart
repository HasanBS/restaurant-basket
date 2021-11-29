import 'package:flutter/material.dart';

import '../../core/constants/image/image_constatns.dart';
import '../../core/extension/context_extension.dart';
import '../../view/basket/model/restaurant_model.dart';

class CustomAppBar extends PreferredSize {
  CustomAppBar(BuildContext context, {required RestaurantModel model})
      : super(
          preferredSize: Size.fromHeight(context.dynamicHeight(0.3)),
          child: AppBar(
            iconTheme: const IconThemeData(
              color: Colors.white,
            ),
            flexibleSpace: PageView.builder(
              itemCount: model.images.length,
              itemBuilder: (context, index) => Stack(
                alignment: AlignmentDirectional.bottomCenter,
                children: [
                  ClipRRect(
                    borderRadius: const BorderRadius.vertical(
                        bottom: Radius.circular(34)),
                    child: FadeInImage(
                      height: Size.fromHeight(
                        context.dynamicHeight(0.3),
                      ).aspectRatio,
                      width: context.width,
                      fit: BoxFit.cover,
                      image: NetworkImage(
                        model.images[index]!.url!,
                      ),
                      placeholder: AssetImage(context.isDarkTheme
                          ? ImageConstants.instance.restImgDark
                          : ImageConstants.instance.restImgLight),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      ListView.builder(
                        itemCount: model.images.length,
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, listIndex) {
                          return Align(
                            alignment: Alignment.bottomCenter,
                            child: Padding(
                              padding: context.paddingLow,
                              child: CircleAvatar(
                                backgroundColor: index == listIndex
                                    ? context.colorScheme.background
                                    : context.colorScheme.background
                                        .withOpacity(0.5),
                                radius: index == listIndex
                                    ? context.dynamicWidth(0.015)
                                    : context.dynamicWidth(0.01),
                              ),
                            ),
                          );
                        },
                      ),
                    ],
                  )
                ],
              ),
            ),
            shape: const RoundedRectangleBorder(
                borderRadius:
                    BorderRadius.vertical(bottom: Radius.circular(34))),
          ),
        );
}
