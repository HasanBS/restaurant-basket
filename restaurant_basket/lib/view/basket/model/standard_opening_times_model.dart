import 'package:restaurant_basket/view/basket/model/day_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'standard_opening_times_model.g.dart';

@JsonSerializable(explicitToJson: true)
class StandardOpeningTimes {
  List<Day>? WEDNESDAY;
  List<Day>? MONDAY;
  List<Day>? THURSDAY;
  List<Day>? SUNDAY;
  List<Day>? FRIDAY;
  List<Day>? SATURDAY;

  StandardOpeningTimes({
    this.WEDNESDAY,
    this.MONDAY,
    this.THURSDAY,
    this.SUNDAY,
    this.FRIDAY,
    this.SATURDAY,
  });

  factory StandardOpeningTimes.fromJson(Map<String, dynamic> json) =>
      _$StandardOpeningTimesFromJson(json);

  Map<String, dynamic> toJson() => _$StandardOpeningTimesToJson(this);
}
