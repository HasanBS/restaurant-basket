import 'package:json_annotation/json_annotation.dart';

import 'images_model.dart';
import 'location_model.dart';
import 'opening_times_model.dart';
import 'tag_groups_model.dart';

part 'restaurant_model.g.dart';

@JsonSerializable(explicitToJson: true)
class RestaurantModel {
  final int id;
  final String name;
  final String phoneNumber;
  final String timezone;
  final Location location;
  final String reviewScore;
  final OpeningTimes openingTimes;
  final List<TagGroups?> tagGroups; //?
  final List<Images?> images; //?
  String? currency;

  RestaurantModel({
    required this.id,
    required this.name,
    required this.phoneNumber,
    required this.timezone,
    required this.location,
    required this.reviewScore,
    required this.openingTimes,
    required this.tagGroups,
    required this.images,
    this.currency,
  });

  factory RestaurantModel.fromJson(Map<String, dynamic> json) =>
      _$RestaurantModelFromJson(json);

  Map<String, dynamic> toJson() => _$RestaurantModelToJson(this);
}
