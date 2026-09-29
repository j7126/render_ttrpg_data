import 'package:flutter/material.dart';
import 'package:render_ttrpg_data/data_views/generic/entry_view/entry_view.dart';
import 'package:render_ttrpg_data/datamodel/5e/data/background/background.dart';
import 'package:render_ttrpg_data/theme/text_styles.dart';
import 'package:render_ttrpg_data/widgets/fixed_thumb_scroll_view.dart';

class BackgroundView extends StatelessWidget {
  const BackgroundView({
    super.key,
    required this.background,
    this.card = true,
    this.outlined = false,
    this.scrollable = false,
  });

  final Background background;
  final bool card;
  final bool outlined;
  final bool scrollable;

  @override
  Widget build(BuildContext context) {
    var featureView = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(background.name, style: TextTheme.of(context).headlineSmall),
        Row(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(
              "Skill Proficiencies: ",
              style: TextStyles.of(context).getHeadline(2),
            ),
            Text(background.skillProficiencyDisplayString),
          ],
        ),
        for (var entry in background.entries)
          EntryView(entry: entry, header: 1),
      ],
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
