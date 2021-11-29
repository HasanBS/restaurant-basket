import 'package:json_annotation/json_annotation.dart';

import 'standard_opening_times_model.dart';

part 'opening_times_model.g.dart';

@JsonSerializable(explicitToJson: true)
class OpeningTimes {
  StandardOpeningTimes? standardOpeningTimes;

  OpeningTimes({this.standardOpeningTimes});

  factory OpeningTimes.fromJson(Map<String, dynamic> json) =>
      _$OpeningTimesFromJson(json);

  Map<String, dynamic> toJson() => _$OpeningTimesToJson(this);
}
