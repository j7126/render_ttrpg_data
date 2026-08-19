import 'package:json_annotation/json_annotation.dart';
import 'package:render_ttrpg_data/datamodel/5e/data/interface/base_object.dart';
import 'package:render_ttrpg_data/datamodel/5e/data/book_source.dart';
import 'package:render_ttrpg_data/datamodel/5e/data/generic/entry.dart';

part 'item_type.g.dart';

@JsonSerializable(explicitToJson: true)
class ItemType extends NamedBaseObject {
  ItemType({
    required super.name,
    required super.source,
    super.page,
    super.otherSources,
    super.srd,
    this.abbreviation,
    this.entries = const [],
  });

  String? abbreviation;
  List<FeatureEntry> entries;

  factory ItemType.fromJson(Map<String, dynamic> json) =>
      _$ItemTypeFromJson(json);

  Map<String, dynamic> toJson() => _$ItemTypeToJson(this);

  bool searchCompare(String searchString) {
    return name.toLowerCase().contains(searchString) ||
        (srd is String && srd.toLowerCase().contains(searchString));
  }
}
