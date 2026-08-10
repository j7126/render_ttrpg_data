import 'package:json_annotation/json_annotation.dart';
import 'package:render_ttrpg_data/datamodel/5e/data/condition/dice_roll_condition.dart';

part 'table_cell.g.dart';

@JsonSerializable(explicitToJson: true)
class TableCell {
  TableCell({this.entry, this.roll, this.intVal});

  String? entry;
  DiceRollCondition? roll;
  int? intVal;

  factory TableCell.fromJson(dynamic json) => json is String
      ? TableCell(entry: json)
      : json is int
      ? TableCell(entry: json.toString(), intVal: json)
      : _$TableCellFromJson(json);

  Map<String, dynamic> toJson() => _$TableCellToJson(this);
}
