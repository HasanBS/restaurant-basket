import '../../../core/init/network/network_manager.dart';
import '../../../product/model/request/request_model.dart';
import '../model/merchants_response_model.dart';

abstract class IBasketService {
  final NetworkManager manager;

  IBasketService(this.manager);

  Future<MerchantsResponseModel?> fetchRestaurantList(
      RequestModel requestModel);
}
