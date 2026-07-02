import 'package:json_annotation/json_annotation.dart';
import 'package:render_ttrpg_data/datamodel/5e/data/spell/spell_range_distance.dart';

part 'spell_range.g.dart';

@JsonSerializable(explicitToJson: true)
class SpellRange {
  SpellRange({required this.type});

  SpellRangeType type;
  SpellRangeDistance? distance;

  factory SpellRange.fromJson(Map<String, dynamic> json) =>
      _$SpellRangeFromJson(json);

  Map<String, dynamic> toJson() => _$SpellRangeToJson(this);
}

enum SpellRangeType {
  point,
  special,
  cone,
  line,
  radius,
  sphere,
  hemisphere,
  cube,
}
