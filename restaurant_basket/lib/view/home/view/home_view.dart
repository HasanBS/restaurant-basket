import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import '../../../core/components/text/auto_locale_text.dart';
import '../../../core/constants/app/app_constants.dart';
import '../../../core/constants/app/city_constants.dart';
import '../../../core/constants/navigation/navigation_constants.dart';
import '../../../core/extension/context_extension.dart';
import '../../../core/init/lang/locale_keys.g.dart';
import '../../../core/init/navigation/navigation_service.dart';
import '../../../product/card/city_card.dart';
import '../../../product/model/request/request_model.dart';

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
      itemCount: AppConstants.ELEMENTINPAGE,
      itemExtent: context.bodyHeight(_appBar) / AppConstants.ELEMENTINPAGE,
      itemBuilder: (context, index) => _cardButton(context, index),
    );
  }

  ElevatedButton _cardButton(BuildContext context, int index) {
    return ElevatedButton(
        onPressed: () {
          final RequestModel requestModel = RequestModel(
              place: CityConstants.instance.cities[index].cityText,
              language: context.deviceLocale.toString(),
              limit: AppConstants.PAGELOADLIMIT,
              offset: AppConstants.STARTOFFSET);
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
      title: const AutoLocaleText(value: LocaleKeys.home_title),
    );
  }
}
