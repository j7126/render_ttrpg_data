// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'spell_duration_time.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SpellDurationTime _$SpellDurationTimeFromJson(Map<String, dynamic> json) =>
    SpellDurationTime(
      type: $enumDecode(_$SpellDurationUnitEnumMap, json['type']),
      amount: (json['amount'] as num).toInt(),
    );

Map<String, dynamic> _$SpellDurationTimeToJson(SpellDurationTime instance) =>
    <String, dynamic>{
      'type': _$SpellDurationUnitEnumMap[instance.type]!,
      'amount': instance.amount,
    };

const _$SpellDurationUnitEnumMap = {
  SpellDurationUnit.day: 'day',
  SpellDurationUnit.hour: 'hour',
  SpellDurationUnit.minute: 'minute',
  SpellDurationUnit.round: 'round',
};
