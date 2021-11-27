import 'images_model.dart';
import 'location_model.dart';
import 'opening_times_model.dart';
import 'tag_groups_model.dart';

import 'package:json_annotation/json_annotation.dart';

part 'restaurant_model.g.dart';

@JsonSerializable(explicitToJson: true)
class RestaurantModel {
  final int id;
  final String name;
  final String phoneNumber;
  final String currency;
  final String locale;
  final String timezone;
  final Location location;
  final String reviewScore;
  final List<TagGroups?> tagGroups;
  final List<Images?> images;
  final bool bookable;
  final OpeningTimes openingTimes;
  //List<Null> documents;
  //List<Links> links;
  //bool ccvEnabled;

  RestaurantModel({
    required this.id,
    required this.name,
    required this.phoneNumber,
    required this.currency,
    required this.locale,
    required this.timezone,
    required this.location,
    required this.reviewScore,
    required this.tagGroups,
    required this.images,
    required this.bookable,
    required this.openingTimes,
    // this.ccvEnabled,
    // this.documents,
    // this.links,
  });

  factory RestaurantModel.fromJson(Map<String, dynamic> json) =>
      _$RestaurantModelFromJson(json);

  Map<String, dynamic> toJson() => _$RestaurantModelToJson(this);
}
