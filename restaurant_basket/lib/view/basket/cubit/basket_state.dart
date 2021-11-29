part of 'basket_cubit.dart';

abstract class BasketState {
  const BasketState();
}

class BasketInitial extends BasketState {}

class PageLoadInProgress extends BasketState {}

class LazyLoadInProgress extends BasketState {}

class ErrorLoad extends BasketState {
  final String error;

  const ErrorLoad({required this.error});
}

class BasketLoaded extends BasketState {
  final List<RestaurantModel> restaurantList;

  const BasketLoaded({required this.restaurantList});
}
