import 'package:flutter/material.dart';
import 'package:render_ttrpg_data/data_views/5e/feature_view.dart';
import 'package:render_ttrpg_data/datamodel/5e/data/class/class.dart';
import 'package:render_ttrpg_data/datamodel/5e/data/class/subclass.dart';

class ClassView extends StatelessWidget {
  const ClassView({
    super.key,
    required this.class5e,
    this.showTitle = true,
    this.level,
    this.padding,
    this.card = true,
    this.subClass,
  });

  final Class5e class5e;
  final bool showTitle;
  final int? level;
  final EdgeInsetsGeometry? padding;
  final bool card;
  final SubClass? subClass;

  @override
  Widget build(BuildContext context) {
    SubClass? subClass = this.subClass;
    if (subClass?.className != class5e.name ||
        subClass?.classSource != class5e.source) {
      subClass = null;
    }

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
            for (var feat in class5e.classFeatures) ...[
              if (level == null || feat.level <= level!)
                FeatureView(feature: feat, card: card),
              if (subClass != null &&
                  class5e.gainSubClassFeatures.any(feat.matchesReference))
                for (var subFeat in subClass.subclassFeatures)
                  if (subFeat.level == feat.level)
                    FeatureView(feature: subFeat, card: card),
            ],
          ],
        ),
      ),
    );
  }
}
