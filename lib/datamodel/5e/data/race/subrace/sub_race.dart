import 'package:json_annotation/json_annotation.dart';
import 'package:render_ttrpg_data/datamodel/5e/data/interface/ability_bonus/ability_bonus_mixin.dart';
import 'package:render_ttrpg_data/datamodel/5e/data/interface/additional_spells_mixin.dart';
import 'package:render_ttrpg_data/datamodel/5e/data/interface/base_object.dart';
import 'package:render_ttrpg_data/datamodel/5e/data/book_source.dart';
import 'package:render_ttrpg_data/datamodel/5e/data/creature_size.dart';
import 'package:render_ttrpg_data/datamodel/5e/data/generic/entry.dart';
import 'package:render_ttrpg_data/datamodel/5e/data/interface/ability_bonus/ability_bonus.dart';
import 'package:render_ttrpg_data/datamodel/5e/data/interface/reference_mixin.dart';
import 'package:render_ttrpg_data/datamodel/5e/data/interface/source_label_mixin.dart';
import 'package:render_ttrpg_data/datamodel/5e/data/race/race_age.dart';
import 'package:render_ttrpg_data/datamodel/5e/data/race/race_height_weight.dart';
import 'package:render_ttrpg_data/datamodel/5e/data/speed.dart';

part 'sub_race.g.dart';

@JsonSerializable(explicitToJson: true)
class SubRace extends BaseObject
    with
        ReferenceMixin,
        AbilityBonusMixin,
        VariableNameMixin,
        SourceLabelMixin,
        AdditionalSpellsMixin {
  SubRace({
    required this.raceName,
    required super.source,
    super.page,
    super.otherSources,
    super.srd,
    this.name,
    this.size = const [],
    this.speed,
    this.entries = const [],
    this.creatureTypes = const [],
    this.heightAndWeight,
    this.age,
  });

  String? name;
  String raceName;
  List<CreatureSize>? size;
  Speed? speed;
  List<FeatureEntry>? entries;
  List<String>? creatureTypes;
  RaceHeightWeight? heightAndWeight;
  RaceAge? age;
  int? darkvision;

  @override
  String get variableName => name ?? raceName;

  @override
  String get refType => "subrace";
  @override
  String get refStringParts => "$raceName|$variableName|$source";

  @override
  String get sourceLabel => name == null ? raceName : "$name | $raceName";

  factory SubRace.fromJson(Map<String, dynamic> json) =>
      _$SubRaceFromJson(json);

  Map<String, dynamic> toJson() => _$SubRaceToJson(this);

  @override
  bool refCompareImpl(List<String> parts) {
    return parts.length == 3 &&
        (raceName.toLowerCase() == parts[0].toLowerCase()) &&
        (variableName.toLowerCase() == parts[1].toLowerCase()) &&
        (source.toLowerCase() == parts[2].toLowerCase());
  }
}
