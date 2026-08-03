// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'race_ability.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RaceAbility _$RaceAbilityFromJson(Map<String, dynamic> json) => RaceAbility(
  strength: (json['strength'] as num?)?.toInt(),
  dexterity: (json['dexterity'] as num?)?.toInt(),
  constitution: (json['constitution'] as num?)?.toInt(),
  intelligence: (json['intelligence'] as num?)?.toInt(),
  wisdom: (json['wisdom'] as num?)?.toInt(),
  charisma: (json['charisma'] as num?)?.toInt(),
  choose: json['choose'] == null
      ? null
      : RaceAbilityChoose.fromJson(json['choose'] as Map<String, dynamic>),
);

Map<String, dynamic> _$RaceAbilityToJson(RaceAbility instance) =>
    <String, dynamic>{
      'strength': instance.strength,
      'dexterity': instance.dexterity,
      'constitution': instance.constitution,
      'intelligence': instance.intelligence,
      'wisdom': instance.wisdom,
      'charisma': instance.charisma,
      'choose': instance.choose?.toJson(),
    };

RaceAbilityChoose _$RaceAbilityChooseFromJson(Map<String, dynamic> json) =>
    RaceAbilityChoose(
      from: (json['from'] as List<dynamic>).map((e) => e as String).toList(),
      count: (json['count'] as num?)?.toInt(),
      amount: (json['amount'] as num?)?.toInt(),
    );

Map<String, dynamic> _$RaceAbilityChooseToJson(RaceAbilityChoose instance) =>
    <String, dynamic>{
      'from': instance.from,
      'count': instance.count,
      'amount': instance.amount,
    };
