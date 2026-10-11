import 'package:json_annotation/json_annotation.dart';
import 'package:render_ttrpg_data/datamodel/5e/data/interface/additional_spells_mixin.dart';
import 'package:render_ttrpg_data/datamodel/5e/data/book_source.dart';
import 'package:render_ttrpg_data/datamodel/5e/data/generic/entry.dart';
import 'package:render_ttrpg_data/datamodel/5e/data/interface/feature_like.dart';
import 'package:render_ttrpg_data/datamodel/5e/data/interface/skill_proficiency/skill_proficiency.dart';
import 'package:render_ttrpg_data/datamodel/5e/data/interface/skill_proficiency/skill_proficiency_mixin.dart';
import 'package:render_ttrpg_data/datamodel/5e/data/prerequisite/prerequisite.dart';

part 'optional_feature.g.dart';

@JsonSerializable(explicitToJson: true)
class OptionalFeature extends FeatureLike
    with SkillProficiencyMixin, AdditionalSpellsMixin {
  OptionalFeature({
    required super.name,
    required super.source,
    required super.page,
    super.otherSources,
    super.srd,
    required this.featureType,
    super.entries = const [],
    super.header = 1,
  });

  List<String> featureType;

  @override
  String get refType => "optfeature";
  @override
  String get refStringParts => "$name|$source";

  @override
  String get sourceLabel => name;

  @override
  int get order => 0;

  @override
  bool refCompareImpl(List<String> parts) {
    var source = parts.length > 1 ? parts[1] : "";
    return (name.toLowerCase() == parts[0]) &&
        (source.isEmpty || this.source.toLowerCase() == source);
  }

  factory OptionalFeature.fromJson(Map<String, dynamic> json) =>
      _$OptionalFeatureFromJson(json);

  Map<String, dynamic> toJson() => _$OptionalFeatureToJson(this);
}
