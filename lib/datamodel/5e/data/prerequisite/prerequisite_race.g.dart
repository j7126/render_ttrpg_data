// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'prerequisite_race.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PrerequisiteRace _$PrerequisiteRaceFromJson(Map<String, dynamic> json) =>
    PrerequisiteRace(
      name: json['name'] as String,
      subrace: json['subrace'] as String?,
      displayEntry: json['displayEntry'] as String?,
    );

Map<String, dynamic> _$PrerequisiteRaceToJson(PrerequisiteRace instance) =>
    <String, dynamic>{
      'name': instance.name,
      'subrace': instance.subrace,
      'displayEntry': instance.displayEntry,
    };
