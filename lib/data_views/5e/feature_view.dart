import 'package:flutter/material.dart';
import 'package:render_ttrpg_data/data_views/generic/entry_view/entry_view.dart';
import 'package:render_ttrpg_data/datamodel/5e/data/feature_like.dart';
import 'package:render_ttrpg_data/theme/text_style_extension.dart';
import 'package:render_ttrpg_data/theme/text_styles.dart';

class FeatureView extends StatelessWidget {
  const FeatureView({
    super.key,
    required this.feature,
    this.card = true,
    this.showTitle = true,
    this.showDetailsInHeader = false,
    this.collapsible = false,
  });

  final FeatureLike feature;
  final bool card;
  final bool showTitle;
  final bool showDetailsInHeader;
  final bool collapsible;

  @override
  Widget build(BuildContext context) {
    var titleRow = Row(
      children: [
        Text(
          feature.name,
          style: TextStyles.of(context).getHeadline(feature.header),
        ),
        Spacer(),
        Text(
          feature.featureSource,
          style: TextTheme.of(context).bodyMedium?.withAlpha(200),
        ),
      ],
    );
    var featureView = SizedBox(
      width: double.infinity,
      child: collapsible
          ? ExpansionTile(
              title: titleRow,
              dense: true,
              expandedCrossAxisAlignment: CrossAxisAlignment.start,
              expandedAlignment: AlignmentGeometry.centerLeft,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.zero),
              collapsedShape: RoundedRectangleBorder(
                borderRadius: BorderRadius.zero,
              ),
              childrenPadding: EdgeInsets.only(left: 8, right: 8, bottom: 8),
              tilePadding: EdgeInsets.symmetric(horizontal: 8),
              children: [
                for (var entry in feature.entries)
                  EntryView(entry: entry, header: feature.header),
              ],
            )
          : Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                if (showTitle) titleRow,
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
