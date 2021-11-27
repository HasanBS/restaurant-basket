import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:restaurant_basket/core/init/network/network_manager.dart';
import 'package:restaurant_basket/product/model/request/request_model.dart';
import 'package:restaurant_basket/view/basket/model/restaurant_model.dart';
import 'package:restaurant_basket/view/basket/service/basket_service.dart';
import 'package:restaurant_basket/view/basket/service/ibasket_service.dart';

part 'basket_state.dart';

class BasketCubit extends Cubit<BasketState> {
  final RequestModel requestModel;
  late IBasketService _basketService;
  int _limit = 0;
  List<RestaurantModel> restaurantList = [];
  bool _isBasketLoading = false;

  BasketCubit(this.requestModel) : super(BasketInitial()) {
    _basketService = BasketService(NetworkManager.instance);
  }

  Future<void> loadPage() async {
    emit(PageLoadInProgress());
    final response = await _basketService.fetchRestaurantList(requestModel);
    //restaurantList = response!.merchants ;
    if (response != null) {
      // restaurantList.addAll(response.merchants!);
      restaurantList = response.merchants!;
      _limit = response.limit!;
    }
    emit(BasketLoaded(restaurantList: restaurantList));
  }

  Future<void> lazyLoad() async {
    if (!_isBasketLoading) {
      _changeLoading();
      emit(LazyLoadInProgress());
      final lazyRequest = RequestModel(
          place: requestModel.place,
          language: requestModel.language,
          limit: 6,
          offset: _limit);
      final response = await _basketService.fetchRestaurantList(lazyRequest);
      if (response != null) {
        _limit += 6;
        restaurantList.addAll(response.merchants!);
      }
      _changeLoading();
      emit(BasketLoaded(restaurantList: restaurantList));
    }
  }

  void _changeLoading() {
    _isBasketLoading = !_isBasketLoading;
  }
}
