// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'day_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Day _$DayFromJson(Map<String, dynamic> json) {
  return Day(
    start: json['start'] as String,
    end: json['end'] as String,
  );
}

Map<String, dynamic> _$DayToJson(Day instance) => <String, dynamic>{
      'start': instance.start,
      'end': instance.end,
    };
