// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'optional_feature.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OptionalFeature _$OptionalFeatureFromJson(Map<String, dynamic> json) =>
    OptionalFeature(
        name: json['name'] as String,
        source: json['source'] as String,
        page: (json['page'] as num?)?.toInt(),
        otherSources: (json['otherSources'] as List<dynamic>?)
            ?.map((e) => BookSource.fromJson(e as Map<String, dynamic>))
            .toList(),
        srd: json['srd'],
        featureType: (json['featureType'] as List<dynamic>)
            .map((e) => e as String)
            .toList(),
        entries:
            (json['entries'] as List<dynamic>?)
                ?.map(FeatureEntry.fromJson)
                .toList() ??
            const [],
      )
      ..basicRules = json['basicRules'] as bool?
      ..skillProficiencies = (json['skillProficiencies'] as List<dynamic>?)
          ?.map(SkillProficiency.fromJson)
          .toList()
      ..additionalSpells = (json['additionalSpells'] as List<dynamic>?)
          ?.map((e) => e as Map<String, dynamic>)
          .toList();

Map<String, dynamic> _$OptionalFeatureToJson(OptionalFeature instance) =>
    <String, dynamic>{
      'source': instance.source,
      'page': instance.page,
      'otherSources': instance.otherSources?.map((e) => e.toJson()).toList(),
      'srd': instance.srd,
      'basicRules': instance.basicRules,
      'name': instance.name,
      'skillProficiencies': instance.skillProficiencies
          ?.map((e) => e.toJson())
          .toList(),
      'additionalSpells': instance.additionalSpells,
      'featureType': instance.featureType,
      'entries': instance.entries.map((e) => e.toJson()).toList(),
    };
