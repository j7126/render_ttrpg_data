import 'package:collection/collection.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:render_ttrpg_data/datamodel/5e/data/interface/base_object.dart';
import 'package:render_ttrpg_data/datamodel/5e/data/data_model_5e.dart';
import 'package:render_ttrpg_data/datamodel/5e/data/item/item_type.dart';

abstract class ItemLike extends NamedBaseObject {
  ItemLike({
    required super.name,
    required super.source,
    super.page,
    super.otherSources,
    super.srd,
    super.basicRules,
    this.type,
  });

  String? type;

  @JsonKey(includeFromJson: false, includeToJson: true)
  ItemType? itemType;

  bool searchCompare(String searchString);

  void hydrateReferences() {
    itemType = DataModel5e.itemTypes.firstWhereOrNull(
      (x) => x.abbreviation == type,
    );
  }
}
