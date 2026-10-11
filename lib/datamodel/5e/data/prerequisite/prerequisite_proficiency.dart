import 'package:json_annotation/json_annotation.dart';

part 'prerequisite_proficiency.g.dart';

@JsonSerializable(explicitToJson: true)
class PrerequisiteProficiency {
  PrerequisiteProficiency({this.weapon, this.armor, this.weaponGroup});

  String? weapon;
  String? armor;
  String? weaponGroup;

  List<String> getDisplayString() {
    List<String> strs = [];

    if (weapon != null) {
      strs.add("Proficiency with a $weapon weapon");
    }
    if (weapon != null) {
      strs.add("Proficiency with $armor armor");
    }
    if (weaponGroup != null) {
      strs.add("Proficiency with a $weaponGroup weapon");
    }

    return strs;
  }

  factory PrerequisiteProficiency.fromJson(Map<String, dynamic> json) =>
      _$PrerequisiteProficiencyFromJson(json);

  Map<String, dynamic> toJson() => _$PrerequisiteProficiencyToJson(this);
}
