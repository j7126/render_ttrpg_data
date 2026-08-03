// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'spell.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Spell _$SpellFromJson(Map<String, dynamic> json) => Spell(
  name: json['name'] as String,
  source: json['source'] as String,
  page: (json['page'] as num?)?.toInt(),
  otherSources: (json['otherSources'] as List<dynamic>?)
      ?.map((e) => BookSource.fromJson(e as Map<String, dynamic>))
      .toList(),
  srd: json['srd'],
  level: (json['level'] as num).toInt(),
  school: $enumDecode(_$SpellSchoolEnumMap, json['school']),
  time: (json['time'] as List<dynamic>)
      .map((e) => CastingTime.fromJson(e as Map<String, dynamic>))
      .toList(),
  range: SpellRange.fromJson(json['range'] as Map<String, dynamic>),
  duration: (json['duration'] as List<dynamic>)
      .map((e) => SpellDuration.fromJson(e as Map<String, dynamic>))
      .toList(),
  entries:
      (json['entries'] as List<dynamic>?)
          ?.map(FeatureEntry.fromJson)
          .toList() ??
      const [],
  entriesHigherLevel:
      (json['entriesHigherLevel'] as List<dynamic>?)
          ?.map(FeatureEntry.fromJson)
          .toList() ??
      const [],
  spellClassSource: json['spellClassSource'] == null
      ? null
      : SpellSource.fromJson(json['spellClassSource'] as Map<String, dynamic>),
)..basicRules = json['basicRules'] as bool?;

Map<String, dynamic> _$SpellToJson(Spell instance) => <String, dynamic>{
  'source': instance.source,
  'page': instance.page,
  'otherSources': instance.otherSources?.map((e) => e.toJson()).toList(),
  'srd': instance.srd,
  'basicRules': instance.basicRules,
  'name': instance.name,
  'level': instance.level,
  'school': _$SpellSchoolEnumMap[instance.school]!,
  'time': instance.time.map((e) => e.toJson()).toList(),
  'range': instance.range.toJson(),
  'duration': instance.duration.map((e) => e.toJson()).toList(),
  'entries': instance.entries.map((e) => e.toJson()).toList(),
  'entriesHigherLevel': instance.entriesHigherLevel
      .map((e) => e.toJson())
      .toList(),
  'spellClassSource': instance.spellClassSource?.toJson(),
};

const _$SpellSchoolEnumMap = {
  SpellSchool.A: 'A',
  SpellSchool.C: 'C',
  SpellSchool.D: 'D',
  SpellSchool.E: 'E',
  SpellSchool.V: 'V',
  SpellSchool.I: 'I',
  SpellSchool.N: 'N',
  SpellSchool.T: 'T',
};
