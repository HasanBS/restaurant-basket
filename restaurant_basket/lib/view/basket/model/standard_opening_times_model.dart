import 'package:json_annotation/json_annotation.dart';

import 'day_model.dart';

part 'standard_opening_times_model.g.dart';

// ignore_for_file: non_constant_identifier_names
//Because this is how on response model
@JsonSerializable(explicitToJson: true)
class StandardOpeningTimes {
  List<Day>? WEDNESDAY;
  List<Day>? MONDAY;
  List<Day>? THURSDAY;
  List<Day>? TUESDAY;
  List<Day>? SUNDAY;
  List<Day>? FRIDAY;
  List<Day>? SATURDAY;

  StandardOpeningTimes({
    this.WEDNESDAY,
    this.MONDAY,
    this.THURSDAY,
    this.TUESDAY,
    this.SUNDAY,
    this.FRIDAY,
    this.SATURDAY,
  });

  factory StandardOpeningTimes.fromJson(Map<String, dynamic> json) =>
      _$StandardOpeningTimesFromJson(json);

  Map<String, dynamic> toJson() => _$StandardOpeningTimesToJson(this);
}
