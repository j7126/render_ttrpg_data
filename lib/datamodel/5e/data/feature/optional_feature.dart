import 'package:collection/collection.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:render_ttrpg_data/datamodel/5e/data/base_object.dart';
import 'package:render_ttrpg_data/datamodel/5e/data/book_source.dart';
import 'package:render_ttrpg_data/datamodel/5e/data/feature/entry.dart';

part 'optional_feature.g.dart';

@JsonSerializable(explicitToJson: true)
class OptionalFeature extends BaseObject {
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

  @JsonKey(includeFromJson: false, includeToJson: true)
  List<FeatureEntry> entries;

  static OptionalFeature? fromReference(
    List<OptionalFeature>? features,
    String? reference,
  ) {
    var splitRef = reference?.split("|");

    if (features == null || splitRef == null || splitRef.isEmpty || splitRef[0].isEmpty) {
      return null;
    }

    var name = splitRef[0];
    var source = splitRef.length > 1 ? splitRef[1] : "";
    return features.firstWhereOrNull(
      (OptionalFeature x) =>
          (x.name == name) &&
          (source.isEmpty || x.source == source)
    );
  }

  factory OptionalFeature.fromJson(Map<String, dynamic> json) {
    var feature = _$OptionalFeatureFromJson(json);
    var entries = <FeatureEntry>[];
    for (var entry in json["entries"] as List<dynamic>) {
      if (entry is String) {
        entries.add(FeatureEntry(type: FeatureEntryType.entry, name: entry));
      } else if (entry is Map<String, dynamic>) {
        entries.add(FeatureEntry.fromJson(entry));
      }
    }
    feature.entries = entries;
    return feature;
  }

  Map<String, dynamic> toJson() => _$OptionalFeatureToJson(this);
}
