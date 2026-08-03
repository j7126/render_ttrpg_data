import 'package:flutter/material.dart';
import 'package:render_ttrpg_data/data_views/generic/entry_view/entry_view.dart';
import 'package:render_ttrpg_data/datamodel/5e/data/spell/spell.dart';
import 'package:render_ttrpg_data/datamodel/5e/data/spell/spell_range.dart';
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

  String ordinal(int number) => number >= 11 && number <= 13
      ? "${number}th"
      : switch (number % 10) {
          1 => "${number}st",
          2 => "${number}nd",
          3 => "${number}rd",
          _ => "${number}th",
        };

  @override
  Widget build(BuildContext context) {
    var featureView = SizedBox(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(spell.name, style: TextTheme.of(context).headlineSmall),
          Text(
            spell.level == 0
                ? "${spell.school.name.toLowerCase()} cantrip"
                : "${ordinal(spell.level)}-level ${spell.school.name.toLowerCase()}",
            style: TextStyle(fontStyle: FontStyle.italic),
          ),
          if (spell.time.isNotEmpty)
            Row(
              children: [
                Text(
                  "Casting Time: ",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                for (var time in spell.time)
                  Text("${time.number} ${time.unit.name} "),
              ],
            ),
          Row(
            children: [
              Text("Range: ", style: TextStyle(fontWeight: FontWeight.bold)),
              if (spell.range.distance != null)
                Text(
                  "${spell.range.distance!.amount ?? 0} ${spell.range.distance!.type.name}",
                ),
              if (spell.range.type != SpellRangeType.point)
                Text(spell.range.type.name),
            ],
          ),
          if (spell.duration.isNotEmpty)
            Row(
              children: [
                Text(
                  "Duration: ",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                for (var duration in spell.duration)
                  Text(duration.type.name),
              ],
            ),
          Divider(),
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
