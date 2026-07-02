import 'package:json_annotation/json_annotation.dart';
import 'package:render_ttrpg_data/datamodel/5e/data/book_source.dart';
import 'package:render_ttrpg_data/datamodel/5e/data/item/item_like.dart';
part 'item_group.g.dart';

@JsonSerializable(explicitToJson: true)
class ItemGroup extends ItemLike {
  ItemGroup({
    required super.name,
    required super.source,
    super.page,
    super.otherSources,
    super.srd,
    super.basicRules,
    super.type,
    this.rarity,
    required this.items,
  });

  String? rarity;
  List<String> items;

  factory ItemGroup.fromJson(Map<String, dynamic> json) {
    return _$ItemGroupFromJson(json);
  }

  Map<String, dynamic> toJson() => _$ItemGroupToJson(this);

  @override
  bool searchCompare(String searchString) {
    return name.toLowerCase().contains(searchString) ||
        (srd is String && srd.toLowerCase().contains(searchString));
  }
}
