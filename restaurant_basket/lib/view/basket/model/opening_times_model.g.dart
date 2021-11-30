// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'opening_times_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OpeningTimes _$OpeningTimesFromJson(Map<String, dynamic> json) {
  return OpeningTimes(
    standardOpeningTimes: StandardOpeningTimes.fromJson(
        json['standardOpeningTimes'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$OpeningTimesToJson(OpeningTimes instance) =>
    <String, dynamic>{
      'standardOpeningTimes': instance.standardOpeningTimes.toJson(),
    };
