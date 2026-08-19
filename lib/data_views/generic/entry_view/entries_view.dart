import 'package:flutter/material.dart';
import 'package:render_ttrpg_data/data_views/generic/entry_view/entry_view.dart';
import 'package:render_ttrpg_data/datamodel/5e/data/generic/entry.dart';
import 'package:render_ttrpg_data/theme/text_styles.dart';

class EntriesView extends StatelessWidget {
  const EntriesView({
    super.key,
    required this.entry,
    required this.header,
    this.hiddenEntryTypes = const {},
  });

  final FeatureEntry entry;
  final int header;
  final Set<FeatureEntryType> hiddenEntryTypes;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
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
                for (var entry in entry.entries ?? <FeatureEntry>[])
                  if (!hiddenEntryTypes.contains(entry.type))
                    EntryView(entry: entry, header: header + 1),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
