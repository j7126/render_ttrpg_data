import 'package:flutter/material.dart';
import 'package:render_ttrpg_data/data_views/generic/entry_view/entry_view.dart';
import 'package:render_ttrpg_data/datamodel/5e/data/feature/optional_feature.dart';
import 'package:render_ttrpg_data/theme/text_style_extension.dart';
import 'package:render_ttrpg_data/theme/text_styles.dart';
import 'package:render_ttrpg_data/widgets/fixed_thumb_scroll_view.dart';

class OptionalFeatureView extends StatelessWidget {
  const OptionalFeatureView({
    super.key,
    required this.feature,
    this.card = true,
    this.showTitle = true,
    this.showDetailsInHeader = false,
    this.header = 1,
    this.outlined = false,
    this.scrollable = false,
  });

  final OptionalFeature feature;
  final bool card;
  final bool showTitle;
  final bool showDetailsInHeader;
  final int header;
  final bool outlined;
  final bool scrollable;

  @override
  Widget build(BuildContext context) {
    Widget child = SizedBox(
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          if (showTitle)
            Row(
              children: [
                Text(
                  feature.name,
                  style: TextStyles.of(context).getHeadline(header + 1),
                ),
                Spacer(),
                Text(
                  "optional feature",
                  style: TextTheme.of(context).bodyMedium?.withAlpha(200),
                ),
              ],
            ),
          for (var entry in feature.entries) EntryView(entry: entry),
        ],
      ),
    );
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
