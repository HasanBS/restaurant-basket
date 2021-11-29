import 'package:json_annotation/json_annotation.dart';

part 'tags_model.g.dart';

@JsonSerializable()
class Tags {
  String id;
  String name;

  Tags({
    required this.id,
    required this.name,
  });

  factory Tags.fromJson(Map<String, dynamic> json) => _$TagsFromJson(json);

  Map<String, dynamic> toJson() => _$TagsToJson(this);
}
