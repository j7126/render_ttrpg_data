import 'package:collection/collection.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:render_ttrpg_data/datamodel/5e/data/skill.dart';

part 'skill_proficiency.g.dart';

@JsonSerializable(explicitToJson: true, createFactory: false)
class SkillProficiency {
  const SkillProficiency({
    this.fixedSkills = const [],
    this.chooseSkills = const [],
    this.chooseNumber = 0,
    this.numAny = 0,
  });

  final List<Skill> fixedSkills;
  final List<Skill> chooseSkills;
  final int chooseNumber;
  final int numAny;

  String get displayString {
    var chooseNames = chooseSkills.map((x) => x.name);
    var chooseNamesString = chooseSkills.isEmpty
        ? ""
        : chooseSkills.length == 1
        ? chooseNames.first
        : "${chooseNames.take(chooseSkills.length - 1).join(", ")} or ${chooseNames.last}";
    return [
      ...fixedSkills.map((x) => x.name),
      if (chooseSkills.isNotEmpty && chooseNumber > 0)
        "$chooseNumber of $chooseNamesString",
      if (numAny > 0) "$numAny of any skill",
    ].join("; ");
  }

  factory SkillProficiency.fromJson(dynamic json) {
    if (json is Map<String, dynamic>) {
      var fixedSkills = json.entries
          .where((x) => !["any", "choose"].contains(x.key))
          .where((x) => x.value == true)
          .map(
            (x) => _$SkillEnumMap.entries
                .firstWhereOrNull((y) => y.value == x.key)
                ?.key,
          )
          .nonNulls
          .toList();
      List<Skill>? chooseSkills;
      int chooseNumber = 0;
      int numAny = 0;
      if (json.containsKey("choose")) {
        var choose = json["choose"] as Map<String, dynamic>;
        chooseSkills = choose["from"]
            .map<Skill>(
              (e) => _$SkillEnumMap.keys.firstWhere(
                (skill) =>
                    e.toString().toLowerCase() == skill.name.toLowerCase(),
              ),
            )
            .toList();
        chooseNumber = choose["count"] ?? 1;
      }
      var jsonAny = json["any"];
      if (jsonAny is int) {
        numAny = jsonAny;
      }

      return SkillProficiency(
        fixedSkills: fixedSkills,
        chooseSkills: chooseSkills ?? [],
        chooseNumber: chooseNumber,
        numAny: numAny,
      );
    }

    throw ArgumentError("Invalid skill proficiency type: $json");
  }

  Map<String, dynamic> toJson() => _$SkillProficiencyToJson(this);
}
