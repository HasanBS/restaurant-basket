// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'standard_opening_times_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

StandardOpeningTimes _$StandardOpeningTimesFromJson(Map<String, dynamic> json) {
  return StandardOpeningTimes(
    WEDNESDAY: (json['WEDNESDAY'] as List<dynamic>?)
        ?.map((e) => Day.fromJson(e as Map<String, dynamic>))
        .toList(),
    MONDAY: (json['MONDAY'] as List<dynamic>?)
        ?.map((e) => Day.fromJson(e as Map<String, dynamic>))
        .toList(),
    THURSDAY: (json['THURSDAY'] as List<dynamic>?)
        ?.map((e) => Day.fromJson(e as Map<String, dynamic>))
        .toList(),
    SUNDAY: (json['SUNDAY'] as List<dynamic>?)
        ?.map((e) => Day.fromJson(e as Map<String, dynamic>))
        .toList(),
    FRIDAY: (json['FRIDAY'] as List<dynamic>?)
        ?.map((e) => Day.fromJson(e as Map<String, dynamic>))
        .toList(),
    SATURDAY: (json['SATURDAY'] as List<dynamic>?)
        ?.map((e) => Day.fromJson(e as Map<String, dynamic>))
        .toList(),
  );
}

Map<String, dynamic> _$StandardOpeningTimesToJson(
        StandardOpeningTimes instance) =>
    <String, dynamic>{
      'WEDNESDAY': instance.WEDNESDAY?.map((e) => e.toJson()).toList(),
      'MONDAY': instance.MONDAY?.map((e) => e.toJson()).toList(),
      'THURSDAY': instance.THURSDAY?.map((e) => e.toJson()).toList(),
      'SUNDAY': instance.SUNDAY?.map((e) => e.toJson()).toList(),
      'FRIDAY': instance.FRIDAY?.map((e) => e.toJson()).toList(),
      'SATURDAY': instance.SATURDAY?.map((e) => e.toJson()).toList(),
    };
