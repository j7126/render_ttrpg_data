import 'package:collection/collection.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:render_ttrpg_data/datamodel/5e/data/base_object.dart';
import 'package:render_ttrpg_data/datamodel/5e/data/book_source.dart';
import 'package:render_ttrpg_data/datamodel/5e/data/generic/entry.dart';

part 'optional_feature.g.dart';

@JsonSerializable(explicitToJson: true)
class OptionalFeature extends NamedBaseObject {
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

  static OptionalFeature? fromReference(
    List<OptionalFeature>? features,
    String? reference,
  ) {
    var splitRef = reference?.split("|");

    if (features == null ||
        splitRef == null ||
        splitRef.isEmpty ||
        splitRef[0].isEmpty) {
      return null;
    }

    var name = splitRef[0];
    var source = splitRef.length > 1 ? splitRef[1] : "";
    return features.firstWhereOrNull(
      (OptionalFeature x) =>
          (x.name == name) && (source.isEmpty || x.source == source),
    );
  }

  factory OptionalFeature.fromJson(Map<String, dynamic> json) =>
      _$OptionalFeatureFromJson(json);

  Map<String, dynamic> toJson() => _$OptionalFeatureToJson(this);
}
