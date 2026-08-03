// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'race_height_weight.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RaceHeightWeight _$RaceHeightWeightFromJson(Map<String, dynamic> json) =>
    RaceHeightWeight(
      baseHeight: (json['baseHeight'] as num).toInt(),
      heightMod: json['heightMod'] == null
          ? null
          : Dice.fromJson(json['heightMod']),
      baseWeight: (json['baseWeight'] as num).toInt(),
      weightMod: json['weightMod'] == null
          ? null
          : Dice.fromJson(json['weightMod']),
    );

Map<String, dynamic> _$RaceHeightWeightToJson(RaceHeightWeight instance) =>
    <String, dynamic>{
      'baseHeight': instance.baseHeight,
      'heightMod': instance.heightMod?.toJson(),
      'baseWeight': instance.baseWeight,
      'weightMod': instance.weightMod?.toJson(),
    };
