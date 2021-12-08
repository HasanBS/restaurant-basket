import 'dart:convert';
import 'dart:typed_data';

import 'package:dio/dio.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:restaurant_basket/view/basket/model/images_model.dart';

import 'iimage_service.dart';

class ImageService extends IImageService {
  ImageService() : super();
  @override
  Future<void> cacheImages(List<Images?> imgList) async {
    for (var i = 0; i < imgList.length; i++) {
      final response = await Dio().get(imgList[i]!.url!);

      final List<int> list = utf8.encode(response.data.toString());

      await DefaultCacheManager().putFile(
        imgList[i]!.url!.split('.jpg')[0],
        Uint8List.fromList(list),
        fileExtension: "jpg",
      );
    }
  }
}
