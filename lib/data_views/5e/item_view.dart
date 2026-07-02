import 'package:flutter/material.dart';
import 'package:render_ttrpg_data/data_views/generic/entry_view/entry_view.dart';
import 'package:render_ttrpg_data/datamodel/5e/data/generic/entry.dart';
import 'package:render_ttrpg_data/datamodel/5e/data/item/item.dart';
import 'package:render_ttrpg_data/datamodel/5e/data/item/item_group.dart';
import 'package:render_ttrpg_data/datamodel/5e/data/item/item_like.dart';
import 'package:render_ttrpg_data/theme/text_styles.dart';
import 'package:render_ttrpg_data/widgets/fixed_thumb_scroll_view.dart';

class ItemView extends StatelessWidget {
  const ItemView({
    super.key,
    required this.item,
    this.card = true,
    this.outlined = false,
    this.scrollable = false,
  });

  final ItemLike item;
  final bool card;
  final bool outlined;
  final bool scrollable;

  @override
  Widget build(BuildContext context) {
    var featureView = SizedBox(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(item.name, style: TextTheme.of(context).headlineSmall),
          if (item is Item)
            for (var entry in (item as Item).entries)
              EntryView(entry: entry, header: 1),
          if (item.itemType != null) ...[
            if (item.itemType!.entries.isNotEmpty &&
                item.itemType!.entries.first.type != FeatureEntryType.entries)
              Text(
                item.itemType!.name,
                style: TextStyles.of(context).getHeadline(2),
              ),
            for (var entry in item.itemType!.entries)
              EntryView(entry: entry, header: 1),
          ],
          if (item is Item)
            for (var property in (item as Item).itemProperties)
              for (var entry in property.entries)
                EntryView(entry: entry, header: 1),
          if (item is Item)
            for (var entry in (item as Item).additionalEntries)
              EntryView(entry: entry, header: 1),
          if (item is ItemGroup) ...[
            Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: Text("Multiple variations of this item exist, as listed below:"),
            ),
            EntryView(
              entry: FeatureEntry(
                type: FeatureEntryType.list,
                items: [
                  for (var listEntry in (item as ItemGroup).items)
                    FeatureEntry(
                      type: FeatureEntryType.item,
                      name: "{@item $listEntry}",
                    ),
                ],
              ),
            ),
          ],
        ],
      ),
    );
    Widget child = featureView;
    if (scrollable) {
      child = FixedThumbScrollView(child: child);
    }
    if (card) {
      child = Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 12.0),
        child: child,
      );
      child = outlined ? Card.outlined(child: child) : Card(child: child);
    }
    return child;
  }
}
