// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'spell_duration.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SpellDuration _$SpellDurationFromJson(Map<String, dynamic> json) =>
    SpellDuration(
      type: $enumDecode(_$SpellDurationTypeEnumMap, json['type']),
      concentration: json['concentration'] as bool? ?? false,
      duration: json['duration'] == null
          ? null
          : SpellDurationTime.fromJson(
              json['duration'] as Map<String, dynamic>,
            ),
      end: (json['end'] as List<dynamic>?)
          ?.map((e) => $enumDecode(_$SpellDurationEndConditionEnumMap, e))
          .toList(),
    );

Map<String, dynamic> _$SpellDurationToJson(SpellDuration instance) =>
    <String, dynamic>{
      'type': _$SpellDurationTypeEnumMap[instance.type]!,
      'concentration': instance.concentration,
      'duration': instance.duration?.toJson(),
      'end': instance.end
          ?.map((e) => _$SpellDurationEndConditionEnumMap[e]!)
          .toList(),
    };

const _$SpellDurationTypeEnumMap = {
  SpellDurationType.instant: 'instant',
  SpellDurationType.timed: 'timed',
  SpellDurationType.special: 'special',
  SpellDurationType.permanent: 'permanent',
};

const _$SpellDurationEndConditionEnumMap = {
  SpellDurationEndCondition.dispel: 'dispel',
};
