import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:restaurant_basket/core/constants/app/app_constants.dart';
import 'package:restaurant_basket/core/constants/app/city_constants.dart';
import 'package:restaurant_basket/core/init/network/network_manager.dart';
import 'package:restaurant_basket/product/model/request/request_model.dart';
import 'package:restaurant_basket/view/basket/cubit/basket_cubit.dart';
import 'package:restaurant_basket/view/basket/service/basket_service.dart';
import 'package:restaurant_basket/view/basket/service/ibasket_service.dart';

class MockNetworkManager extends Mock implements NetworkManager {}

class MockBasketService extends Mock implements BasketService {
  MockBasketService(NetworkManager networkManager);
}

class MockBasketCubit extends MockCubit<BasketState> implements BasketCubit {
  final IBasketService basketService;
  final RequestModel requestModel;
  MockBasketCubit({required this.requestModel, required this.basketService});
}

class MockRequestModel extends Mock implements RequestModel {}

void main() {
  late RequestModel requestModel;
  late BasketService basketService;
  late NetworkManager networkManager;
  late BasketCubit basketCubit;

  setUp(() {
    requestModel = RequestModel(
        place: CityConstants.instance.cities[0].cityText,
        language: "en_EN",
        limit: AppConstants.PAGELOADLIMIT,
        offset: AppConstants.STARTOFFSET);

    networkManager = NetworkManager.instance(null);
    basketService = MockBasketService(networkManager);
    //requestModel = MockRequestModel();
    basketCubit =
        BasketCubit(requestModel: requestModel, basketService: basketService);
  });

  group('Basket Cubit Test Operations2', () {
    test('mock test1', () {
      expect(basketCubit.state, isA<BasketInitial>());
      basketCubit.loadPage();
      expectLater(basketCubit.state, isA<ErrorLoad>());
    });

    test('mock test2', () {
      expect(basketCubit.state, isA<BasketInitial>());
      basketCubit.loadPage();
      expectLater(basketCubit.state, isA<BasketLoaded>());
    });
  });
  group('Basket Cubit Test Operations', () {
    blocTest<BasketCubit, BasketState>(
      'Basket Cubit Test Load Page',
      build: () =>
          BasketCubit(requestModel: requestModel, basketService: basketService),
      act: (cubit) => cubit.loadPage(),
      expect: () => [isA<PageLoadInProgress>(), isA<BasketLoaded>()],
    );

    blocTest<BasketCubit, BasketState>(
      'Basket Cubit Test Lazy Load',
      build: () =>
          BasketCubit(requestModel: requestModel, basketService: basketService),
      act: (cubit) => cubit.lazyLoad(),
      expect: () => [isA<LazyLoadInProgress>(), isA<BasketLoaded>()],
    );
  });
}
