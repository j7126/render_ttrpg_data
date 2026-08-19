import 'package:collection/collection.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:render_ttrpg_data/datamodel/5e/data/data_model_5e.dart';
import 'package:render_ttrpg_data/datamodel/5e/data/interface/base_object.dart';
import 'package:render_ttrpg_data/datamodel/5e/data/book_source.dart';
import 'package:render_ttrpg_data/datamodel/5e/data/generic/entry.dart';

part 'optional_feature.g.dart';

@JsonSerializable(explicitToJson: true)
class OptionalFeature extends NamedBaseObject with ReferenceMixin {
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
  String get refString => "{@optfeature $name|$source}";

  static OptionalFeature? fromReference(String? reference) {
    var splitRef = reference?.toLowerCase().split("|");

    if (splitRef == null || splitRef.isEmpty || splitRef[0].isEmpty) {
      return null;
    }

    var name = splitRef[0];
    var source = splitRef.length > 1 ? splitRef[1] : "";
    return DataModel5e.optionalFeatures.firstWhereOrNull(
      (OptionalFeature x) =>
          (x.name.toLowerCase() == name) &&
          (source.isEmpty || x.source.toLowerCase() == source),
    );
  }

  factory OptionalFeature.fromJson(Map<String, dynamic> json) =>
      _$OptionalFeatureFromJson(json);

  Map<String, dynamic> toJson() => _$OptionalFeatureToJson(this);
}
