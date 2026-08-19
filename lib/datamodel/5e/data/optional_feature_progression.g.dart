// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'optional_feature_progression.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OptionalFeatureProgression _$OptionalFeatureProgressionFromJson(
  Map<String, dynamic> json,
) => OptionalFeatureProgression(
  name: json['name'] as String,
  featureType: (json['featureType'] as List<dynamic>)
      .map((e) => e as String)
      .toList(),
  progression: json['progression'],
  required: (json['required'] as Map<String, dynamic>?)?.map(
    (k, e) =>
        MapEntry(k, (e as List<dynamic>).map((e) => e as String).toList()),
  ),
  classSource: json['classSource'] as String?,
);

Map<String, dynamic> _$OptionalFeatureProgressionToJson(
  OptionalFeatureProgression instance,
) => <String, dynamic>{
  'name': instance.name,
  'featureType': instance.featureType,
  'progression': instance.progression,
  'required': instance.required,
  'classSource': instance.classSource,
};
