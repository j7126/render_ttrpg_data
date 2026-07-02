// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'item_group.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ItemGroup _$ItemGroupFromJson(Map<String, dynamic> json) => ItemGroup(
  name: json['name'] as String,
  source: json['source'] as String,
  page: (json['page'] as num?)?.toInt(),
  otherSources: (json['otherSources'] as List<dynamic>?)
      ?.map((e) => BookSource.fromJson(e as Map<String, dynamic>))
      .toList(),
  srd: json['srd'],
  basicRules: json['basicRules'] as bool?,
  type: json['type'] as String?,
  rarity: json['rarity'] as String?,
  items: (json['items'] as List<dynamic>).map((e) => e as String).toList(),
);

Map<String, dynamic> _$ItemGroupToJson(ItemGroup instance) => <String, dynamic>{
  'source': instance.source,
  'page': instance.page,
  'otherSources': instance.otherSources?.map((e) => e.toJson()).toList(),
  'srd': instance.srd,
  'basicRules': instance.basicRules,
  'name': instance.name,
  'type': instance.type,
  'itemType': instance.itemType?.toJson(),
  'rarity': instance.rarity,
  'items': instance.items,
};
