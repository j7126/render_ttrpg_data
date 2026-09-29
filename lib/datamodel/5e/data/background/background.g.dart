// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'background.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Background _$BackgroundFromJson(Map<String, dynamic> json) =>
    Background(
        name: json['name'] as String,
        source: json['source'] as String,
        page: (json['page'] as num?)?.toInt(),
        otherSources: (json['otherSources'] as List<dynamic>?)
            ?.map((e) => BookSource.fromJson(e as Map<String, dynamic>))
            .toList(),
        srd: json['srd'],
        entries:
            (json['entries'] as List<dynamic>?)
                ?.map(FeatureEntry.fromJson)
                .toList() ??
            const [],
      )
      ..basicRules = json['basicRules'] as bool?
      ..skillProficiencies = (json['skillProficiencies'] as List<dynamic>?)
          ?.map(SkillProficiency.fromJson)
          .toList();

Map<String, dynamic> _$BackgroundToJson(Background instance) =>
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
      'entries': instance.entries.map((e) => e.toJson()).toList(),
    };
