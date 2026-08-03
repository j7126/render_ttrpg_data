// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'spell_source_class.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SpellSourceClass _$SpellSourceClassFromJson(Map<String, dynamic> json) =>
    SpellSourceClass(
      name: json['name'] as String,
      source: json['source'] as String,
      definedInSource: json['definedInSource'] as String?,
    );

Map<String, dynamic> _$SpellSourceClassToJson(SpellSourceClass instance) =>
    <String, dynamic>{
      'name': instance.name,
      'source': instance.source,
      'definedInSource': instance.definedInSource,
    };
