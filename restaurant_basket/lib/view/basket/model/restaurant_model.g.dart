// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'restaurant_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RestaurantModel _$RestaurantModelFromJson(Map<String, dynamic> json) {
  return RestaurantModel(
    id: json['id'] as int,
    name: json['name'] as String,
    phoneNumber: json['phoneNumber'] as String,
    timezone: json['timezone'] as String,
    location: Location.fromJson(json['location'] as Map<String, dynamic>),
    reviewScore: json['reviewScore'] as String,
    openingTimes:
        OpeningTimes.fromJson(json['openingTimes'] as Map<String, dynamic>),
    tagGroups: (json['tagGroups'] as List<dynamic>)
        .map((e) =>
            e == null ? null : TagGroups.fromJson(e as Map<String, dynamic>))
        .toList(),
    images: (json['images'] as List<dynamic>)
        .map((e) =>
            e == null ? null : Images.fromJson(e as Map<String, dynamic>))
        .toList(),
    currency: json['currency'] as String?,
  );
}

Map<String, dynamic> _$RestaurantModelToJson(RestaurantModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'phoneNumber': instance.phoneNumber,
      'timezone': instance.timezone,
      'location': instance.location.toJson(),
      'reviewScore': instance.reviewScore,
      'openingTimes': instance.openingTimes.toJson(),
      'tagGroups': instance.tagGroups.map((e) => e?.toJson()).toList(),
      'images': instance.images.map((e) => e?.toJson()).toList(),
      'currency': instance.currency,
    };
