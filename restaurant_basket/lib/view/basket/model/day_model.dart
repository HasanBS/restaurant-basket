import 'package:json_annotation/json_annotation.dart';

part 'day_model.g.dart';

@JsonSerializable()
class Day {
  String? start;
  String? end;

  Day({
    this.start,
    this.end,
  });

  factory Day.fromJson(Map<String, dynamic> json) => _$DayFromJson(json);

  Map<String, dynamic> toJson() => _$DayToJson(this);
}
