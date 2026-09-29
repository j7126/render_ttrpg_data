import 'package:json_annotation/json_annotation.dart';
import 'package:render_ttrpg_data/datamodel/5e/data/interface/base_object.dart';
import 'package:render_ttrpg_data/datamodel/5e/data/book_source.dart';
import 'package:render_ttrpg_data/datamodel/5e/data/generic/entry.dart';
import 'package:render_ttrpg_data/datamodel/5e/data/interface/reference_mixin.dart';
import 'package:render_ttrpg_data/datamodel/5e/data/interface/skill_proficiency/skill_proficiency.dart';
import 'package:render_ttrpg_data/datamodel/5e/data/interface/skill_proficiency/skill_proficiency_mixin.dart';

part 'optional_feature.g.dart';

@JsonSerializable(explicitToJson: true)
class OptionalFeature extends NamedBaseObject
    with ReferenceMixin, SkillProficiencyMixin {
  OptionalFeature({
    required super.name,
    required super.source,
    required super.page,
    super.otherSources,
    super.srd,
    required this.featureType,
    this.entries = const [],
  });

  List<String> featureType;
  List<FeatureEntry> entries;

  @override
  String get refType => "optfeature";
  @override
  String get refStringParts => "$name|$source";

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
