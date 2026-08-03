import 'package:flutter/material.dart';
import 'package:render_ttrpg_data/data_views/5e/optional_feature_view.dart';
import 'package:render_ttrpg_data/datamodel/5e/data/generic/entry.dart';

class RefOptionalFeatureView extends StatelessWidget {
  const RefOptionalFeatureView({
    super.key,
    required this.entry,
    this.header = 1,
  });

  final FeatureEntry entry;
  final int header;

  @override
  Widget build(BuildContext context) {
    if (entry.referencedOptionalFeature != null) {
      return OptionalFeatureView(
        feature: entry.referencedOptionalFeature!,
        card: false,
        header: header,
      );
    } else {
      return Container();
    }
  }
}
