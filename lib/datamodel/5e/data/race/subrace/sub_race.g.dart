// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sub_race.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SubRace _$SubRaceFromJson(Map<String, dynamic> json) =>
    SubRace(
        raceName: json['raceName'] as String,
        source: json['source'] as String,
        page: (json['page'] as num?)?.toInt(),
        otherSources: (json['otherSources'] as List<dynamic>?)
            ?.map((e) => BookSource.fromJson(e as Map<String, dynamic>))
            .toList(),
        srd: json['srd'],
        name: json['name'] as String?,
        size:
            (json['size'] as List<dynamic>?)
                ?.map((e) => $enumDecode(_$CreatureSizeEnumMap, e))
                .toList() ??
            const [],
        speed: json['speed'] == null ? null : Speed.fromJson(json['speed']),
        entries:
            (json['entries'] as List<dynamic>?)
                ?.map(FeatureEntry.fromJson)
                .toList() ??
            const [],
        creatureTypes:
            (json['creatureTypes'] as List<dynamic>?)
                ?.map((e) => e as String)
                .toList() ??
            const [],
        heightAndWeight: json['heightAndWeight'] == null
            ? null
            : RaceHeightWeight.fromJson(
                json['heightAndWeight'] as Map<String, dynamic>,
              ),
        age: json['age'] == null
            ? null
            : RaceAge.fromJson(json['age'] as Map<String, dynamic>),
      )
      ..basicRules = json['basicRules'] as bool?
      ..ability = (json['ability'] as List<dynamic>?)
          ?.map((e) => AbilityBonus.fromJson(e as Map<String, dynamic>))
          .toList()
      ..additionalSpells = (json['additionalSpells'] as List<dynamic>?)
          ?.map((e) => e as Map<String, dynamic>)
          .toList()
      ..darkvision = (json['darkvision'] as num?)?.toInt();

Map<String, dynamic> _$SubRaceToJson(SubRace instance) => <String, dynamic>{
  'source': instance.source,
  'page': instance.page,
  'otherSources': instance.otherSources?.map((e) => e.toJson()).toList(),
  'srd': instance.srd,
  'basicRules': instance.basicRules,
  'ability': instance.ability?.map((e) => e.toJson()).toList(),
  'additionalSpells': instance.additionalSpells,
  'name': instance.name,
  'raceName': instance.raceName,
  'size': instance.size?.map((e) => _$CreatureSizeEnumMap[e]!).toList(),
  'speed': instance.speed?.toJson(),
  'entries': instance.entries?.map((e) => e.toJson()).toList(),
  'creatureTypes': instance.creatureTypes,
  'heightAndWeight': instance.heightAndWeight?.toJson(),
  'age': instance.age?.toJson(),
  'darkvision': instance.darkvision,
};

const _$CreatureSizeEnumMap = {
  CreatureSize.small: 'S',
  CreatureSize.medium: 'M',
  CreatureSize.large: 'L',
  CreatureSize.varies: 'V',
};
