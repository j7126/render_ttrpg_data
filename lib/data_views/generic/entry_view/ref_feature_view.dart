import 'package:flutter/material.dart';
import 'package:render_ttrpg_data/data_views/5e/feature_view.dart';
import 'package:render_ttrpg_data/datamodel/5e/data/feature/entry.dart';

class RefFeatureView extends StatelessWidget {
  const RefFeatureView({super.key, required this.entry});

  final FeatureEntry entry;

  @override
  Widget build(BuildContext context) {
    if (entry.referencedFeature != null) {
      return FeatureView(feature: entry.referencedFeature!, card: false);
    } else {
      return Container();
    }
  }
}
