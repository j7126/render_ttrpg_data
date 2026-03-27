import 'package:flutter/material.dart';
import 'package:render_ttrpg_data/data_views/generic/entry_view/entry_view.dart';
import 'package:render_ttrpg_data/datamodel/5e/data/class/class_feature.dart';
import 'package:render_ttrpg_data/theme/text_style_extension.dart';
import 'package:render_ttrpg_data/theme/text_styles.dart';

class FeatureView extends StatelessWidget {
  const FeatureView({
    super.key,
    required this.feature,
    this.card = true,
    this.showTitle = true,
    this.showDetailsInHeader = false,
  });

  final ClassFeature5e feature;
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
                  style: TextStyles.of(context).getHeadline(feature.header),
                ),
                Spacer(),
                Text(
                  "${feature.className} | LVL ${feature.level}",
                  style: TextTheme.of(context).bodyMedium?.withAlpha(200),
                ),
              ],
            ),
          for (var entry in feature.entries)
            EntryView(entry: entry, header: feature.header),
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
