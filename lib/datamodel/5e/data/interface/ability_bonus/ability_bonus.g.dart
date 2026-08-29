// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ability_bonus.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AbilityBonus _$AbilityBonusFromJson(Map<String, dynamic> json) => AbilityBonus(
  strength: (json['str'] as num?)?.toInt(),
  dexterity: (json['dex'] as num?)?.toInt(),
  constitution: (json['con'] as num?)?.toInt(),
  intelligence: (json['int'] as num?)?.toInt(),
  wisdom: (json['wis'] as num?)?.toInt(),
  charisma: (json['cha'] as num?)?.toInt(),
  choose: json['choose'] == null
      ? null
      : AbilityBonusChoose.fromJson(json['choose'] as Map<String, dynamic>),
);

Map<String, dynamic> _$AbilityBonusToJson(AbilityBonus instance) =>
    <String, dynamic>{
      'str': instance.strength,
      'dex': instance.dexterity,
      'con': instance.constitution,
      'int': instance.intelligence,
      'wis': instance.wisdom,
      'cha': instance.charisma,
      'choose': instance.choose?.toJson(),
    };

AbilityBonusChoose _$AbilityBonusChooseFromJson(Map<String, dynamic> json) =>
    AbilityBonusChoose(
      from: (json['from'] as List<dynamic>)
          .map((e) => $enumDecode(_$AbilityEnumMap, e))
          .toList(),
      count: (json['count'] as num?)?.toInt(),
      amount: (json['amount'] as num?)?.toInt(),
    );

Map<String, dynamic> _$AbilityBonusChooseToJson(AbilityBonusChoose instance) =>
    <String, dynamic>{
      'from': instance.from.map((e) => _$AbilityEnumMap[e]!).toList(),
      'count': instance.count,
      'amount': instance.amount,
    };

const _$AbilityEnumMap = {
  Ability.str: 'str',
  Ability.dex: 'dex',
  Ability.con: 'con',
  Ability.int: 'int',
  Ability.wis: 'wis',
  Ability.cha: 'cha',
};
