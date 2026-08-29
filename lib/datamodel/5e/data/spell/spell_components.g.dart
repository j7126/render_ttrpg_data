// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'spell_components.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SpellComponents _$SpellComponentsFromJson(Map<String, dynamic> json) =>
    SpellComponents(
      verbal: json['v'] as bool? ?? false,
      somatic: json['s'] as bool? ?? false,
      material: json['material'] as bool? ?? false,
      materialText: json['materialText'] as String?,
      materialCost: (json['materialCost'] as num?)?.toInt(),
      materialConsume: json['materialConsume'] as String?,
    );

Map<String, dynamic> _$SpellComponentsToJson(SpellComponents instance) =>
    <String, dynamic>{
      'v': instance.verbal,
      's': instance.somatic,
      'material': instance.material,
      'materialText': instance.materialText,
      'materialCost': instance.materialCost,
      'materialConsume': instance.materialConsume,
    };
