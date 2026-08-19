import 'package:json_annotation/json_annotation.dart';
import 'package:render_ttrpg_data/datamodel/5e/data/interface/additional_spells_mixin.dart';
import 'package:render_ttrpg_data/datamodel/5e/data/interface/base_object.dart';
import 'package:render_ttrpg_data/datamodel/5e/data/book_source.dart';
import 'package:render_ttrpg_data/datamodel/5e/data/class/class_feature.dart';
import 'package:render_ttrpg_data/datamodel/5e/data/interface/optional_feature_progression_mixin.dart';
import 'package:render_ttrpg_data/datamodel/5e/data/interface/source_label_mixin.dart';
import 'package:render_ttrpg_data/datamodel/5e/data/optional_feature_progression.dart';

part 'subclass.g.dart';

@JsonSerializable(explicitToJson: true)
class SubClass extends NamedBaseObject
    with
        ReferenceMixin,
        SourceLabelMixin,
        AdditionalSpellsMixin,
        OptionalFeatureProgressionMixin {
  SubClass({
    required super.name,
    required super.source,
    required super.page,
    super.otherSources,
    super.srd,
    required this.shortName,
    required this.className,
    required this.classSource,
  });

  String shortName;
  String className;
  String classSource;

  @override
  String get sourceLabel => "$className | $shortName";

  @override
  String get refString => "{@subclass $name|$className|$source|$classSource}";

  @JsonKey(includeFromJson: false, includeToJson: false)
  List<ClassFeature5e> subclassFeatures = [];

  bool refCompare(String searchString) {
    var splitElements = searchString.split("|");
    return splitElements.length == 4 &&
        (name.toLowerCase() == splitElements[0] ||
            (srd is String && srd.toLowerCase() == splitElements[0])) &&
        className.toLowerCase() == splitElements[1].toLowerCase() &&
        (splitElements[2].isEmpty ||
            source.toLowerCase() == splitElements[2].toLowerCase()) &&
        (splitElements[3].isEmpty ||
            classSource.toLowerCase() == splitElements[3].toLowerCase());
  }

  factory SubClass.fromJson(Map<String, dynamic> json) {
    var result = _$SubClassFromJson(json);
    for (var feat in json["subclassFeatures"]) {
      String featString = "";
      if (feat is String) {
        featString = feat;
      }
      var feature = ClassFeature5e.fromReference(featString);
      if (feature != null) {
        result.subclassFeatures.add(feature);
      }
    }
    return result;
  }

  Map<String, dynamic> toJson() => _$SubClassToJson(this);
}
