import 'address_model.dart';
import 'coordinates_model.dart';

import 'package:json_annotation/json_annotation.dart';

part 'location_model.g.dart';

@JsonSerializable(explicitToJson: true)
class Location {
  Coordinates? coordinates;
  Address? address;

  Location({
    this.coordinates,
    this.address,
  });

  factory Location.fromJson(Map<String, dynamic> json) =>
      _$LocationFromJson(json);

  Map<String, dynamic> toJson() => _$LocationToJson(this);
}
