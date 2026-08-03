// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'subclass.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SubClass _$SubClassFromJson(Map<String, dynamic> json) => SubClass(
  name: json['name'] as String,
  source: json['source'] as String,
  page: (json['page'] as num?)?.toInt(),
  otherSources: (json['otherSources'] as List<dynamic>?)
      ?.map((e) => BookSource.fromJson(e as Map<String, dynamic>))
      .toList(),
  srd: json['srd'],
  shortName: json['shortName'] as String,
  className: json['className'] as String,
  classSource: json['classSource'] as String,
)..basicRules = json['basicRules'] as bool?;

Map<String, dynamic> _$SubClassToJson(SubClass instance) => <String, dynamic>{
  'source': instance.source,
  'page': instance.page,
  'otherSources': instance.otherSources?.map((e) => e.toJson()).toList(),
  'srd': instance.srd,
  'basicRules': instance.basicRules,
  'name': instance.name,
  'shortName': instance.shortName,
  'className': instance.className,
  'classSource': instance.classSource,
};
