// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'race.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Race _$RaceFromJson(Map<String, dynamic> json) =>
    Race(
        name: json['name'] as String,
        source: json['source'] as String,
        page: (json['page'] as num?)?.toInt(),
        otherSources: (json['otherSources'] as List<dynamic>?)
            ?.map((e) => BookSource.fromJson(e as Map<String, dynamic>))
            .toList(),
        srd: json['srd'],
        size:
            (json['size'] as List<dynamic>?)
                ?.map((e) => $enumDecode(_$CreatureSizeEnumMap, e))
                .toList() ??
            const [],
        speed: Speed.fromJson(json['speed']),
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
        lineage: json['lineage'],
      )
      ..basicRules = json['basicRules'] as bool?
      ..ability = (json['ability'] as List<dynamic>?)
          ?.map((e) => AbilityBonus.fromJson(e as Map<String, dynamic>))
          .toList()
      ..darkvision = (json['darkvision'] as num?)?.toInt();

Map<String, dynamic> _$RaceToJson(Race instance) => <String, dynamic>{
  'source': instance.source,
  'page': instance.page,
  'otherSources': instance.otherSources?.map((e) => e.toJson()).toList(),
  'srd': instance.srd,
  'basicRules': instance.basicRules,
  'name': instance.name,
  'ability': instance.ability?.map((e) => e.toJson()).toList(),
  'size': instance.size.map((e) => _$CreatureSizeEnumMap[e]!).toList(),
  'speed': instance.speed.toJson(),
  'entries': instance.entries.map((e) => e.toJson()).toList(),
  'creatureTypes': instance.creatureTypes,
  'heightAndWeight': instance.heightAndWeight?.toJson(),
  'age': instance.age?.toJson(),
  'darkvision': instance.darkvision,
  'lineage': instance.lineage,
};

const _$CreatureSizeEnumMap = {
  CreatureSize.small: 'S',
  CreatureSize.medium: 'M',
  CreatureSize.large: 'L',
  CreatureSize.varies: 'V',
};
