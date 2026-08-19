import 'package:json_annotation/json_annotation.dart';
import 'package:render_ttrpg_data/datamodel/5e/data/interface/base_object.dart';
import 'package:render_ttrpg_data/datamodel/5e/data/book_source.dart';
import 'package:render_ttrpg_data/datamodel/5e/data/creature_size.dart';
import 'package:render_ttrpg_data/datamodel/5e/data/generic/entry.dart';
import 'package:render_ttrpg_data/datamodel/5e/data/race/race_ability.dart';
import 'package:render_ttrpg_data/datamodel/5e/data/race/race_age.dart';
import 'package:render_ttrpg_data/datamodel/5e/data/race/race_height_weight.dart';
import 'package:render_ttrpg_data/datamodel/5e/data/speed.dart';

part 'optional_feature_progression.g.dart';

@JsonSerializable(explicitToJson: true)
class OptionalFeatureProgression {
  OptionalFeatureProgression({
    required this.name,
    required this.featureType,
    required this.progression,
    this.required,
    this.classSource,
  });

  String name;
  List<String> featureType;
  dynamic progression;
  Map<String, List<String>>? required;
  String? classSource;

  factory OptionalFeatureProgression.fromJson(Map<String, dynamic> json) =>
      _$OptionalFeatureProgressionFromJson(json);

  Map<String, dynamic> toJson() => _$OptionalFeatureProgressionToJson(this);
}
