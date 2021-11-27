// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'merchants_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MerchantsResponseModel _$MerchantsResponseModelFromJson(
    Map<String, dynamic> json) {
  return MerchantsResponseModel(
    merchants: (json['merchants'] as List<dynamic>?)
        ?.map((e) => RestaurantModel.fromJson(e as Map<String, dynamic>))
        .toList(),
    size: json['size'] as int?,
    offset: json['offset'] as int?,
    limit: json['limit'] as int?,
  );
}

Map<String, dynamic> _$MerchantsResponseModelToJson(
        MerchantsResponseModel instance) =>
    <String, dynamic>{
      'merchants': instance.merchants?.map((e) => e.toJson()).toList(),
      'size': instance.size,
      'offset': instance.offset,
      'limit': instance.limit,
    };
