import 'package:restaurant_basket/view/basket/model/images_model.dart';

abstract class IImageService {
  Future<void> cacheImages(List<Images?> imgList);
}
