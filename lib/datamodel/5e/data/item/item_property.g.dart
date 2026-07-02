// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'item_property.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ItemProperty _$ItemPropertyFromJson(Map<String, dynamic> json) => ItemProperty(
  source: json['source'] as String,
  page: (json['page'] as num?)?.toInt(),
  otherSources: (json['otherSources'] as List<dynamic>?)
      ?.map((e) => BookSource.fromJson(e as Map<String, dynamic>))
      .toList(),
  srd: json['srd'],
  abbreviation: json['abbreviation'] as String?,
  template: json['template'] as String?,
  entries:
      (json['entries'] as List<dynamic>?)
          ?.map(FeatureEntry.fromJson)
          .toList() ??
      const [],
)..basicRules = json['basicRules'] as bool?;

Map<String, dynamic> _$ItemPropertyToJson(ItemProperty instance) =>
    <String, dynamic>{
      'source': instance.source,
      'page': instance.page,
      'otherSources': instance.otherSources?.map((e) => e.toJson()).toList(),
      'srd': instance.srd,
      'basicRules': instance.basicRules,
      'abbreviation': instance.abbreviation,
      'template': instance.template,
      'entries': instance.entries.map((e) => e.toJson()).toList(),
    };
