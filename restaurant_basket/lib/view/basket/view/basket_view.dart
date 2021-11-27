import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:restaurant_basket/core/extension/context_extension.dart';
import 'package:restaurant_basket/product/card/restaurant_card.dart';
import 'package:restaurant_basket/product/model/request/request_model.dart';
import 'package:restaurant_basket/view/basket/cubit/basket_cubit.dart';
import 'package:restaurant_basket/view/basket/model/restaurant_model.dart';

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
    return AppBar(
      leading: const BackButton(),
      title: AutoSizeText(requestModel.place),
    );
  }

  BlocConsumer _body(BuildContext context) {
    return BlocConsumer<BasketCubit, BasketState>(
      listener: (context, state) {
        _scrollController.addListener(
          () async {
            if (_scrollController.position.pixels >
                    (_scrollController.position.maxScrollExtent -
                        context.object6Height(_appBar) * 3) &&
                state is BasketLoaded) {
              await context.read<BasketCubit>().lazyLoad();
            }
          },
        );
      },
      builder: (context, state) {
        if (state is BasketLoaded || state is LazyLoadInProgress) {
          return ListView.builder(
              controller: _scrollController,
              itemExtent: context.bodyHeight(_appBar) / 6,
              itemCount: context.read<BasketCubit>().restaurantList.length,
              itemBuilder: (context, index) => _cardButton(
                  context, context.watch<BasketCubit>().restaurantList[index]));
        } else if (state is PageLoadInProgress) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else {
          return Container();
        }
      },
    );
  }

  ElevatedButton _cardButton(BuildContext context, RestaurantModel model) {
    return ElevatedButton(
      onPressed: () {},
      child: _restaurantCard(context, model),
    );
  }

  Card _restaurantCard(BuildContext context, RestaurantModel model) {
    return RestaurantCard(
      context,
      model: model,
      imgSize: context.bodyHeight(_appBar) / 6,
    );
  }
}
//imageUrl: model.images.isNotEmpty
      //     ? model.images.first!.url!
      //     : 'https://picsum.photos/250?image=9',
      // title: model.name,
      // price: model.tagGroups.first!.type!,
      // body: "Cafe\nBerlin",
      // rate: model.reviewScore,


      // if (index ==
      //               context.watch<BasketCubit>().restaurantList.length) {
      //             context.read<BasketCubit>().lazyLoad();
      //             return const CupertinoActivityIndicator();
      //           } else {