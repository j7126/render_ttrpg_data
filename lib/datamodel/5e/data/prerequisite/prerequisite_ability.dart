import 'package:json_annotation/json_annotation.dart';

part 'prerequisite_ability.g.dart';

@JsonSerializable(explicitToJson: true)
class PrerequisiteAbility {
  PrerequisiteAbility({
    this.strength,
    this.dexterity,
    this.constitution,
    this.intelligence,
    this.wisdom,
    this.charisma,
  });

  @JsonKey(name: "str")
  int? strength;
  @JsonKey(name: "dex")
  int? dexterity;
  @JsonKey(name: "con")
  int? constitution;
  @JsonKey(name: "int")
  int? intelligence;
  @JsonKey(name: "wis")
  int? wisdom;
  @JsonKey(name: "cha")
  int? charisma;

  List<String> getDisplayString() {
    List<String> strs = [];

    if (strength != null) {
      strs.add("Strength $strength or greater");
    }
    if (dexterity != null) {
      strs.add("Dexterity $dexterity or greater");
    }
    if (constitution != null) {
      strs.add("Constitution $constitution or greater");
    }
    if (intelligence != null) {
      strs.add("Intelligence $intelligence or greater");
    }
    if (wisdom != null) {
      strs.add("Wisdom $wisdom or greater");
    }
    if (charisma != null) {
      strs.add("Charisma $charisma or greater");
    }

    return strs;
  }

  factory PrerequisiteAbility.fromJson(Map<String, dynamic> json) =>
      _$PrerequisiteAbilityFromJson(json);

  Map<String, dynamic> toJson() => _$PrerequisiteAbilityToJson(this);
}
