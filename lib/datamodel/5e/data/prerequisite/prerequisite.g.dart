// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'prerequisite.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Prerequisite _$PrerequisiteFromJson(Map<String, dynamic> json) => Prerequisite(
  note: json['note'] as String?,
  other: json['other'] as String?,
  level: json['level'] == null
      ? null
      : PrerequisiteLevel.fromJson(json['level']),
  spellcastingFeature: json['spellcastingFeature'] as bool?,
  spellcasting2020: json['spellcasting2020'] as bool?,
  spellcasting: json['spellcasting'] as bool?,
  campaign:
      (json['campaign'] as List<dynamic>?)?.map((e) => e as String).toList() ??
      const [],
  race:
      (json['race'] as List<dynamic>?)
          ?.map((e) => PrerequisiteRace.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const [],
  feat:
      (json['feat'] as List<dynamic>?)?.map((e) => e as String).toList() ??
      const [],
  ability:
      (json['ability'] as List<dynamic>?)
          ?.map((e) => PrerequisiteAbility.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const [],
  proficiency:
      (json['proficiency'] as List<dynamic>?)
          ?.map(
            (e) => PrerequisiteProficiency.fromJson(e as Map<String, dynamic>),
          )
          .toList() ??
      const [],
  background:
      (json['background'] as List<dynamic>?)
          ?.map(
            (e) => PrerequisiteBackground.fromJson(e as Map<String, dynamic>),
          )
          .toList() ??
      const [],
  spell:
      (json['spell'] as List<dynamic>?)?.map((e) => e as String).toList() ??
      const [],
  item:
      (json['item'] as List<dynamic>?)?.map((e) => e as String).toList() ??
      const [],
  pact: json['pact'] as String?,
);

Map<String, dynamic> _$PrerequisiteToJson(Prerequisite instance) =>
    <String, dynamic>{
      'note': instance.note,
      'other': instance.other,
      'level': instance.level?.toJson(),
      'spellcastingFeature': instance.spellcastingFeature,
      'spellcasting2020': instance.spellcasting2020,
      'spellcasting': instance.spellcasting,
      'campaign': instance.campaign,
      'race': instance.race.map((e) => e.toJson()).toList(),
      'feat': instance.feat,
      'ability': instance.ability.map((e) => e.toJson()).toList(),
      'proficiency': instance.proficiency.map((e) => e.toJson()).toList(),
      'background': instance.background.map((e) => e.toJson()).toList(),
      'spell': instance.spell,
      'item': instance.item,
      'pact': instance.pact,
    };
