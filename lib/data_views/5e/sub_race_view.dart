import 'package:flutter/material.dart';
import 'package:render_ttrpg_data/data_views/generic/entry_view/entry_view.dart';
import 'package:render_ttrpg_data/datamodel/5e/data/creature_size.dart';
import 'package:render_ttrpg_data/datamodel/5e/data/race/race.dart';
import 'package:render_ttrpg_data/datamodel/5e/data/race/subrace/sub_race.dart';
import 'package:render_ttrpg_data/theme/text_styles.dart';
import 'package:render_ttrpg_data/widgets/fixed_thumb_scroll_view.dart';

class SubRaceView extends StatelessWidget {
  const SubRaceView({
    super.key,
    required this.race,
    required this.subRace,
    this.card = true,
    this.outlined = false,
    this.scrollable = false,
  });

  final Race race;
  final SubRace subRace;
  final bool card;
  final bool outlined;
  final bool scrollable;

  @override
  Widget build(BuildContext context) {
    var name = subRace.name == null
        ? subRace.raceName
        : "${subRace.raceName} (${subRace.name})";
    var ability = subRace.ability?.firstOrNull ?? race.ability?.firstOrNull;
    var size = subRace.size ?? race.size;
    var speed = subRace.speed ?? race.speed;

    var featureView = SizedBox(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(name, style: TextTheme.of(context).headlineSmall),
          if (ability != null)
            Row(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  "Ability Scores: ",
                  style: TextStyles.of(context).getHeadline(2),
                ),
                Text(ability.getDisplayText()),
              ],
            ),
          Row(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text("Size: ", style: TextStyles.of(context).getHeadline(2)),
              Text(
                size
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
              Text("${speed.walkSpeed} feet"),
              if (speed.flySpeed != null)
                Text(", fly ${speed.flySpeed} feet")
              else if (speed.flying)
                Text(", fly equal to your walking speed"),
              if (speed.swimSpeed != null)
                Text(", swim ${speed.swimSpeed} feet")
              else if (speed.swimming)
                Text(", swim equal to your walking speed"),
            ],
          ),
          for (var entry in race.entries) EntryView(entry: entry, header: 1),
          if (subRace.entries != null)
            for (var entry in subRace.entries!)
              EntryView(entry: entry, header: 1),
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
