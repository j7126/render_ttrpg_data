import 'package:json_annotation/json_annotation.dart';
import 'package:render_ttrpg_data/datamodel/5e/data/base_object.dart';
import 'package:render_ttrpg_data/datamodel/5e/data/book_source.dart';
import 'package:render_ttrpg_data/datamodel/5e/data/class/class_feature.dart';

part 'subclass.g.dart';

@JsonSerializable(explicitToJson: true)
class SubClass extends NamedBaseObject with WithReference {
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
  String get refString => "{@subclass $name|$className|$source|$classSource}";

  @JsonKey(includeFromJson: false, includeToJson: false)
  List<ClassFeature5e> subclassFeatures = [];

  factory SubClass.fromJson(
    Map<String, dynamic> json,
    List<ClassFeature5e> classFeatures,
  ) {
    var result = _$SubClassFromJson(json);
    for (var feat in json["subclassFeatures"]) {
      String featString = "";
      if (feat is String) {
        featString = feat;
      }
      var feature = ClassFeature5e.fromReference(classFeatures, featString);
      if (feature != null) {
        result.subclassFeatures.add(feature);
      }
    }
    return result;
  }

  Map<String, dynamic> toJson() => _$SubClassToJson(this);
}
