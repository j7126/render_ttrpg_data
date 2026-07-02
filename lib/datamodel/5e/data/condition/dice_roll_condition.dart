import 'package:json_annotation/json_annotation.dart';

part 'dice_roll_condition.g.dart';

@JsonSerializable(explicitToJson: true)
class DiceRollCondition {
  DiceRollCondition({this.exact, this.max, this.min});

  int? exact;
  int? min;
  int? max;

  factory DiceRollCondition.fromJson(Map<String, dynamic> json) =>
      _$DiceRollConditionFromJson(json);

  Map<String, dynamic> toJson() => _$DiceRollConditionToJson(this);
}
