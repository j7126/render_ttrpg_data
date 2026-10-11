// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'prerequisite_level.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PrerequisiteLevel _$PrerequisiteLevelFromJson(Map<String, dynamic> json) =>
    PrerequisiteLevel(
      level: (json['level'] as num?)?.toInt() ?? 0,
      className: json['className'] as String?,
      classVisible: json['classVisible'] as bool?,
      subclassName: json['subclassName'] as String?,
      subclassVisible: json['subclassVisible'] as bool?,
    );

Map<String, dynamic> _$PrerequisiteLevelToJson(PrerequisiteLevel instance) =>
    <String, dynamic>{
      'level': instance.level,
      'className': instance.className,
      'classVisible': instance.classVisible,
      'subclassName': instance.subclassName,
      'subclassVisible': instance.subclassVisible,
    };
