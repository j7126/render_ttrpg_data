// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'spell_range.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SpellRange _$SpellRangeFromJson(Map<String, dynamic> json) =>
    SpellRange(type: $enumDecode(_$SpellRangeTypeEnumMap, json['type']))
      ..distance = json['distance'] == null
          ? null
          : SpellRangeDistance.fromJson(
              json['distance'] as Map<String, dynamic>,
            );

Map<String, dynamic> _$SpellRangeToJson(SpellRange instance) =>
    <String, dynamic>{
      'type': _$SpellRangeTypeEnumMap[instance.type]!,
      'distance': instance.distance?.toJson(),
    };

const _$SpellRangeTypeEnumMap = {
  SpellRangeType.point: 'point',
  SpellRangeType.special: 'special',
  SpellRangeType.cone: 'cone',
  SpellRangeType.line: 'line',
  SpellRangeType.radius: 'radius',
  SpellRangeType.sphere: 'sphere',
  SpellRangeType.hemisphere: 'hemisphere',
  SpellRangeType.cube: 'cube',
};
