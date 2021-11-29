import 'package:json_annotation/json_annotation.dart';

import 'address_model.dart';
import 'coordinates_model.dart';

part 'location_model.g.dart';

@JsonSerializable(explicitToJson: true)
class Location {
  final Coordinates coordinates;
  final Address address;

  Location({
    required this.coordinates,
    required this.address,
  });

  factory Location.fromJson(Map<String, dynamic> json) =>
      _$LocationFromJson(json);

  Map<String, dynamic> toJson() => _$LocationToJson(this);
}
