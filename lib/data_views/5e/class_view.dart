import 'package:flutter/material.dart';
import 'package:render_ttrpg_data/data_views/5e/feature_view.dart';
import 'package:render_ttrpg_data/datamodel/5e/data/class/class.dart';

class ClassView extends StatelessWidget {
  const ClassView({
    super.key,
    required this.class5e,
    this.showTitle = true,
    this.level,
    this.padding,
    this.card = true,
  });

  final Class5e class5e;
  final bool showTitle;
  final int? level;
  final EdgeInsetsGeometry? padding;
  final bool card;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding:
            padding ?? EdgeInsets.symmetric(vertical: 8.0, horizontal: 12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (showTitle)
              Text(
                class5e.name,
                style: Theme.of(context).textTheme.headlineMedium,
              ),
            for (var feat in class5e.classFeatures)
              if (level == null || feat.level <= level!)
                FeatureView(feature: feat, card: card),
          ],
        ),
      ),
    );
  }
}
