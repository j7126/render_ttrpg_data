import 'package:flutter/material.dart';
import 'package:render_ttrpg_data/data_views/generic/entry_view/entry_view.dart';
import 'package:render_ttrpg_data/data_views/generic/entry_view/text_view.dart';
import 'package:render_ttrpg_data/datamodel/5e/data/feature/optional_feature.dart';
import 'package:render_ttrpg_data/datamodel/5e/data/generic/entry.dart';
import 'package:render_ttrpg_data/datamodel/5e/data/interface/feature_like.dart';
import 'package:render_ttrpg_data/theme/text_style_extension.dart';
import 'package:render_ttrpg_data/theme/text_styles.dart';
import 'package:render_ttrpg_data/widgets/fixed_thumb_scroll_view.dart';

class FeatureView extends StatelessWidget {
  const FeatureView({
    super.key,
    required this.feature,
    this.card = true,
    this.showTitle = true,
    this.showDetailsInHeader = false,
    this.collapsible = false,
    this.outlined = false,
    this.scrollable = false,
    this.header,
    this.hiddenEntryTypes = const {},
    this.shouldReplaceEntryViewFunc,
    this.entryViewReplacementBuilder,
  });

  final FeatureLike feature;
  final bool card;
  final bool showTitle;
  final bool showDetailsInHeader;
  final bool collapsible;
  final bool outlined;
  final bool scrollable;
  final int? header;
  final Set<FeatureEntryType> hiddenEntryTypes;
  final bool Function(FeatureEntry entry)? shouldReplaceEntryViewFunc;
  final Widget? Function(BuildContext context, FeatureEntry entry)?
  entryViewReplacementBuilder;

  @override
  Widget build(BuildContext context) {
    var titleRow = Row(
      children: [
        Text(
          feature.name,
          style: TextStyles.of(context).getHeadline(header ?? feature.header),
        ),
        Spacer(),
        Text(
          feature is OptionalFeature ? "optional feature" : feature.sourceLabel,
          style: TextTheme.of(context).bodyMedium?.withAlpha(200),
        ),
      ],
    );
    var prerequisiteStrings = feature.prerequisite
        ?.map((x) => x.getDisplayString())
        .nonNulls
        .toList();
    var children = <Widget>[
      if (prerequisiteStrings?.isNotEmpty == true)
        Row(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(
              "Prerequisite: ",
              style: TextStyles.of(context).getHeadline(2),
            ),
            for (var i = 0; i < prerequisiteStrings!.length; i++) ...[
              TextView(prerequisiteStrings[i]),
              if (i < prerequisiteStrings.length - 1)
                Text(
                  " or ",
                  style: TextStyle(
                    color: ColorScheme.of(context).onSurface.withAlpha(150),
                  ),
                ),
            ],
          ],
        ),
      for (var entry in feature.entries)
        if (entryViewReplacementBuilder != null &&
            (shouldReplaceEntryViewFunc?.call(entry) ?? false))
          entryViewReplacementBuilder!(context, entry) ?? Container()
        else
          EntryView(
            entry: entry,
            header: header ?? feature.header,
            hiddenEntryTypes: hiddenEntryTypes,
          ),
    ];
    Widget child = SizedBox(
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
              children: children,
            )
          : Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [if (showTitle) titleRow, ...children],
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
