import 'package:flutter/material.dart';
import 'package:render_ttrpg_data/data_views/5e/feature_view.dart';
import 'package:render_ttrpg_data/datamodel/5e/data/class/subclass.dart';
import 'package:render_ttrpg_data/widgets/fixed_thumb_scroll_view.dart';

class SubclassView extends StatelessWidget {
  const SubclassView({
    super.key,
    required this.subclass,
    this.showTitle = true,
    this.level,
    this.padding,
    this.card = true,
    this.outlined = false,
    this.scrollable = false,
  });

  final SubClass subclass;
  final bool showTitle;
  final int? level;
  final EdgeInsetsGeometry? padding;
  final bool card;
  final bool outlined;
  final bool scrollable;

  @override
  Widget build(BuildContext context) {
    Widget child = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (showTitle)
          Text(
            subclass.name,
            style: Theme.of(context).textTheme.headlineMedium,
          ),
        for (var feat in subclass.subclassFeatures) ...[
          if (level == null || feat.level <= level!)
            FeatureView(feature: feat, card: false),
        ],
      ],
    );
    if (scrollable) {
      child = FixedThumbScrollView(child: child);
    }
    if (card) {
      child = Padding(
        padding:
            padding ?? EdgeInsets.symmetric(vertical: 8.0, horizontal: 12.0),
        child: child,
      );
      child = outlined ? Card.outlined(child: child) : Card(child: child);
    }
    return child;
  }
}
