// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'race_age.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RaceAge _$RaceAgeFromJson(Map<String, dynamic> json) => RaceAge(
  max: (json['max'] as num).toInt(),
  mature: (json['mature'] as num?)?.toInt(),
);

Map<String, dynamic> _$RaceAgeToJson(RaceAge instance) => <String, dynamic>{
  'max': instance.max,
  'mature': instance.mature,
};
