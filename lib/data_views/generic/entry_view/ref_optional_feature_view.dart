import 'package:flutter/material.dart';
import 'package:render_ttrpg_data/data_views/5e/optional_feature_view.dart';
import 'package:render_ttrpg_data/datamodel/5e/data/feature/entry.dart';

class RefOptionalFeatureView extends StatelessWidget {
  const RefOptionalFeatureView({super.key, required this.entry});

  final FeatureEntry entry;

  @override
  Widget build(BuildContext context) {
    if (entry.referencedOptionalFeature != null) {
      return OptionalFeatureView(feature: entry.referencedOptionalFeature!, card: false);
    } else {
      return Container();
    }
  }
}
