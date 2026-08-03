// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'race_feature.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RaceFeature _$RaceFeatureFromJson(Map<String, dynamic> json) => RaceFeature(
  name: json['name'] as String,
  source: json['source'] as String,
  page: (json['page'] as num?)?.toInt(),
  otherSources: (json['otherSources'] as List<dynamic>?)
      ?.map((e) => BookSource.fromJson(e as Map<String, dynamic>))
      .toList(),
  srd: json['srd'],
  raceName: json['raceName'] as String,
  raceSource: json['raceSource'] as String,
  header: (json['header'] as num?)?.toInt() ?? 0,
  entries:
      (json['entries'] as List<dynamic>?)
          ?.map(FeatureEntry.fromJson)
          .toList() ??
      const [],
)..basicRules = json['basicRules'] as bool?;

Map<String, dynamic> _$RaceFeatureToJson(RaceFeature instance) =>
    <String, dynamic>{
      'source': instance.source,
      'page': instance.page,
      'otherSources': instance.otherSources?.map((e) => e.toJson()).toList(),
      'srd': instance.srd,
      'basicRules': instance.basicRules,
      'name': instance.name,
      'header': instance.header,
      'entries': instance.entries.map((e) => e.toJson()).toList(),
      'raceName': instance.raceName,
      'raceSource': instance.raceSource,
    };
