import 'package:flutter/material.dart';
import 'package:render_ttrpg_data/widgets/tooltip_scope.dart';

class LinkWithContentTooltip extends StatelessWidget {
  const LinkWithContentTooltip({
    super.key,
    required this.tooltipView,
    required this.contentView,
    required this.text,
    required this.style,
    this.fittedBox = false,
    this.waitDuration = Duration.zero,
  });

  final Widget tooltipView;
  final Widget contentView;
  final String text;
  final TextStyle? style;
  final bool fittedBox;
  final Duration waitDuration;

  @override
  Widget build(BuildContext context) {
    Widget child = Text(
      text,
      style:
          style?.copyWith(color: ColorScheme.of(context).primary) ??
          TextStyle(color: ColorScheme.of(context).primary),
    );
    if (fittedBox) {
      child = FittedBox(fit: BoxFit.scaleDown, child: child);
    }
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: TooltipScope.isInTooltip(context)
          ? child
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
              child: GestureDetector(
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
                child: child,
              ),
            ),
    );
  }
}
