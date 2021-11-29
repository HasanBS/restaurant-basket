import '../../../core/constants/enum/http_request_enum.dart';
import '../../../core/init/network/network_manager.dart';
import '../../../product/enum/network_route_enum.dart';
import '../../../product/model/request/request_enum.dart';
import '../../../product/model/request/request_model.dart';
import '../model/merchants_response_model.dart';
import 'ibasket_service.dart';

class BasketService extends IBasketService {
  BasketService(NetworkManager manager) : super(manager);

//Not using fetch with ID
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
      },
    );

    return response.data;
  }
}
