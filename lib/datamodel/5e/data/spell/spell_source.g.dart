// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'spell_source.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SpellSource _$SpellSourceFromJson(Map<String, dynamic> json) =>
    SpellSource(
        classSource: (json['class'] as List<dynamic>?)
            ?.map((e) => SpellSourceClass.fromJson(e as Map<String, dynamic>))
            .toList(),
      )
      ..classVariant = (json['classVariant'] as List<dynamic>?)
          ?.map((e) => SpellSourceClass.fromJson(e as Map<String, dynamic>))
          .toList();

Map<String, dynamic> _$SpellSourceToJson(SpellSource instance) =>
    <String, dynamic>{
      'class': instance.classSource?.map((e) => e.toJson()).toList(),
      'classVariant': instance.classVariant?.map((e) => e.toJson()).toList(),
    };
