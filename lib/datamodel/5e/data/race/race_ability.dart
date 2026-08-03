import 'package:json_annotation/json_annotation.dart';

part 'race_ability.g.dart';

@JsonSerializable(explicitToJson: true)
class RaceAbility {
  RaceAbility({
    this.strength,
    this.dexterity,
    this.constitution,
    this.intelligence,
    this.wisdom,
    this.charisma,
    this.choose,
  });

  @JsonValue("str")
  int? strength;
  @JsonValue("dex")
  int? dexterity;
  @JsonValue("con")
  int? constitution;
  @JsonValue("int")
  int? intelligence;
  @JsonValue("wis")
  int? wisdom;
  @JsonValue("cha")
  int? charisma;

  RaceAbilityChoose? choose;

  factory RaceAbility.fromJson(Map<String, dynamic> json) =>
      _$RaceAbilityFromJson(json);

  Map<String, dynamic> toJson() => _$RaceAbilityToJson(this);
}

@JsonSerializable(explicitToJson: true)
class RaceAbilityChoose {
  RaceAbilityChoose({required this.from, this.count, this.amount});

  List<String> from;
  int? count;
  int? amount;

  factory RaceAbilityChoose.fromJson(Map<String, dynamic> json) =>
      _$RaceAbilityChooseFromJson(json);

  Map<String, dynamic> toJson() => _$RaceAbilityChooseToJson(this);
}
