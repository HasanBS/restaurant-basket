import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

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
                    child: Center(
                      child: CachedNetworkImage(
                        imageUrl: model.images[index]!.url!,
                        imageBuilder: (context, imageProvider) => Container(
                          decoration: BoxDecoration(
                            image: DecorationImage(
                                image: imageProvider, fit: BoxFit.fill),
                          ),
                        ),
                        fadeOutDuration: Duration.zero,
                      ),
                    ),
                  ),
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
                  )
                ],
              ),
            ),
          ),
        );
}
