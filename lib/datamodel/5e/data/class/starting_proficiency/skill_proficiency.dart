import 'package:json_annotation/json_annotation.dart';
import 'package:render_ttrpg_data/datamodel/5e/data/skill.dart';

part 'skill_proficiency.g.dart';

@JsonSerializable(explicitToJson: true, createFactory: false)
class SkillProficiency {
  const SkillProficiency(this.skills, this.chooseNumber);

  final List<Skill> skills;
  final int chooseNumber;

  factory SkillProficiency.fromJson(dynamic json) {
    if (json is Map<String, dynamic>) {
      if (json.containsKey("choose")) {
        var choose = json["choose"] as Map<String, dynamic>;
        return SkillProficiency(
          choose["from"]
              .map<Skill>(
                (e) => _$SkillEnumMap.keys.firstWhere(
                  (skill) =>
                      e.toString().toLowerCase() == skill.name.toLowerCase(),
                ),
              )
              .toList(),
          choose["count"],
        );
      } else if (json.containsKey("any")) {
        return SkillProficiency(_$SkillEnumMap.keys.toList(), json["any"]);
      }
    }

    throw ArgumentError("Invalid skill proficiency type: $json");
  }

  Map<String, dynamic> toJson() => _$SkillProficiencyToJson(this);
}
