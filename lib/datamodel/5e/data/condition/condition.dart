import 'package:json_annotation/json_annotation.dart';
import 'package:render_ttrpg_data/datamodel/5e/data/interface/base_object.dart';
import 'package:render_ttrpg_data/datamodel/5e/data/book_source.dart';
import 'package:render_ttrpg_data/datamodel/5e/data/generic/entry.dart';

part 'condition.g.dart';

@JsonSerializable(explicitToJson: true)
class Condition extends NamedBaseObject {
  Condition({
    required super.name,
    required super.source,
    super.page,
    super.otherSources,
    super.srd,
    this.entries = const [],
  });

  List<FeatureEntry> entries;

  factory Condition.fromJson(Map<String, dynamic> json) =>
      _$ConditionFromJson(json);

  Map<String, dynamic> toJson() => _$ConditionToJson(this);

  bool searchCompare(String searchString) {
    return name.toLowerCase().contains(searchString) ||
        (srd is String && srd.toLowerCase().contains(searchString));
  }

  bool refCompare(String searchString) {
    return name.toLowerCase() == searchString ||
        (srd is String && srd.toLowerCase() == searchString);
  }
}
