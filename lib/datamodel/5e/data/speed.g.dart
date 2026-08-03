// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'speed.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Speed _$SpeedFromJson(Map<String, dynamic> json) => Speed(
  walkSpeed: (json['walkSpeed'] as num).toInt(),
  flySpeed: (json['flySpeed'] as num?)?.toInt(),
  flying: json['flying'] as bool? ?? false,
  swimSpeed: (json['swimSpeed'] as num?)?.toInt(),
  swimming: json['swimming'] as bool? ?? false,
);

Map<String, dynamic> _$SpeedToJson(Speed instance) => <String, dynamic>{
  'walkSpeed': instance.walkSpeed,
  'flySpeed': instance.flySpeed,
  'flying': instance.flying,
  'swimSpeed': instance.swimSpeed,
  'swimming': instance.swimming,
};
