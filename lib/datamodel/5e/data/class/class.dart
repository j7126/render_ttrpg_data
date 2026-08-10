import 'package:json_annotation/json_annotation.dart';
import 'package:render_ttrpg_data/datamodel/5e/data/ability.dart';
import 'package:render_ttrpg_data/datamodel/5e/data/base_object.dart';
import 'package:render_ttrpg_data/datamodel/5e/data/book_source.dart';
import 'package:render_ttrpg_data/datamodel/5e/data/class/class_feature.dart';
import 'package:render_ttrpg_data/datamodel/5e/data/class/starting_proficiency/starting_proficiencies.dart';
import 'package:render_ttrpg_data/datamodel/5e/data/dice.dart';
import 'package:render_ttrpg_data/datamodel/5e/data/generic/entry.dart';

part 'class.g.dart';

@JsonSerializable(explicitToJson: true)
class Class5e extends NamedBaseObject with WithReference  {
  Class5e({
    required super.name,
    required super.source,
    required super.page,
    super.otherSources,
    super.srd,
    required this.hd,
    required this.proficiency,
    this.spellcastingAbility,
    this.casterProgression,
    this.spellsKnownProgression,
    this.startingProficiencies,
    this.preparedSpells,
  });

  Dice hd;
  List<Ability> proficiency;
  Ability? spellcastingAbility;
  String? casterProgression;
  List<int>? cantripProgression;
  List<int>? spellsKnownProgression;
  ClassStartingProficiencies? startingProficiencies;
  String? preparedSpells;

  @override
  String get refString => "{@class $name|$source}";

  @JsonKey(includeFromJson: false, includeToJson: false)
  List<FeatureEntry>? classTableGroups;

  @JsonKey(includeFromJson: false, includeToJson: false)
  List<ClassFeature5e> classFeatures = [];

  @JsonKey(includeFromJson: false, includeToJson: false)
  List<String> gainSubClassFeatures = [];

  factory Class5e.fromJson(
    Map<String, dynamic> json,
    List<ClassFeature5e> classFeatures,
  ) {
    var result = _$Class5eFromJson(json);
    for (var feat in json["classFeatures"]) {
      String featString = "";
      if (feat is String) {
        featString = feat;
      } else {
        featString = feat["classFeature"];
        if (feat["gainSubclassFeature"] == true) {
          result.gainSubClassFeatures.add(featString);
        }
      }
      var feature = ClassFeature5e.fromReference(classFeatures, featString);
      if (feature != null) {
        result.classFeatures.add(feature);
      }
    }
    if (json.containsKey("classTableGroups")) {
      result.classTableGroups = [];
      for (var entry in json["classTableGroups"]) {
        if (entry is Map<String, dynamic>) {
          entry["type"] = "table";
          if (entry.containsKey("rowsSpellProgression") &&
              !entry.containsKey("rows")) {
            entry["rows"] = entry["rowsSpellProgression"];
          }
          result.classTableGroups!.add(FeatureEntry.fromJson(entry));
        }
      }
    }
    return result;
  }

  Map<String, dynamic> toJson() => _$Class5eToJson(this);
}
