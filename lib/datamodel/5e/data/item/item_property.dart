import 'package:json_annotation/json_annotation.dart';
import 'package:render_ttrpg_data/datamodel/5e/data/interface/base_object.dart';
import 'package:render_ttrpg_data/datamodel/5e/data/book_source.dart';
import 'package:render_ttrpg_data/datamodel/5e/data/generic/entry.dart';

part 'item_property.g.dart';

@JsonSerializable(explicitToJson: true)
class ItemProperty extends BaseObject {
  ItemProperty({
    required super.source,
    super.page,
    super.otherSources,
    super.srd,
    this.abbreviation,
    this.template,
    this.entries = const [],
  });

  String? abbreviation;
  String? template;
  List<FeatureEntry> entries;

  factory ItemProperty.fromJson(Map<String, dynamic> json) =>
      _$ItemPropertyFromJson(json);

  Map<String, dynamic> toJson() => _$ItemPropertyToJson(this);

  bool referenceCompare(String ref) {
    var contentParts = ref.split("|");
    return contentParts.isNotEmpty &&
        contentParts[0] == abbreviation &&
        (contentParts.length < 2 || source == contentParts[1]);
  }
}
