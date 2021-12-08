import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:restaurant_basket/view/basket/model/images_model.dart';
import 'package:restaurant_basket/view/restaurant/service/iimage_service.dart';
import 'package:restaurant_basket/view/restaurant/service/image_service.dart';

part 'restaurant_state.dart';

class RestaurantCubit extends Cubit<RestaurantState> {
  final List<Images?> imageList;
  late IImageService _imageService;
  RestaurantCubit(this.imageList) : super(RestaurantInitial()) {
    _imageService = ImageService();
    _imageService.cacheImages(imageList);
  }
}
