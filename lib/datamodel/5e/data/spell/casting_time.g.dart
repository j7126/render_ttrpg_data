// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'casting_time.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CastingTime _$CastingTimeFromJson(Map<String, dynamic> json) => CastingTime(
  number: (json['number'] as num).toInt(),
  unit: $enumDecode(_$CastingTimeUnitEnumMap, json['unit']),
);

Map<String, dynamic> _$CastingTimeToJson(CastingTime instance) =>
    <String, dynamic>{
      'number': instance.number,
      'unit': _$CastingTimeUnitEnumMap[instance.unit]!,
    };

const _$CastingTimeUnitEnumMap = {
  CastingTimeUnit.action: 'action',
  CastingTimeUnit.bonus: 'bonus',
  CastingTimeUnit.reaction: 'reaction',
  CastingTimeUnit.minute: 'minute',
  CastingTimeUnit.hour: 'hour',
};
