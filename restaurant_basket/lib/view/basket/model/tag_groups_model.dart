import 'tags_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'tag_groups_model.g.dart';

@JsonSerializable(explicitToJson: true)
class TagGroups {
  String? type;
  List<Tags?>? tags;

  TagGroups({
    this.type,
    this.tags,
  });

  factory TagGroups.fromJson(Map<String, dynamic> json) =>
      _$TagGroupsFromJson(json);

  Map<String, dynamic> toJson() => _$TagGroupsToJson(this);
}
