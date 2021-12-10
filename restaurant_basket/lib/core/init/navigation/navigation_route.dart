import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import '../../../view/splash/view/splash_view.dart';

import '../../../product/model/request/request_model.dart';
import '../../../view/basket/model/restaurant_model.dart';
import '../../../view/basket/view/basket_view.dart';
import '../../../view/restaurant/view/restaurant_view.dart';
import '../../../view/home/view/home_view.dart';
import '../../components/card/not_found_navigation_widget.dart';
import '../../constants/navigation/navigation_constants.dart';

class NavigationRoute {
  static final NavigationRoute _instance = NavigationRoute._init();
  static NavigationRoute get instance => _instance;

  NavigationRoute._init();

  Route<dynamic> generateRoute(RouteSettings args) {
    switch (args.name) {
      case NavigationConstants.DEFAULT:
        return normalNavigate(const SplashPage());

      case NavigationConstants.HOME:
        return normalNavigate(const HomeView());

      case NavigationConstants.BASKET:
        return normalNavigate(
          BasketPage(requestModel: args.arguments! as RequestModel),
        );

      case NavigationConstants.RESTAURANT:
        return normalNavigate(
            RestaurantPage(model: args.arguments! as RestaurantModel));

      default:
        return MaterialPageRoute(
          builder: (context) => NotFoundNavigationWidget(),
        );
    }
  }

  MaterialPageRoute normalNavigate(Widget widget) {
    return MaterialPageRoute(
      builder: (context) => widget,
    );
  }
}
