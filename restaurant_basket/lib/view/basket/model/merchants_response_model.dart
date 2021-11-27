import 'package:restaurant_basket/core/base/model/ibase_model.dart';
import 'package:restaurant_basket/view/basket/model/restaurant_model.dart';

import 'package:json_annotation/json_annotation.dart';

part 'merchants_response_model.g.dart';

@JsonSerializable(explicitToJson: true)
class MerchantsResponseModel extends IBaseModel<MerchantsResponseModel> {
  List<RestaurantModel>? merchants;
  int? size;
  int? offset;
  int? limit;

  MerchantsResponseModel({
    this.merchants,
    this.size,
    this.offset,
    this.limit,
  });

  factory MerchantsResponseModel.fromJson(Map<String, dynamic> json) =>
      _$MerchantsResponseModelFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$MerchantsResponseModelToJson(this);

  @override
  MerchantsResponseModel fromJson(Map<String, dynamic> json) {
    return _$MerchantsResponseModelFromJson(json);
  }
}
