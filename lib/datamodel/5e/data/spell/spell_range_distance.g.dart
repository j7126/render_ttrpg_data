// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'spell_range_distance.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SpellRangeDistance _$SpellRangeDistanceFromJson(Map<String, dynamic> json) =>
    SpellRangeDistance(
      type: $enumDecode(_$SpellRangeDistanceUnitEnumMap, json['type']),
      amount: (json['amount'] as num?)?.toInt(),
    );

Map<String, dynamic> _$SpellRangeDistanceToJson(SpellRangeDistance instance) =>
    <String, dynamic>{
      'type': _$SpellRangeDistanceUnitEnumMap[instance.type]!,
      'amount': instance.amount,
    };

const _$SpellRangeDistanceUnitEnumMap = {
  SpellRangeDistanceUnit.miles: 'miles',
  SpellRangeDistanceUnit.feet: 'feet',
  SpellRangeDistanceUnit.self: 'self',
  SpellRangeDistanceUnit.touch: 'touch',
  SpellRangeDistanceUnit.sight: 'sight',
  SpellRangeDistanceUnit.unlimited: 'unlimited',
};
