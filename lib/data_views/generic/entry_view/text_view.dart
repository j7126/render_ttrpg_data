import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:render_ttrpg_data/data_views/5e/condition_view.dart';
import 'package:render_ttrpg_data/data_views/5e/feature_view.dart';
import 'package:render_ttrpg_data/data_views/5e/item_view.dart';
import 'package:render_ttrpg_data/data_views/5e/optional_feature_view.dart';
import 'package:render_ttrpg_data/data_views/5e/spell_view.dart';
import 'package:render_ttrpg_data/data_views/5e/subclass_view.dart';
import 'package:render_ttrpg_data/datamodel/5e/data/class/class_feature.dart';
import 'package:render_ttrpg_data/datamodel/5e/data/data_model_5e.dart';
import 'package:render_ttrpg_data/datamodel/5e/data/feature/optional_feature.dart';
import 'package:render_ttrpg_data/datamodel/5e/data/generic/entry.dart';
import 'package:render_ttrpg_data/widgets/link_with_content_tooltip.dart';

class TextView extends StatefulWidget {
  const TextView(
    this.text, {
    super.key,
    this.style,
    this.hiddenEntryTypes = const {},
  });

  final String text;
  final TextStyle? style;
  final Set<FeatureEntryType> hiddenEntryTypes;

  @override
  State<TextView> createState() => _TextViewState();
}

class _TextViewState extends State<TextView> {
  InlineSpan renderText(String? type, String content) {
    if (type == "i" || type == "italic") {
      return TextSpan(
        text: content,
        style:
            widget.style?.copyWith(fontStyle: FontStyle.italic) ??
            TextStyle(fontStyle: FontStyle.italic),
      );
    } else if (type == "dc") {
      return TextSpan(text: "DC $content");
    } else if (type == "dice") {
      // TODO: implement dice rendering
      return TextSpan(
        text: content,
        style:
            widget.style?.copyWith(
              color: Colors.blue,
              decoration: TextDecoration.underline,
            ) ??
            TextStyle(color: Colors.blue, decoration: TextDecoration.underline),
      );
    } else if (type == "item") {
      var contentParts = content.split("|");
      var itemName = contentParts[0];
      var itemSource = contentParts.length > 1 ? contentParts[1] : null;
      var item = [...DataModel5e.items, ...DataModel5e.itemGroups]
          .firstWhereOrNull(
            (x) =>
                x.name.toLowerCase() == itemName.toLowerCase() &&
                (itemSource == null ||
                    x.source.toLowerCase() == itemSource.toLowerCase()),
          );
      return item == null
          ? TextSpan(
              text: "$itemName (Unknown Item)",
              style:
                  widget.style?.copyWith(
                    color: Theme.of(
                      context,
                    ).textTheme.bodyMedium?.color?.withAlpha(150),
                  ) ??
                  TextStyle(
                    color: Theme.of(
                      context,
                    ).textTheme.bodyMedium?.color?.withAlpha(150),
                  ),
            )
          : WidgetSpan(
              alignment: PlaceholderAlignment.baseline,
              baseline: TextBaseline.alphabetic,
              child: LinkWithContentTooltip(
                tooltipView: ItemView(
                  item: item,
                  card: true,
                  outlined: true,
                  scrollable: true,
                ),
                contentView: ItemView(item: item, card: false),
                text: contentParts.length > 2 ? contentParts[2] : itemName,
                style: widget.style,
              ),
            );
    } else if (type == "condition") {
      var condition = DataModel5e.conditions.firstWhereOrNull(
        (x) => x.refCompare(content.toLowerCase()),
      );
      return condition == null
          ? TextSpan(
              text: "$content (Unknown Condition)",
              style:
                  widget.style?.copyWith(
                    color: Theme.of(
                      context,
                    ).textTheme.bodyMedium?.color?.withAlpha(150),
                  ) ??
                  TextStyle(
                    color: Theme.of(
                      context,
                    ).textTheme.bodyMedium?.color?.withAlpha(150),
                  ),
            )
          : WidgetSpan(
              alignment: PlaceholderAlignment.baseline,
              baseline: TextBaseline.alphabetic,
              child: LinkWithContentTooltip(
                tooltipView: ConditionView(
                  condition: condition,
                  card: true,
                  outlined: true,
                  scrollable: true,
                ),
                contentView: ConditionView(condition: condition, card: false),
                text: content,
                style: widget.style,
              ),
            );
    } else if (type == "spell") {
      var spell = DataModel5e.spells.firstWhereOrNull(
        (x) => x.refCompare(content.toLowerCase()),
      );
      return spell == null
          ? TextSpan(
              text: "$content (Unknown Spell)",
              style:
                  widget.style?.copyWith(
                    color: Theme.of(
                      context,
                    ).textTheme.bodyMedium?.color?.withAlpha(150),
                  ) ??
                  TextStyle(
                    color: Theme.of(
                      context,
                    ).textTheme.bodyMedium?.color?.withAlpha(150),
                  ),
            )
          : WidgetSpan(
              alignment: PlaceholderAlignment.baseline,
              baseline: TextBaseline.alphabetic,
              child: LinkWithContentTooltip(
                tooltipView: SpellView(
                  spell: spell,
                  card: true,
                  outlined: true,
                  scrollable: true,
                ),
                contentView: SpellView(spell: spell, card: false),
                text: spell.name,
                style: widget.style,
              ),
            );
    } else if (type == "subclass") {
      var subclass = DataModel5e.subClasses.firstWhereOrNull(
        (x) => x.refCompare(content.toLowerCase()),
      );
      return subclass == null
          ? TextSpan(
              text: "${content.split("|").first} (Unknown Subclass)",
              style:
                  widget.style?.copyWith(
                    color: Theme.of(
                      context,
                    ).textTheme.bodyMedium?.color?.withAlpha(150),
                  ) ??
                  TextStyle(
                    color: Theme.of(
                      context,
                    ).textTheme.bodyMedium?.color?.withAlpha(150),
                  ),
            )
          : WidgetSpan(
              alignment: PlaceholderAlignment.baseline,
              baseline: TextBaseline.alphabetic,
              child: LinkWithContentTooltip(
                tooltipView: SubclassView(
                  subclass: subclass,
                  card: true,
                  outlined: true,
                  scrollable: true,
                ),
                contentView: SubclassView(subclass: subclass, card: false),
                text: subclass.name,
                style: widget.style,
              ),
            );
    } else if (type == "classFeature") {
      var feat = ClassFeature5e.fromReference(content);
      return feat == null
          ? TextSpan(
              text: "${content.split("|").first} (Unknown Class Feature)",
              style:
                  widget.style?.copyWith(
                    color: Theme.of(
                      context,
                    ).textTheme.bodyMedium?.color?.withAlpha(150),
                  ) ??
                  TextStyle(
                    color: Theme.of(
                      context,
                    ).textTheme.bodyMedium?.color?.withAlpha(150),
                  ),
            )
          : WidgetSpan(
              alignment: PlaceholderAlignment.baseline,
              baseline: TextBaseline.alphabetic,
              child: LinkWithContentTooltip(
                tooltipView: FeatureView(
                  feature: feat,
                  card: true,
                  outlined: true,
                  scrollable: true,
                  hiddenEntryTypes: widget.hiddenEntryTypes,
                ),
                contentView: FeatureView(
                  feature: feat,
                  card: false,
                  hiddenEntryTypes: widget.hiddenEntryTypes,
                ),
                text: feat.name,
                style: widget.style,
              ),
            );
    } else if (type == "optfeature") {
      var feat = OptionalFeature.fromReference(content);
      return feat == null
          ? TextSpan(
              text: "${content.split("|").first} (Unknown Class Feature)",
              style:
                  widget.style?.copyWith(
                    color: Theme.of(
                      context,
                    ).textTheme.bodyMedium?.color?.withAlpha(150),
                  ) ??
                  TextStyle(
                    color: Theme.of(
                      context,
                    ).textTheme.bodyMedium?.color?.withAlpha(150),
                  ),
            )
          : WidgetSpan(
              alignment: PlaceholderAlignment.baseline,
              baseline: TextBaseline.alphabetic,
              child: LinkWithContentTooltip(
                tooltipView: OptionalFeatureView(
                  feature: feat,
                  card: true,
                  outlined: true,
                  scrollable: true,
                ),
                contentView: OptionalFeatureView(feature: feat, card: false),
                text: feat.name,
                style: widget.style,
              ),
            );
    } else {
      return TextSpan(
        text: "${type ?? ""}: $content",
        style:
            widget.style?.copyWith(color: Colors.red) ??
            TextStyle(color: Colors.red),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    RegExp exp = RegExp(r'(?:{(@)([^ ]+) ([^}]+)})|(?:(?:[^{]|\n)+)');
    var matches = exp.allMatches(widget.text);
    return Text.rich(
      TextSpan(
        text: "",
        children: [
          for (var match in matches)
            if (match.group(1) == "@" &&
                match.group(2) != null &&
                match.group(3) != null)
              renderText(match.group(2), match.group(3)!)
            else
              TextSpan(text: match.group(0) ?? ""),
        ],
      ),
      style: widget.style,
    );
  }
}
