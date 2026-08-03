import 'package:collection/collection.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:render_ttrpg_data/datamodel/5e/data/book_source.dart';
import 'package:render_ttrpg_data/datamodel/5e/data/feature_like.dart';
import 'package:render_ttrpg_data/datamodel/5e/data/generic/entry.dart';

part 'class_feature.g.dart';

@JsonSerializable(explicitToJson: true)
class ClassFeature5e extends FeatureLike {
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
  });

  String className;
  String classSource;
  int level;
  String? subclassShortName;
  String? subclassSource;

  @override
  String get featureSource => subclassShortName != null
      ? "$className | $subclassShortName | LVL $level"
      : "$className | LVL $level";

  @override
  int get order => level;

  bool matchesReference(String reference) {
    var splitRef = reference.split("|");

    if (splitRef.length != 4 && splitRef.length != 6) {
      return false;
    }

    var name = splitRef[0];
    var className = splitRef[1];
    var source = splitRef[2];
    var level = int.tryParse(splitRef[splitRef.length == 4 ? 3 : 5]);
    var subclassShortName = splitRef.length == 4 ? null : splitRef[3];
    var subclassSource = splitRef.length == 4 ? null : splitRef[4];
    return (name.isEmpty || this.name == name) &&
        (className.isEmpty || this.className == className) &&
        (source.isEmpty || this.source == source) &&
        (level == null || this.level == level) &&
        (subclassShortName?.isEmpty ??
            false || subclassShortName == this.subclassShortName) &&
        (subclassSource?.isEmpty ??
            false || subclassSource == this.subclassSource);
  }

  static ClassFeature5e? fromReference(
    List<ClassFeature5e>? features,
    String? reference,
  ) {
    var splitRef = reference?.split("|");

    if (features == null ||
        splitRef == null ||
        (splitRef.length != 4 && splitRef.length != 6)) {
      return null;
    }

    var name = splitRef[0];
    var className = splitRef[1];
    var source = splitRef[2];
    var level = int.tryParse(splitRef[splitRef.length == 4 ? 3 : 5]);
    var subClassShortName = splitRef.length == 4 ? null : splitRef[3];
    var subClassSource = splitRef.length == 4 ? null : splitRef[4];
    return features.firstWhereOrNull(
      (ClassFeature5e x) =>
          (name.isEmpty || x.name == name) &&
          (className.isEmpty || x.className == className) &&
          (source.isEmpty || x.source == source) &&
          (level == null || x.level == level) &&
          ((subClassShortName?.isEmpty ?? false) ||
              subClassShortName == x.subclassShortName) &&
          ((subClassSource?.isEmpty ?? false) ||
              subClassSource == x.subclassSource),
    );
  }

  factory ClassFeature5e.fromJson(Map<String, dynamic> json) =>
      _$ClassFeature5eFromJson(json);

  Map<String, dynamic> toJson() => _$ClassFeature5eToJson(this);
}
