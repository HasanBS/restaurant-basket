import 'package:json_annotation/json_annotation.dart';

part 'address_model.g.dart';

@JsonSerializable()
class Address {
  String? street;
  String? number;
  String? zipcode;
  String? city;
  String? country;
  String? district;

  Address({
    this.street,
    this.number,
    this.zipcode,
    this.city,
    this.country,
    this.district,
  });

  factory Address.fromJson(Map<String, dynamic> json) =>
      _$AddressFromJson(json);

  Map<String, dynamic> toJson() => _$AddressToJson(this);
}
