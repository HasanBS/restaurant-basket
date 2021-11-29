import 'package:json_annotation/json_annotation.dart';

part 'day_model.g.dart';

@JsonSerializable()
class Day {
  final String start;
  final String end;

  Day({
    required this.start,
    required this.end,
  });

  factory Day.fromJson(Map<String, dynamic> json) => _$DayFromJson(json);

  Map<String, dynamic> toJson() => _$DayToJson(this);
}
