part of 'basket_cubit.dart';

abstract class BasketState extends Equatable {
  const BasketState();

  @override
  List<Object> get props => [];
}

class BasketInitial extends BasketState {}

class PageLoadInProgress extends BasketState {}

class LazyLoadInProgress extends BasketState {}

class BasketLoaded extends BasketState {
  final List<RestaurantModel> restaurantList;

  const BasketLoaded({required this.restaurantList});
}
