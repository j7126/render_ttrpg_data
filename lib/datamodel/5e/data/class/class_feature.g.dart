// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'class_feature.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ClassFeature5e _$ClassFeature5eFromJson(Map<String, dynamic> json) =>
    ClassFeature5e(
        name: json['name'] as String,
        source: json['source'] as String,
        page: (json['page'] as num?)?.toInt(),
        otherSources: (json['otherSources'] as List<dynamic>?)
            ?.map((e) => BookSource.fromJson(e as Map<String, dynamic>))
            .toList(),
        srd: json['srd'],
        className: json['className'] as String,
        classSource: json['classSource'] as String,
        level: (json['level'] as num).toInt(),
        header: (json['header'] as num?)?.toInt() ?? 0,
        entries:
            (json['entries'] as List<dynamic>?)
                ?.map(FeatureEntry.fromJson)
                .toList() ??
            const [],
        subclassShortName: json['subclassShortName'] as String?,
        subclassSource: json['subclassSource'] as String?,
      )
      ..basicRules = json['basicRules'] as bool?
      ..additionalSpells = (json['additionalSpells'] as List<dynamic>?)
          ?.map((e) => e as Map<String, dynamic>)
          .toList();

Map<String, dynamic> _$ClassFeature5eToJson(ClassFeature5e instance) =>
    <String, dynamic>{
      'source': instance.source,
      'page': instance.page,
      'otherSources': instance.otherSources?.map((e) => e.toJson()).toList(),
      'srd': instance.srd,
      'basicRules': instance.basicRules,
      'name': instance.name,
      'additionalSpells': instance.additionalSpells,
      'header': instance.header,
      'entries': instance.entries.map((e) => e.toJson()).toList(),
      'className': instance.className,
      'classSource': instance.classSource,
      'level': instance.level,
      'subclassShortName': instance.subclassShortName,
      'subclassSource': instance.subclassSource,
    };
