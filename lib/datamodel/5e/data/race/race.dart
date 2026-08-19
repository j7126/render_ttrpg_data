import 'package:json_annotation/json_annotation.dart';
import 'package:render_ttrpg_data/datamodel/5e/data/interface/base_object.dart';
import 'package:render_ttrpg_data/datamodel/5e/data/book_source.dart';
import 'package:render_ttrpg_data/datamodel/5e/data/creature_size.dart';
import 'package:render_ttrpg_data/datamodel/5e/data/generic/entry.dart';
import 'package:render_ttrpg_data/datamodel/5e/data/race/race_ability.dart';
import 'package:render_ttrpg_data/datamodel/5e/data/race/race_age.dart';
import 'package:render_ttrpg_data/datamodel/5e/data/race/race_height_weight.dart';
import 'package:render_ttrpg_data/datamodel/5e/data/speed.dart';

part 'race.g.dart';

@JsonSerializable(explicitToJson: true)
class Race extends NamedBaseObject {
  Race({
    required super.name,
    required super.source,
    super.page,
    super.otherSources,
    super.srd,
    this.size = const [],
    required this.speed,
    this.entries = const [],
    this.ability = const [],
    this.creatureTypes = const [],
    this.heightAndWeight,
    this.age,
  });

  List<CreatureSize> size;
  Speed speed;
  List<FeatureEntry> entries;
  List<RaceAbility> ability;
  List<String> creatureTypes;
  RaceHeightWeight? heightAndWeight;
  RaceAge? age;
  int? darkvision;

  factory Race.fromJson(Map<String, dynamic> json) => _$RaceFromJson(json);

  Map<String, dynamic> toJson() => _$RaceToJson(this);

  bool searchCompare(String searchString) {
    return name.toLowerCase().contains(searchString) ||
        (srd is String && srd.toLowerCase().contains(searchString));
  }
}
