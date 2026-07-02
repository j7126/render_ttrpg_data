import 'package:flutter/material.dart';

class TooltipScope extends InheritedWidget {
  const TooltipScope({super.key, required super.child});

  static bool isInTooltip(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<TooltipScope>() != null;
  }

  @override
  bool updateShouldNotify(TooltipScope oldWidget) => false;
}
