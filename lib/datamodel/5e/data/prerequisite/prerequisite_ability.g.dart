// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'prerequisite_ability.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PrerequisiteAbility _$PrerequisiteAbilityFromJson(Map<String, dynamic> json) =>
    PrerequisiteAbility(
      strength: (json['str'] as num?)?.toInt(),
      dexterity: (json['dex'] as num?)?.toInt(),
      constitution: (json['con'] as num?)?.toInt(),
      intelligence: (json['int'] as num?)?.toInt(),
      wisdom: (json['wis'] as num?)?.toInt(),
      charisma: (json['cha'] as num?)?.toInt(),
    );

Map<String, dynamic> _$PrerequisiteAbilityToJson(
  PrerequisiteAbility instance,
) => <String, dynamic>{
  'str': instance.strength,
  'dex': instance.dexterity,
  'con': instance.constitution,
  'int': instance.intelligence,
  'wis': instance.wisdom,
  'cha': instance.charisma,
};
