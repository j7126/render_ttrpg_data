import 'package:json_annotation/json_annotation.dart';
import 'package:render_ttrpg_data/datamodel/5e/data/prerequisite/prerequisite_ability.dart';
import 'package:render_ttrpg_data/datamodel/5e/data/prerequisite/prerequisite_background.dart';
import 'package:render_ttrpg_data/datamodel/5e/data/prerequisite/prerequisite_level.dart';
import 'package:render_ttrpg_data/datamodel/5e/data/prerequisite/prerequisite_proficiency.dart';
import 'package:render_ttrpg_data/datamodel/5e/data/prerequisite/prerequisite_race.dart';
import 'package:render_ttrpg_data/util/int_extension.dart';

part 'prerequisite.g.dart';

@JsonSerializable(explicitToJson: true)
class Prerequisite {
  Prerequisite({
    this.note,
    this.other,
    this.level,
    this.spellcastingFeature,
    this.spellcasting2020,
    this.spellcasting,
    this.campaign = const [],
    this.race = const [],
    this.feat = const [],
    this.ability = const [],
    this.proficiency = const [],
    this.background = const [],
    this.spell = const [],
    this.item = const [],
    this.pact,
  });

  String? note;
  String? other;
  PrerequisiteLevel? level;
  bool? spellcastingFeature;
  bool? spellcasting2020;
  bool? spellcasting;
  List<String> campaign;
  List<PrerequisiteRace> race;
  List<String> feat;
  List<PrerequisiteAbility> ability;
  List<PrerequisiteProficiency> proficiency;
  List<PrerequisiteBackground> background;
  List<String> spell;
  List<String> item;
  String? pact;

  String? getDisplayString() {
    List<String> strings = [];

    // all prereq types
    if (other != null) {
      strings.add(other!);
    }
    strings.addAll(campaign.map((x) => "$x Campaign"));
    if (spellcastingFeature == true) {
      strings.add("Spellcasting Feature");
    }
    if (spellcasting2020 == true) {
      strings.add("Spellcasting or Pact Magic Feature");
    }
    if (spellcasting == true) {
      strings.add("The ability to cast at least one spell");
    }
    if (level != null) {
      strings.add(
        [
          if (level!.level > 1) "${level!.level.ordinal()} level",
          if (level!.classVisible == true && level!.className != null)
            "${level!.className}",
        ].join(" "),
      );
    }
    if (race.isNotEmpty) {
      var raceStr = "";
      for (var i = 0; i < race.length; i++) {
        if (i != 0) {
          raceStr += i == race.length - 1 ? " or " : ", ";
        }
        var r = race[i];
        raceStr += r.name;
        if (r.subrace != null) {
          raceStr += " (${r.subrace})";
        }
      }
      strings.add(raceStr);
    }
    strings.addAll(feat.map((x) => x.split("|").last));
    strings.addAll(ability.expand((x) => x.getDisplayString()));
    strings.addAll(proficiency.expand((x) => x.getDisplayString()));
    strings.addAll(
      background.map((x) => "${x.displayEntry ?? x.name} background"),
    );
    for (var s in spell) {
      var sparts = s.split("#");
      strings.add(
        "{@spell ${sparts[0]}} ${sparts[1] == "c" ? "cantrip" : "spell"}",
      );
    }
    strings.addAll(item);
    if (pact != null) {
      strings.add("Pact of the $pact");
    }

    // combine strings
    var str = strings.isEmpty ? null : strings.join(", ");
    // note
    if (str != null && note != null) {
      str += ". $note";
    }

    return str;
  }

  factory Prerequisite.fromJson(Map<String, dynamic> json) =>
      _$PrerequisiteFromJson(json);

  Map<String, dynamic> toJson() => _$PrerequisiteToJson(this);
}
