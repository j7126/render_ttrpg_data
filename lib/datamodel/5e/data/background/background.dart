import 'package:json_annotation/json_annotation.dart';
import 'package:render_ttrpg_data/datamodel/5e/data/book_source.dart';
import 'package:render_ttrpg_data/datamodel/5e/data/interface/base_object.dart';
import 'package:render_ttrpg_data/datamodel/5e/data/generic/entry.dart';
import 'package:render_ttrpg_data/datamodel/5e/data/interface/reference_mixin.dart';
import 'package:render_ttrpg_data/datamodel/5e/data/interface/skill_proficiency/skill_proficiency.dart';
import 'package:render_ttrpg_data/datamodel/5e/data/interface/skill_proficiency/skill_proficiency_mixin.dart';

part 'background.g.dart';

@JsonSerializable(explicitToJson: true)
class Background extends NamedBaseObject
    with ReferenceMixin, SkillProficiencyMixin {
  Background({
    required super.name,
    required super.source,
    super.page,
    super.otherSources,
    super.srd,
    this.entries = const [],
  });

  List<FeatureEntry> entries;

  @override
  String get refType => "background";
  @override
  String get refStringParts => "$name|$source";

  factory Background.fromJson(Map<String, dynamic> json) =>
      _$BackgroundFromJson(json);

  Map<String, dynamic> toJson() => _$BackgroundToJson(this);

  bool searchCompare(String searchString) {
    return name.toLowerCase().contains(searchString) ||
        (srd is String && srd.toLowerCase().contains(searchString));
  }

  @override
  bool refCompareImpl(List<String> parts) {
    return parts.isNotEmpty &&
        (name.toLowerCase() == parts[0] ||
            (srd is String && srd.toLowerCase() == parts[0])) &&
        (parts.length == 1 || source.toLowerCase() == parts[1]);
  }
}
