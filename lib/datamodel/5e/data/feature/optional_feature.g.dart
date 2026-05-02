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
    )..basicRules = json['basicRules'] as bool?;

Map<String, dynamic> _$OptionalFeatureToJson(OptionalFeature instance) =>
    <String, dynamic>{
      'name': instance.name,
      'source': instance.source,
      'page': instance.page,
      'otherSources': instance.otherSources?.map((e) => e.toJson()).toList(),
      'srd': instance.srd,
      'basicRules': instance.basicRules,
      'featureType': instance.featureType,
      'entries': instance.entries.map((e) => e.toJson()).toList(),
    };
