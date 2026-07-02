import 'package:flutter/material.dart';
import 'package:render_ttrpg_data/widgets/tooltip_scope.dart';

class LinkWithContentTootlip extends StatelessWidget {
  const LinkWithContentTootlip({
    super.key,
    required this.tooltipView,
    required this.contentView,
    required this.text,
  });

  final Widget tooltipView;
  final Widget contentView;
  final String text;

  @override
  Widget build(BuildContext context) {
    var child = Text(
      text,
      style: TextStyle(color: ColorScheme.of(context).primary),
    );
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: TooltipScope.isInTooltip(context)
          ? child
          : Tooltip(
              ignorePointer: false,
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
              decoration: BoxDecoration(color: Colors.transparent),
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
