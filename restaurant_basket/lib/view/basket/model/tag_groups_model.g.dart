// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tag_groups_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TagGroups _$TagGroupsFromJson(Map<String, dynamic> json) {
  return TagGroups(
    type: json['type'] as String?,
    tags: (json['tags'] as List<dynamic>?)
        ?.map(
            (e) => e == null ? null : Tags.fromJson(e as Map<String, dynamic>))
        .toList(),
  );
}

Map<String, dynamic> _$TagGroupsToJson(TagGroups instance) => <String, dynamic>{
      'type': instance.type,
      'tags': instance.tags?.map((e) => e?.toJson()).toList(),
    };
