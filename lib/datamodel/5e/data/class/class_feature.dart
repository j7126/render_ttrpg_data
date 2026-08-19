import 'package:collection/collection.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:render_ttrpg_data/datamodel/5e/data/data_model_5e.dart';
import 'package:render_ttrpg_data/datamodel/5e/data/interface/additional_spells_mixin.dart';
import 'package:render_ttrpg_data/datamodel/5e/data/book_source.dart';
import 'package:render_ttrpg_data/datamodel/5e/data/interface/feature_like.dart';
import 'package:render_ttrpg_data/datamodel/5e/data/generic/entry.dart';

part 'class_feature.g.dart';

@JsonSerializable(explicitToJson: true)
class ClassFeature5e extends FeatureLike with AdditionalSpellsMixin {
  ClassFeature5e({
    required super.name,
    required super.source,
    required super.page,
    super.otherSources,
    super.srd,
    required this.className,
    required this.classSource,
    required this.level,
    super.header = 0,
    super.entries = const [],
    this.subclassShortName,
    this.subclassSource,
  });

  String className;
  String classSource;
  int level;
  String? subclassShortName;
  String? subclassSource;

  @override
  String get sourceLabel => subclassShortName != null
      ? "$className | $subclassShortName | LVL $level"
      : "$className | LVL $level";

  @override
  String get refString => subclassShortName != null && subclassSource != null
      ? "{@subclassFeature $name|$className|$source|$subclassShortName|$subclassSource|$level}"
      : "{@classFeature $name|$className|$source|$level}";

  @override
  int get order => level;

  bool refCompare(String searchString) {
    var splitRef = searchString.toLowerCase().split("|");

    if (splitRef.length != 4 && splitRef.length != 6) {
      return false;
    }

    var name = splitRef[0];
    var className = splitRef[1];
    var source = splitRef[2];
    var level = int.tryParse(splitRef[splitRef.length == 4 ? 3 : 5]);
    var subclassShortName = splitRef.length == 4 ? null : splitRef[3];
    var subclassSource = splitRef.length == 4 ? null : splitRef[4];
    return (name.isEmpty || this.name.toLowerCase() == name) &&
        (className.isEmpty || this.className.toLowerCase() == className) &&
        (source.isEmpty || this.source.toLowerCase() == source) &&
        (level == null || this.level == level) &&
        (subclassShortName?.isEmpty ??
            false ||
                subclassShortName == this.subclassShortName?.toLowerCase()) &&
        (subclassSource?.isEmpty ??
            false || subclassSource == this.subclassSource?.toLowerCase());
  }

  static ClassFeature5e? fromReference(String? reference) {
    var splitRef = reference?.toLowerCase().split("|");

    if (splitRef == null || (splitRef.length != 4 && splitRef.length != 6)) {
      return null;
    }

    var name = splitRef[0];
    var className = splitRef[1];
    var source = splitRef[2];
    var level = int.tryParse(splitRef[splitRef.length == 4 ? 3 : 5]);
    var subClassShortName = splitRef.length == 4 ? null : splitRef[3];
    var subClassSource = splitRef.length == 4 ? null : splitRef[4];
    return DataModel5e.classFeatures.firstWhereOrNull(
      (ClassFeature5e x) =>
          (name.isEmpty || x.name.toLowerCase() == name) &&
          (className.isEmpty || x.className.toLowerCase() == className) &&
          (source.isEmpty || x.source.toLowerCase() == source) &&
          (level == null || x.level == level) &&
          ((subClassShortName?.isEmpty ?? false) ||
              subClassShortName == x.subclassShortName?.toLowerCase()) &&
          ((subClassSource?.isEmpty ?? false) ||
              subClassSource == x.subclassSource?.toLowerCase()),
    );
  }

  factory ClassFeature5e.fromJson(Map<String, dynamic> json) =>
      _$ClassFeature5eFromJson(json);

  Map<String, dynamic> toJson() => _$ClassFeature5eToJson(this);
}
