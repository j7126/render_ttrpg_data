import 'package:flutter/material.dart';
import 'package:render_ttrpg_data/widgets/tooltip_scope.dart';

class LinkWithContentTooltip extends StatelessWidget {
  const LinkWithContentTooltip({
    super.key,
    required this.tooltipView,
    required this.contentView,
    required this.text,
    required this.style,
    required this.linkMode,
    this.fittedBox = false,
    this.waitDuration = Duration.zero,
  });

  final Widget tooltipView;
  final Widget contentView;
  final String text;
  final TextStyle? style;
  final bool fittedBox;
  final Duration waitDuration;
  final LinkTooltipViewMode linkMode;

  @override
  Widget build(BuildContext context) {
    Widget textChild = Text(
      text,
      style: linkMode == LinkTooltipViewMode.link
          ? style?.copyWith(color: ColorScheme.of(context).primary) ??
                TextStyle(color: ColorScheme.of(context).primary)
          : null,
    );
    if (fittedBox) {
      textChild = FittedBox(fit: BoxFit.scaleDown, child: textChild);
    }
    var tooltipChild = switch (linkMode) {
      LinkTooltipViewMode.link => textChild,
      LinkTooltipViewMode.withHelpIcon => Padding(
        padding: const EdgeInsets.only(left: 8.0),
        child: Icon(
          Icons.help_outline,
          size: 20,
          color: ColorScheme.of(context).onSurface.withAlpha(150),
        ),
      ),
      LinkTooltipViewMode.helpIcon => Icon(
        Icons.help_outline,
        size: 20,
        color: ColorScheme.of(context).onSurface.withAlpha(150),
      ),
    };
    tooltipChild = GestureDetector(
      onTapDown: (details) {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return Dialog(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 16.0,
                  horizontal: 20.0,
                ),
                child: SingleChildScrollView(child: contentView),
              ),
            );
          },
        );
      },
      child: tooltipChild,
    );
    var mouseRegion = MouseRegion(
      cursor: SystemMouseCursors.click,
      child: TooltipScope.isInTooltip(context)
          ? tooltipChild
          : Tooltip(
              ignorePointer: false,
              waitDuration: waitDuration,
              decoration: BoxDecoration(color: Colors.transparent),
              enableTapToDismiss: false,
              richMessage: WidgetSpan(
                child: TooltipScope(
                  child: Container(
                    constraints: BoxConstraints(
                      maxWidth: MediaQuery.of(context).size.width / 2,
                      maxHeight: MediaQuery.of(context).size.height / 2 - 32,
                    ),
                    child: tooltipView,
                  ),
                ),
              ),
              child: tooltipChild,
            ),
    );

    return switch (linkMode) {
      LinkTooltipViewMode.link => mouseRegion,
      LinkTooltipViewMode.withHelpIcon => Row(
        mainAxisSize: MainAxisSize.min,
        children: [textChild, mouseRegion],
      ),
      LinkTooltipViewMode.helpIcon => mouseRegion,
    };
  }
}

enum LinkTooltipViewMode { link, withHelpIcon, helpIcon }
