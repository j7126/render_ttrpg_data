import 'package:flutter/material.dart';
import 'package:render_ttrpg_data/data_views/generic/entry_view/entry_view.dart';
import 'package:render_ttrpg_data/datamodel/5e/data/feature/optional_feature.dart';
import 'package:render_ttrpg_data/theme/text_style_extension.dart';

class OptionalFeatureView extends StatelessWidget {
  const OptionalFeatureView({
    super.key,
    required this.feature,
    this.card = true,
    this.showTitle = true,
    this.showDetailsInHeader = false,
  });

  final OptionalFeature feature;
  final bool card;
  final bool showTitle;
  final bool showDetailsInHeader;

  @override
  Widget build(BuildContext context) {
    var featureView = SizedBox(
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
                ),
                Spacer(),
                Text(
                  "optional feature",
                  style: TextTheme.of(context).bodyMedium?.withAlpha(200),
                ),
              ],
            ),
          for (var entry in feature.entries)
            EntryView(entry: entry),
        ],
      ),
    );
    return card
        ? Card(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 8.0,
                horizontal: 12.0,
              ),
              child: featureView,
            ),
          )
        : featureView;
  }
}
