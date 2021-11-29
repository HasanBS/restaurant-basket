import 'package:bloc/bloc.dart';

import '../../../core/constants/app/app_constants.dart';
import '../../../core/init/network/network_manager.dart';
import '../../../product/model/request/request_model.dart';
import '../model/restaurant_model.dart';
import '../service/basket_service.dart';
import '../service/ibasket_service.dart';

part 'basket_state.dart';

class BasketCubit extends Cubit<BasketState> {
  final RequestModel requestModel;
  late IBasketService _basketService;
  int _limit = 0;
  List<RestaurantModel> restaurantList = [];
  bool _isBasketLoading = false;

  BasketCubit(this.requestModel) : super(BasketInitial()) {
    _basketService =
        BasketService(NetworkManager.instance(requestModel.language));
  }

  Future<void> loadPage() async {
    //First Page Load
    try {
      emit(PageLoadInProgress());
      final response = await _basketService.fetchRestaurantList(requestModel);
      if (response != null) {
        restaurantList = response.merchants!;
        _limit = response.limit!;
      }
      emit(BasketLoaded(restaurantList: restaurantList));
    } catch (e) {
      emit(ErrorLoad(error: e.toString())); //load error on page
    }
  }

  Future<void> lazyLoad() async {
    //lazy load for if user reach the limit
    if (!_isBasketLoading) {
      _changeLoading();
      emit(LazyLoadInProgress());
      final lazyRequest = RequestModel(
          place: requestModel.place,
          language: requestModel.language,
          limit: AppConstants.LAZYLOADLIMIT,
          offset: _limit);
      final response = await _basketService.fetchRestaurantList(lazyRequest);
      if (response != null) {
        _limit += AppConstants.LAZYLOADLIMIT;
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
