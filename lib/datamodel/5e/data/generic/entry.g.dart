// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'entry.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FeatureEntry _$FeatureEntryFromJson(Map<String, dynamic> json) => FeatureEntry(
  type: $enumDecode(_$FeatureEntryTypeEnumMap, json['type']),
  count: (json['count'] as num?)?.toInt(),
  name: json['name'] as String?,
  caption: json['caption'] as String?,
  entries: (json['entries'] as List<dynamic>?)
      ?.map(FeatureEntry.fromJson)
      .toList(),
  attributes: (json['attributes'] as List<dynamic>?)
      ?.map((e) => $enumDecode(_$AbilityEnumMap, e))
      .toList(),
  colLabels: (json['colLabels'] as List<dynamic>?)
      ?.map((e) => e as String)
      .toList(),
  colStyles: (json['colStyles'] as List<dynamic>?)
      ?.map((e) => e as String)
      .toList(),
  rows: (json['rows'] as List<dynamic>?)
      ?.map((e) => (e as List<dynamic>).map(TableCell.fromJson).toList())
      .toList(),
  classFeature: json['classFeature'] as String?,
  optionalfeature: json['optionalfeature'] as String?,
  items: (json['items'] as List<dynamic>?)?.map(FeatureEntry.fromJson).toList(),
  subclassFeature: json['subclassFeature'] as String?,
);

Map<String, dynamic> _$FeatureEntryToJson(
  FeatureEntry instance,
) => <String, dynamic>{
  'type': _$FeatureEntryTypeEnumMap[instance.type]!,
  'count': instance.count,
  'name': instance.name,
  'caption': instance.caption,
  'attributes': instance.attributes?.map((e) => _$AbilityEnumMap[e]!).toList(),
  'colLabels': instance.colLabels,
  'colStyles': instance.colStyles,
  'rows': instance.rows?.map((e) => e.map((e) => e.toJson()).toList()).toList(),
  'classFeature': instance.classFeature,
  'optionalfeature': instance.optionalfeature,
  'subclassFeature': instance.subclassFeature,
  'entries': instance.entries?.map((e) => e.toJson()).toList(),
  'items': instance.items?.map((e) => e.toJson()).toList(),
  'referencedFeature': instance.referencedFeature?.toJson(),
  'referencedOptionalFeature': instance.referencedOptionalFeature?.toJson(),
};

const _$FeatureEntryTypeEnumMap = {
  FeatureEntryType.entries: 'entries',
  FeatureEntryType.list: 'list',
  FeatureEntryType.item: 'item',
  FeatureEntryType.table: 'table',
  FeatureEntryType.options: 'options',
  FeatureEntryType.abilityDc: 'abilityDc',
  FeatureEntryType.abilityAttackMod: 'abilityAttackMod',
  FeatureEntryType.refClassFeature: 'refClassFeature',
  FeatureEntryType.refOptionalfeature: 'refOptionalfeature',
  FeatureEntryType.refSubclassFeature: 'refSubclassFeature',
  FeatureEntryType.entry: 'entry',
  FeatureEntryType.inset: 'inset',
  FeatureEntryType.quote: 'quote',
  FeatureEntryType.section: 'section',
};

const _$AbilityEnumMap = {
  Ability.str: 'str',
  Ability.dex: 'dex',
  Ability.con: 'con',
  Ability.int: 'int',
  Ability.wis: 'wis',
  Ability.cha: 'cha',
};

FeatureEntryPreserve _$FeatureEntryPreserveFromJson(
  Map<String, dynamic> json,
) => FeatureEntryPreserve(consumes: json['consumes'] as bool);

Map<String, dynamic> _$FeatureEntryPreserveToJson(
  FeatureEntryPreserve instance,
) => <String, dynamic>{'consumes': instance.consumes};
