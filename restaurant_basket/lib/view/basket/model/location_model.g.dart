// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'location_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Location _$LocationFromJson(Map<String, dynamic> json) {
  return Location(
    coordinates:
        Coordinates.fromJson(json['coordinates'] as Map<String, dynamic>),
    address: Address.fromJson(json['address'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$LocationToJson(Location instance) => <String, dynamic>{
      'coordinates': instance.coordinates.toJson(),
      'address': instance.address.toJson(),
    };
