import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import '../../basket/model/images_model.dart';

abstract class IImageService {
  final DefaultCacheManager cacheManager;

  IImageService(this.cacheManager);
  Future<void> cacheImages(List<Images?> imgList);
}
