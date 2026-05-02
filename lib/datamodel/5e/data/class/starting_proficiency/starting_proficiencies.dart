import 'package:json_annotation/json_annotation.dart';
import 'package:render_ttrpg_data/datamodel/5e/data/class/starting_proficiency/armor_proficiency.dart';
import 'package:render_ttrpg_data/datamodel/5e/data/class/starting_proficiency/skill_proficiency.dart';

part 'starting_proficiencies.g.dart';

@JsonSerializable(explicitToJson: true)
class ClassStartingProficiencies {
  ClassStartingProficiencies({this.armor});

  List<ArmorProficiency>? armor;
  List<SkillProficiency>? skills;

  factory ClassStartingProficiencies.fromJson(Map<String, dynamic> json) =>
      _$ClassStartingProficienciesFromJson(json);

  Map<String, dynamic> toJson() => _$ClassStartingProficienciesToJson(this);
}
