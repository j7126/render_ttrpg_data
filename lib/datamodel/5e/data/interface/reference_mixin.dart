import 'package:flutter/foundation.dart';

mixin ReferenceMixin {
  abstract final String refType;
  abstract final String refStringParts;

  @nonVirtual
  String get refString => "{@$refType $refStringParts}";

  bool refCompareImpl(List<String> parts);

  static List<String>? parseRefString(String searchString, String? refType) {
    RegExp exp = RegExp(r'{(@)([^ ]+) ([^}]+)}');
    var matches = exp.allMatches(searchString);
    if (matches.length == 1 &&
        matches.first.group(1) == "@" &&
        (matches.first.group(2) == refType || refType == null) &&
        matches.first.group(3) != null) {
      return matches.first.group(3)!.split("|");
    } else if (!searchString.startsWith("{@") &&
        !searchString.startsWith("@")) {
      return searchString.split("|");
    }

    return null;
  }

  @nonVirtual
  List<String>? parseRefCurrentString(String searchString) =>
      parseRefString(searchString, refType);

  @nonVirtual
  bool refCompare(String searchString, {List<String>? preSplitParts}) {
    var parts = preSplitParts ?? parseRefCurrentString(searchString);
    return parts != null && parts.isNotEmpty && refCompareImpl(parts);
  }
}
