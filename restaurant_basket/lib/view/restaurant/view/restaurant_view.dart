import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:restaurant_basket/view/restaurant/cubit/restaurant_cubit.dart';
import '../../../core/components/text/auto_locale_text.dart';
import '../../../core/extension/context_extension.dart';
import '../../../core/init/lang/locale_keys.g.dart';
import '../../../product/button/call_button.dart';
import '../../../product/button/navigation_button.dart';
import '../../../product/appbar/custom_appbar.dart';
import '../../basket/model/restaurant_model.dart';
import '../../../core/extension/string_extension.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RestaurantView extends StatelessWidget {
  final RestaurantModel model;
  const RestaurantView({Key? key, required this.model}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => RestaurantCubit(model.images),
      child: Scaffold(
        appBar: _customAppbar(context),
        body: _body(context),
      ),
    );
  }

  PreferredSize _customAppbar(BuildContext context) {
    return CustomAppBar(context, model: model);
  }

  BlocBuilder _body(BuildContext context) {
    return BlocBuilder<RestaurantCubit, RestaurantState>(
      builder: (context, state) {
        return Padding(
          padding: EdgeInsets.symmetric(
              horizontal: context.mediumValueW, vertical: context.normalValueH),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Flexible(flex: 3, child: _restaurantInfo(context)),
              Flexible(flex: 4, child: _avaibleTimes(context))
            ],
          ),
        );
      },
    );
  }

  Column _restaurantInfo(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Padding(
          padding: EdgeInsets.only(bottom: context.normalValueH),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Flexible(
                  flex: 2,
                  child: AutoSizeText(model.priceString,
                      style: context.textTheme.bodyText2)),
              Flexible(
                  flex: 8,
                  child: AutoSizeText(model.name,
                      style: context.textTheme.bodyText2, maxLines: 1)),
              Flexible(
                  flex: 2,
                  child: AutoSizeText('${model.reviewScore.intString}/6',
                      style: context.textTheme.bodyText2)),
            ],
          ),
        ),
        Row(
          children: [
            Padding(
              padding: EdgeInsets.only(right: context.lowValueW),
              child: const Icon(Icons.restaurant_rounded),
            ),
            Flexible(
                child: AutoSizeText(model.cuisineString,
                    style: context.textTheme.bodyText1, maxLines: 1)),
          ],
        ),
        NavigationButton(context, model: model),
        CallButton(context, model: model),
      ],
    );
  }

  SingleChildScrollView _avaibleTimes(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AutoLocaleText(
            value: LocaleKeys.basket_avaibleTimes_title,
            style: context.textTheme.headline3,
          ),
          Container(
            decoration: BoxDecoration(
              border: Border(
                left: BorderSide(
                    width: 2.0, color: context.colorScheme.onBackground),
              ),
            ),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: context.mediumValueW),
              child: AutoSizeText(
                model.avaibleTimesList,
                style: context.textTheme.bodyText1!.copyWith(height: 1.3.sp),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
