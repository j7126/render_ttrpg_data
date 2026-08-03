import 'package:flutter/material.dart';
import 'package:render_ttrpg_data/data_views/generic/entry_view/entry_view.dart';
import 'package:render_ttrpg_data/datamodel/5e/data/generic/entry.dart';

class OptionsView extends StatelessWidget {
  const OptionsView({super.key, required this.entry, this.header = 1});

  final FeatureEntry entry;
  final int header;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 2.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                for (var entry in entry.entries ?? [])
                  Padding(
                    padding: const EdgeInsets.only(bottom: 6.0),
                    child: EntryView(entry: entry, header: header + 1),
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
