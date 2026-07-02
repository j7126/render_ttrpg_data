// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'table_cell.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TableCell _$TableCellFromJson(Map<String, dynamic> json) => TableCell(
  entry: json['entry'] as String?,
  roll: json['roll'] == null
      ? null
      : DiceRollCondition.fromJson(json['roll'] as Map<String, dynamic>),
);

Map<String, dynamic> _$TableCellToJson(TableCell instance) => <String, dynamic>{
  'entry': instance.entry,
  'roll': instance.roll?.toJson(),
};
