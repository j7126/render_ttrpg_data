import 'package:json_annotation/json_annotation.dart';
import 'package:render_ttrpg_data/datamodel/5e/data/dice.dart';

part 'race_height_weight.g.dart';

@JsonSerializable(explicitToJson: true)
class RaceHeightWeight {
  RaceHeightWeight({
    required this.baseHeight,
    this.heightMod,
    required this.baseWeight,
    this.weightMod,
  });

  int baseHeight;
  Dice? heightMod;
  int baseWeight;
  Dice? weightMod;

  factory RaceHeightWeight.fromJson(Map<String, dynamic> json) =>
      _$RaceHeightWeightFromJson(json);

  Map<String, dynamic> toJson() => _$RaceHeightWeightToJson(this);
}
