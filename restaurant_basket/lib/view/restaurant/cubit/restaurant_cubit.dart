import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import '../../basket/model/images_model.dart';
import '../service/iimage_service.dart';

part 'restaurant_state.dart';

class RestaurantCubit extends Cubit<RestaurantState> {
  final List<Images?> imageList;
  final IImageService _imageService;
  RestaurantCubit(this.imageList, this._imageService)
      : super(RestaurantInitial()) {
    _imageService.cacheImages(imageList);
  }
}
