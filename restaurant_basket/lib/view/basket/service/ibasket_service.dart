import 'package:restaurant_basket/core/init/network/network_manager.dart';
import 'package:restaurant_basket/product/model/request/request_model.dart';
import 'package:restaurant_basket/view/basket/model/merchants_response_model.dart';

abstract class IBasketService {
  final NetworkManager manager;

  IBasketService(this.manager);

  Future<MerchantsResponseModel?> fetchRestaurantList(
      RequestModel requestModel);
  Future<MerchantsResponseModel?> fetchRestaurant(int id);
}
