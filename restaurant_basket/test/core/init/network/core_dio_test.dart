import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:restaurant_basket/core/constants/app/app_constants.dart';
import 'package:restaurant_basket/core/constants/enum/http_request_enum.dart';
import 'package:restaurant_basket/core/init/network/core_dio.dart';
import 'package:restaurant_basket/core/init/network/icore_dio.dart';
import 'package:restaurant_basket/product/enum/network_route_enum.dart';
import 'package:restaurant_basket/product/model/request/request_enum.dart';
import 'package:restaurant_basket/view/basket/model/merchants_response_model.dart';
import 'package:restaurant_basket/view/basket/model/restaurant_model.dart';

void main() {
  late ICoreDio service;
  setUp(() {
    service = CoreDio(BaseOptions(baseUrl: AppConstants.API_URL));
  });

  group("CoreDio Fetch Tests", () {
    test('Response isList', () async {
      final data =
          await service.send<MerchantsResponseModel, MerchantsResponseModel>(
        NetworkRoutes.MERCHANTS.stringValue,
        type: HttpTypes.GET,
        parseModel: MerchantsResponseModel(),
        queryParameters: {
          RequestEnum.LIMIT.stringValue: 120,
          RequestEnum.OFFSET.stringValue: 0,
          RequestEnum.PLACE.stringValue: 'rome',
        },
      );

      expect(data.data!.merchants, isList);
    });
    test('Response Data is Restaurant Model', () async {
      final data =
          await service.send<MerchantsResponseModel, MerchantsResponseModel>(
        NetworkRoutes.MERCHANTS.stringValue,
        type: HttpTypes.GET,
        parseModel: MerchantsResponseModel(),
        queryParameters: {
          RequestEnum.LIMIT.stringValue: 1,
          RequestEnum.OFFSET.stringValue: 0,
          RequestEnum.PLACE.stringValue: 'rome',
        },
      );

      expect(data.data!.merchants!.first, isA<RestaurantModel>());
    });
  });
}
