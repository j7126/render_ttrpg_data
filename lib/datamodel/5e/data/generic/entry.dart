import 'package:json_annotation/json_annotation.dart';
import 'package:render_ttrpg_data/datamodel/5e/data/ability.dart';
import 'package:render_ttrpg_data/datamodel/5e/data/class/class_feature.dart';
import 'package:render_ttrpg_data/datamodel/5e/data/data_model_5e.dart';
import 'package:render_ttrpg_data/datamodel/5e/data/feature/optional_feature.dart';
import 'package:render_ttrpg_data/datamodel/5e/data/generic/table_cell.dart';

part 'entry.g.dart';

@JsonSerializable(explicitToJson: true)
class FeatureEntry {
  FeatureEntry({
    required this.type,
    this.count,
    this.name,
    this.caption,
    this.entries,
    this.attributes,
    this.colLabels,
    this.colStyles,
    this.rows,
    this.classFeature,
    this.optionalfeature,
    this.items,
    this.subclassFeature,
  });

  FeatureEntryType type;
  int? count;
  String? name;
  String? caption;
  List<Ability>? attributes;
  List<String>? colLabels;
  List<String>? colStyles;
  List<List<TableCell>>? rows;
  String? classFeature;
  String? optionalfeature;
  String? subclassFeature;
  List<FeatureEntry>? entries;
  List<FeatureEntry>? items;

  @JsonKey(includeFromJson: false, includeToJson: true)
  ClassFeature5e? referencedFeature;

  @JsonKey(includeFromJson: false, includeToJson: true)
  OptionalFeature? referencedOptionalFeature;

  void hydrateReferences() {
    if (type == FeatureEntryType.refClassFeature) {
      referencedFeature = ClassFeature5e.fromReference(
        DataModel5e.classFeatures,
        classFeature,
      );
    } else if (type == FeatureEntryType.refOptionalfeature) {
      referencedOptionalFeature = OptionalFeature.fromReference(
        DataModel5e.optionalFeatures,
        optionalfeature,
      );
    }
  }

  factory FeatureEntry.fromJson(dynamic json) {
    if (json is String) {
      return FeatureEntry(type: FeatureEntryType.entry, name: json);
    } else {
      var feature = _$FeatureEntryFromJson(json);
      for (FeatureEntry item in feature.items ?? []) {
        if (item.type == FeatureEntryType.entry) {
          item.type = FeatureEntryType.item;
        }
      }
      return feature;
    }
  }

  Map<String, dynamic> toJson() => _$FeatureEntryToJson(this);
}

@JsonSerializable(explicitToJson: true)
class FeatureEntryPreserve {
  FeatureEntryPreserve({required this.consumes});

  bool consumes;

  factory FeatureEntryPreserve.fromJson(Map<String, dynamic> json) =>
      _$FeatureEntryPreserveFromJson(json);

  Map<String, dynamic> toJson() => _$FeatureEntryPreserveToJson(this);
}

enum FeatureEntryType {
  entries,
  list,
  item,
  table,
  options,
  abilityDc,
  abilityAttackMod,
  refClassFeature,
  refOptionalfeature,
  refSubclassFeature,
  entry,
  inset,
  quote,
  section,
}
