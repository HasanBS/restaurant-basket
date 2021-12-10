import 'package:bloc/bloc.dart';
import '../../../core/constants/app/app_constants.dart';
import '../../../product/model/request/request_model.dart';
import '../model/restaurant_model.dart';
import '../service/ibasket_service.dart';

part 'basket_state.dart';

class BasketCubit extends Cubit<BasketState> {
  final RequestModel requestModel;
  final IBasketService basketService;
  final List<RestaurantModel> restaurantList = [];
  bool _isBasketLoading = false;
  int _limit = 0;

  BasketCubit({required this.requestModel, required this.basketService})
      : super(BasketInitial());

  Future<void> loadPage() async {
    //First Page Load
    try {
      emit(PageLoadInProgress());
      final response = await basketService.fetchRestaurantList(requestModel);
      if (response != null) {
        restaurantList.addAll(response.merchants!);
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
      try {
        _changeLoading();
        emit(LazyLoadInProgress());
        final lazyRequest = RequestModel(
            place: requestModel.place,
            language: requestModel.language,
            limit: AppConstants.LAZYLOADLIMIT,
            offset: _limit);
        final response = await basketService.fetchRestaurantList(lazyRequest);
        if (response != null) {
          _limit += AppConstants.LAZYLOADLIMIT;
          restaurantList.addAll(response.merchants!);
        }
        _changeLoading();
        emit(BasketLoaded(restaurantList: restaurantList));
      } catch (e) {
        emit(ErrorLoad(error: e.toString())); //load error on lazy load
      }
    }
  }

  void _changeLoading() {
    _isBasketLoading = !_isBasketLoading;
  }
}
