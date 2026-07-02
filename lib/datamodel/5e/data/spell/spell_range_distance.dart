import 'package:json_annotation/json_annotation.dart';

part 'spell_range_distance.g.dart';

@JsonSerializable(explicitToJson: true)
class SpellRangeDistance {
  SpellRangeDistance({required this.type, this.amount});

  SpellRangeDistanceUnit type;
  int? amount;

  factory SpellRangeDistance.fromJson(Map<String, dynamic> json) =>
      _$SpellRangeDistanceFromJson(json);

  Map<String, dynamic> toJson() => _$SpellRangeDistanceToJson(this);
}

enum SpellRangeDistanceUnit { miles, feet, self, touch, sight, unlimited }
