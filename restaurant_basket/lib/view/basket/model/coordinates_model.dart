import 'package:json_annotation/json_annotation.dart';

part 'coordinates_model.g.dart';

@JsonSerializable()
class Coordinates {
  double? latitude;
  double? longitude;

  Coordinates({
    this.latitude,
    this.longitude,
  });

  factory Coordinates.fromJson(Map<String, dynamic> json) =>
      _$CoordinatesFromJson(json);

  Map<String, dynamic> toJson() => _$CoordinatesToJson(this);
}
