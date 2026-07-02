import 'package:flutter/material.dart';
import 'package:render_ttrpg_data/data_views/generic/entry_view/entry_view.dart';
import 'package:render_ttrpg_data/datamodel/5e/data/generic/entry.dart';
import 'package:render_ttrpg_data/theme/text_styles.dart';

class InsetView extends StatelessWidget {
  const InsetView({super.key, required this.entry, required this.header});

  final FeatureEntry entry;
  final int header;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 12.0),
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(
            color: ColorScheme.of(context).onSurface.withAlpha(120),
            width: 2,
          ),
          color: ColorScheme.of(context).surfaceContainerHighest,
          boxShadow: [
            BoxShadow(color: ColorScheme.of(context).onSurface.withAlpha(150), blurRadius: 4),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                entry.name ?? "",
                style: TextStyles.of(context).getHeadline(header + 1),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 2.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    for (var entry in entry.entries ?? [])
                      EntryView(entry: entry, header: header + 1),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
