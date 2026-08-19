// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'class.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Class5e _$Class5eFromJson(Map<String, dynamic> json) =>
    Class5e(
        name: json['name'] as String,
        source: json['source'] as String,
        page: (json['page'] as num?)?.toInt(),
        otherSources: (json['otherSources'] as List<dynamic>?)
            ?.map((e) => BookSource.fromJson(e as Map<String, dynamic>))
            .toList(),
        srd: json['srd'],
        hd: Dice.fromJson(json['hd']),
        proficiency: (json['proficiency'] as List<dynamic>)
            .map((e) => $enumDecode(_$AbilityEnumMap, e))
            .toList(),
        spellcastingAbility: $enumDecodeNullable(
          _$AbilityEnumMap,
          json['spellcastingAbility'],
        ),
        casterProgression: json['casterProgression'] as String?,
        spellsKnownProgression:
            (json['spellsKnownProgression'] as List<dynamic>?)
                ?.map((e) => (e as num).toInt())
                .toList(),
        startingProficiencies: json['startingProficiencies'] == null
            ? null
            : ClassStartingProficiencies.fromJson(
                json['startingProficiencies'] as Map<String, dynamic>,
              ),
        preparedSpells: json['preparedSpells'] as String?,
      )
      ..optionalfeatureProgression =
          (json['optionalfeatureProgression'] as List<dynamic>?)
              ?.map(
                (e) => OptionalFeatureProgression.fromJson(
                  e as Map<String, dynamic>,
                ),
              )
              .toList()
      ..basicRules = json['basicRules'] as bool?
      ..cantripProgression = (json['cantripProgression'] as List<dynamic>?)
          ?.map((e) => (e as num).toInt())
          .toList();

Map<String, dynamic> _$Class5eToJson(Class5e instance) => <String, dynamic>{
  'optionalfeatureProgression': instance.optionalfeatureProgression
      ?.map((e) => e.toJson())
      .toList(),
  'source': instance.source,
  'page': instance.page,
  'otherSources': instance.otherSources?.map((e) => e.toJson()).toList(),
  'srd': instance.srd,
  'basicRules': instance.basicRules,
  'name': instance.name,
  'hd': instance.hd.toJson(),
  'proficiency': instance.proficiency.map((e) => _$AbilityEnumMap[e]!).toList(),
  'spellcastingAbility': _$AbilityEnumMap[instance.spellcastingAbility],
  'casterProgression': instance.casterProgression,
  'cantripProgression': instance.cantripProgression,
  'spellsKnownProgression': instance.spellsKnownProgression,
  'startingProficiencies': instance.startingProficiencies?.toJson(),
  'preparedSpells': instance.preparedSpells,
};

const _$AbilityEnumMap = {
  Ability.str: 'str',
  Ability.dex: 'dex',
  Ability.con: 'con',
  Ability.int: 'int',
  Ability.wis: 'wis',
  Ability.cha: 'cha',
};
