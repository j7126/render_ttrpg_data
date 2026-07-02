// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'item_type.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ItemType _$ItemTypeFromJson(Map<String, dynamic> json) => ItemType(
  name: json['name'] as String,
  source: json['source'] as String,
  page: (json['page'] as num?)?.toInt(),
  otherSources: (json['otherSources'] as List<dynamic>?)
      ?.map((e) => BookSource.fromJson(e as Map<String, dynamic>))
      .toList(),
  srd: json['srd'],
  abbreviation: json['abbreviation'] as String?,
  entries:
      (json['entries'] as List<dynamic>?)
          ?.map(FeatureEntry.fromJson)
          .toList() ??
      const [],
)..basicRules = json['basicRules'] as bool?;

Map<String, dynamic> _$ItemTypeToJson(ItemType instance) => <String, dynamic>{
  'source': instance.source,
  'page': instance.page,
  'otherSources': instance.otherSources?.map((e) => e.toJson()).toList(),
  'srd': instance.srd,
  'basicRules': instance.basicRules,
  'name': instance.name,
  'abbreviation': instance.abbreviation,
  'entries': instance.entries.map((e) => e.toJson()).toList(),
};
