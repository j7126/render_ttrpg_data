import 'package:flutter/material.dart';
import 'package:render_ttrpg_data/data_views/generic/entry_view/entry_view.dart';
import 'package:render_ttrpg_data/datamodel/5e/data/creature_size.dart';
import 'package:render_ttrpg_data/datamodel/5e/data/race/race.dart';
import 'package:render_ttrpg_data/theme/text_styles.dart';
import 'package:render_ttrpg_data/widgets/fixed_thumb_scroll_view.dart';

class RaceView extends StatelessWidget {
  const RaceView({
    super.key,
    required this.race,
    this.card = true,
    this.outlined = false,
    this.scrollable = false,
  });

  final Race race;
  final bool card;
  final bool outlined;
  final bool scrollable;

  @override
  Widget build(BuildContext context) {
    var featureView = SizedBox(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(race.name, style: TextTheme.of(context).headlineSmall),
          Row(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text("Size: ", style: TextStyles.of(context).getHeadline(2)),
              Text(
                race.size
                    .map(
                      (size) => switch (size) {
                        CreatureSize.large => "Large",
                        CreatureSize.medium => "Medium",
                        CreatureSize.small => "Small",
                        CreatureSize.varies => "Varies",
                      },
                    )
                    .join(", "),
              ),
            ],
          ),
          Row(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text("Speed: ", style: TextStyles.of(context).getHeadline(2)),
              Text("${race.speed.walkSpeed} feet"),
              if (race.speed.flySpeed != null)
                Text(", fly ${race.speed.flySpeed} feet")
              else if (race.speed.flying)
                Text(", fly equal to your walking speed"),
              if (race.speed.swimSpeed != null)
                Text(", swim ${race.speed.swimSpeed} feet")
              else if (race.speed.swimming)
                Text(", swim equal to your walking speed"),
            ],
          ),
          for (var entry in race.entries) EntryView(entry: entry, header: 1),
        ],
      ),
    );
    Widget child = featureView;
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
