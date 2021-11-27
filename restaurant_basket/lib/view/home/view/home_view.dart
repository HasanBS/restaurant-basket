import 'package:auto_size_text/auto_size_text.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:restaurant_basket/core/constants/model/city_constants.dart';
import 'package:restaurant_basket/core/constants/navigation/navigation_constants.dart';
import 'package:restaurant_basket/core/extension/context_extension.dart';
import 'package:restaurant_basket/core/extension/string_extension.dart';
import 'package:restaurant_basket/core/init/lang/locale_keys.g.dart';
import 'package:restaurant_basket/core/init/navigation/navigation_service.dart';
import 'package:restaurant_basket/product/card/city_card.dart';
import 'package:restaurant_basket/product/model/request/request_model.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar,
      body: _body(context),
    );
  }

  ListView _body(BuildContext context) {
    return ListView.builder(
      physics: const NeverScrollableScrollPhysics(),
      itemCount: 6,
      itemExtent: context.bodyHeight(_appBar) / 6,
      itemBuilder: (context, index) => _cardButton(context, index),
    );
  }

  ElevatedButton _cardButton(BuildContext context, int index) {
    return ElevatedButton(
        onPressed: () {
          final RequestModel requestModel = RequestModel(
              place: CityConstants.instance.cities[index].cityText,
              language: context.deviceLocale.toString(),
              limit: 12,
              offset: 0);
          NavigationService.instance.navigateToPage(
              path: NavigationConstants.BASKET, data: requestModel);
        },
        child: _cityCard(context, index));
  }

  CityCard _cityCard(BuildContext context, int index) {
    return CityCard(
      context,
      model: CityConstants.instance.cities[index],
    );
  }

  AppBar get _appBar {
    return AppBar(
      centerTitle: true,
      title: AutoSizeText(LocaleKeys.home_title.locale),
    );
  }
}
