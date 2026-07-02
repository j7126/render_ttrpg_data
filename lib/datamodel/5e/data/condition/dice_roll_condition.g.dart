// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dice_roll_condition.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DiceRollCondition _$DiceRollConditionFromJson(Map<String, dynamic> json) =>
    DiceRollCondition(
      exact: (json['exact'] as num?)?.toInt(),
      max: (json['max'] as num?)?.toInt(),
      min: (json['min'] as num?)?.toInt(),
    );

Map<String, dynamic> _$DiceRollConditionToJson(DiceRollCondition instance) =>
    <String, dynamic>{
      'exact': instance.exact,
      'min': instance.min,
      'max': instance.max,
    };
