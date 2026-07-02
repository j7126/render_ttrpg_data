// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Item _$ItemFromJson(Map<String, dynamic> json) =>
    Item(
        name: json['name'] as String,
        source: json['source'] as String,
        page: (json['page'] as num?)?.toInt(),
        otherSources: (json['otherSources'] as List<dynamic>?)
            ?.map((e) => BookSource.fromJson(e as Map<String, dynamic>))
            .toList(),
        srd: json['srd'],
        baseItem: json['baseItem'] as String?,
        entries:
            (json['entries'] as List<dynamic>?)
                ?.map(FeatureEntry.fromJson)
                .toList() ??
            const [],
        additionalEntries:
            (json['additionalEntries'] as List<dynamic>?)
                ?.map(FeatureEntry.fromJson)
                .toList() ??
            const [],
        age: json['age'] as String?,
        property:
            (json['property'] as List<dynamic>?)
                ?.map((e) => e as String)
                .toList() ??
            const [],
        weaponCategory: $enumDecodeNullable(
          _$WeaponCategoryEnumMap,
          json['weaponCategory'],
        ),
        range: json['range'] as String?,
        reload: (json['reload'] as num?)?.toInt(),
        dmg1: json['dmg1'] == null ? null : Dice.fromJson(json['dmg1']),
      )
      ..basicRules = json['basicRules'] as bool?
      ..type = json['type'] as String?;

Map<String, dynamic> _$ItemToJson(Item instance) => <String, dynamic>{
  'source': instance.source,
  'page': instance.page,
  'otherSources': instance.otherSources?.map((e) => e.toJson()).toList(),
  'srd': instance.srd,
  'basicRules': instance.basicRules,
  'name': instance.name,
  'type': instance.type,
  'itemType': instance.itemType?.toJson(),
  'baseItem': instance.baseItem,
  'age': instance.age,
  'property': instance.property,
  'weaponCategory': _$WeaponCategoryEnumMap[instance.weaponCategory],
  'range': instance.range,
  'reload': instance.reload,
  'dmg1': instance.dmg1?.toJson(),
  'entries': instance.entries.map((e) => e.toJson()).toList(),
  'additionalEntries': instance.additionalEntries
      .map((e) => e.toJson())
      .toList(),
  'itemProperties': instance.itemProperties.map((e) => e.toJson()).toList(),
};

const _$WeaponCategoryEnumMap = {
  WeaponCategory.simple: 'simple',
  WeaponCategory.martial: 'martial',
};
