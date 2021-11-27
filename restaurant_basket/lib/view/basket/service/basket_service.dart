import 'package:restaurant_basket/core/constants/enum/http_request_enum.dart';
import 'package:restaurant_basket/core/init/network/network_manager.dart';
import 'package:restaurant_basket/product/enum/network_route_enum.dart';
import 'package:restaurant_basket/product/model/request/request_enum.dart';
import 'package:restaurant_basket/product/model/request/request_model.dart';
import 'package:restaurant_basket/view/basket/model/merchants_response_model.dart';
import 'package:restaurant_basket/view/basket/service/ibasket_service.dart';

class BasketService extends IBasketService {
  BasketService(NetworkManager manager) : super(manager);

  @override
  Future<MerchantsResponseModel?> fetchRestaurant(int id) async {
    final response = await manager.coreDio
        .send<MerchantsResponseModel, MerchantsResponseModel>(
            NetworkRoutes.MERCHANTS.stringValue,
            parseModel: MerchantsResponseModel(),
            type: HttpTypes.GET,
            queryParameters: {'id': id});

    return response.data;
  }

  @override
  Future<MerchantsResponseModel?> fetchRestaurantList(
      RequestModel requestModel) async {
    final response = await manager.coreDio
        .send<MerchantsResponseModel, MerchantsResponseModel>(
      NetworkRoutes.MERCHANTS.stringValue,
      type: HttpTypes.GET,
      parseModel: MerchantsResponseModel(),
      queryParameters: {
        RequestEnum.LIMIT.stringValue: requestModel.limit,
        RequestEnum.OFFSET.stringValue: requestModel.offset,
        RequestEnum.PLACE.stringValue: requestModel.place,
        RequestEnum.LANGUAGE.stringValue: requestModel.language,
      },
    );

    return response.data;
  }
}
