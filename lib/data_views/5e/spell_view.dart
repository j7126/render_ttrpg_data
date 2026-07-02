import 'package:flutter/material.dart';
import 'package:render_ttrpg_data/data_views/generic/entry_view/entry_view.dart';
import 'package:render_ttrpg_data/datamodel/5e/data/spell/spell.dart';
import 'package:render_ttrpg_data/widgets/fixed_thumb_scroll_view.dart';

class SpellView extends StatelessWidget {
  const SpellView({
    super.key,
    required this.spell,
    this.card = true,
    this.outlined = false,
    this.scrollable = false,
  });

  final Spell spell;
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
          Text(spell.name, style: TextTheme.of(context).headlineSmall),
          for (var entry in spell.entries) EntryView(entry: entry, header: 1),
          for (var entry in spell.entriesHigherLevel)
            EntryView(entry: entry, header: 1),
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
