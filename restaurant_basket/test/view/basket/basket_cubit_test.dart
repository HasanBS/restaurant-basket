import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:restaurant_basket/core/constants/app/app_constants.dart';
import 'package:restaurant_basket/core/constants/app/city_constants.dart';
import 'package:restaurant_basket/product/model/request/request_model.dart';
import 'package:restaurant_basket/view/basket/cubit/basket_cubit.dart';

class MockBasketCubit extends MockCubit<BasketState> implements BasketCubit {}

void main() {
  late RequestModel requestModel;
  setUp(() {
    requestModel = RequestModel(
        place: CityConstants.instance.cities[0].cityText,
        language: "en_EN",
        limit: AppConstants.PAGELOADLIMIT,
        offset: AppConstants.STARTOFFSET);
  });

  group('Basket Cubit Test Operations', () {
    blocTest<BasketCubit, BasketState>(
      'Basket Cubit Test Load Page',
      build: () => BasketCubit(requestModel),
      act: (cubit) => cubit.loadPage(),
      expect: () => [isA<PageLoadInProgress>(), isA<BasketLoaded>()],
    );

    blocTest<BasketCubit, BasketState>(
      'Basket Cubit Test Lazy Load',
      build: () => BasketCubit(requestModel),
      act: (cubit) => cubit.lazyLoad(),
      expect: () => [isA<LazyLoadInProgress>(), isA<BasketLoaded>()],
    );
  });
}
