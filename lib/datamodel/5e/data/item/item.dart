import 'package:json_annotation/json_annotation.dart';
import 'package:render_ttrpg_data/datamodel/5e/data/book_source.dart';
import 'package:render_ttrpg_data/datamodel/5e/data/data_model_5e.dart';
import 'package:render_ttrpg_data/datamodel/5e/data/dice.dart';
import 'package:render_ttrpg_data/datamodel/5e/data/generic/entry.dart';
import 'package:render_ttrpg_data/datamodel/5e/data/item/item_like.dart';
import 'package:render_ttrpg_data/datamodel/5e/data/item/item_property.dart';
import 'package:render_ttrpg_data/datamodel/5e/data/item/weapon/weapon_category.dart';

part 'item.g.dart';

@JsonSerializable(explicitToJson: true)
class Item extends ItemLike {
  Item({
    required super.name,
    required super.source,
    super.page,
    super.otherSources,
    super.srd,
    this.baseItem,
    this.entries = const [],
    this.additionalEntries = const [],
    this.age,
    this.property = const [],
    this.weaponCategory,
    this.range,
    this.reload,
    this.dmg1,
  });

  String? baseItem;
  String? age;
  List<String> property;

  // weapon props
  WeaponCategory? weaponCategory;
  String? range;
  int? reload;
  Dice? dmg1;

  List<FeatureEntry> entries;
  List<FeatureEntry> additionalEntries;

  @JsonKey(includeFromJson: false, includeToJson: true)
  List<ItemProperty> itemProperties = [];

  factory Item.fromJson(Map<String, dynamic> json) => _$ItemFromJson(json);

  Map<String, dynamic> toJson() => _$ItemToJson(this);

  @override
  bool searchCompare(String searchString) {
    return name.toLowerCase().contains(searchString) ||
        (srd is String && srd.toLowerCase().contains(searchString)) ||
        (baseItem?.split("|")[0].toLowerCase().contains(searchString) ?? false);
  }

  @override
  void hydrateReferences() {
    itemProperties = property
        .map(
          (ref) => DataModel5e.itemProperties.firstWhere(
            (property) => property.referenceCompare(ref),
          ),
        )
        .toList();
    super.hydrateReferences();
  }
}
