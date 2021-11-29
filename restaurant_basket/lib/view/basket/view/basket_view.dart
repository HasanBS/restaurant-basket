import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../core/components/text/auto_locale_text.dart';
import '../../../core/init/lang/locale_keys.g.dart';

import '../../../core/constants/app/app_constants.dart';
import '../../../core/constants/navigation/navigation_constants.dart';
import '../../../core/extension/context_extension.dart';
import '../../../core/init/navigation/navigation_service.dart';
import '../../../product/card/restaurant_card.dart';
import '../../../product/model/request/request_model.dart';
import '../cubit/basket_cubit.dart';
import '../model/restaurant_model.dart';

class BasketView extends StatelessWidget {
  final RequestModel requestModel;
  final ScrollController _scrollController = ScrollController();
  BasketView({Key? key, required this.requestModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (_) => BasketCubit(requestModel)..loadPage(),
        child: Scaffold(
          appBar: _appBar,
          body: _body(context),
        ));
  }

  AppBar get _appBar {
    return AppBar(title: AutoSizeText(requestModel.place));
  }

  BlocConsumer _body(BuildContext context) {
    return BlocConsumer<BasketCubit, BasketState>(
      listener: (context, state) {
        _scrollController.addListener(
          //Listiner for activate lazy load
          () async {
            if (_scrollController.position.pixels >
                    (_scrollController.position.maxScrollExtent -
                        context.object6Height(_appBar) *
                            AppConstants.LAZYLOADBEFORE) &&
                state is BasketLoaded) {
              await context.read<BasketCubit>().lazyLoad();
            }
          },
        );
      },
      builder: (context, state) {
        if (state is PageLoadInProgress) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (state is ErrorLoad) {
          return const Scaffold(
            body: Center(
              child: AutoLocaleText(value: LocaleKeys.loadError),
            ),
          );
        } else {
          return ListView.builder(
              controller: _scrollController,
              itemExtent:
                  context.bodyHeight(_appBar) / AppConstants.ELEMENTINPAGE,
              itemCount: context.read<BasketCubit>().restaurantList.length,
              itemBuilder: (context, index) => _cardButton(
                  context, context.watch<BasketCubit>().restaurantList[index]));
        }
      },
    );
  }

  ElevatedButton _cardButton(BuildContext context, RestaurantModel model) {
    return ElevatedButton(
      onPressed: () {
        NavigationService.instance
            .navigateToPage(path: NavigationConstants.RESTAURANT, data: model);
      },
      child: _restaurantCard(context, model),
    );
  }

  Card _restaurantCard(BuildContext context, RestaurantModel model) {
    return RestaurantCard(
      context,
      model: model,
      imgSize: context.bodyHeight(_appBar) / AppConstants.ELEMENTINPAGE,
    );
  }
}
