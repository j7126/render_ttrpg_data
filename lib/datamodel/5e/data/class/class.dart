import 'package:json_annotation/json_annotation.dart';
import 'package:render_ttrpg_data/datamodel/5e/data/ability.dart';
import 'package:render_ttrpg_data/datamodel/5e/data/base_object.dart';
import 'package:render_ttrpg_data/datamodel/5e/data/book_source.dart';
import 'package:render_ttrpg_data/datamodel/5e/data/class/class_feature.dart';
import 'package:render_ttrpg_data/datamodel/5e/data/dice.dart';

part 'class.g.dart';

@JsonSerializable(explicitToJson: true)
class Class5e extends BaseObject {
  Class5e({
    required super.name,
    required super.source,
    required super.page,
    super.otherSources,
    super.srd,
    required this.hd,
    required this.proficiency,
    this.spellcastingAbility,
  });

  Dice hd;
  List<Ability> proficiency;
  Ability? spellcastingAbility;
  String? casterProgression;
  List<int>? cantripProgression;
  List<int>? spellsKnownProgression;

  @JsonKey(includeFromJson: false, includeToJson: false)
  List<ClassFeature5e> classFeatures = [];

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
      }
      var feature = ClassFeature5e.fromReference(classFeatures, featString);
      if (feature != null) {
        result.classFeatures.add(feature);
      }
    }
    return result;
  }

  Map<String, dynamic> toJson() => _$Class5eToJson(this);
}
