import 'package:json_annotation/json_annotation.dart';

part 'prerequisite_level.g.dart';

@JsonSerializable(explicitToJson: true)
class PrerequisiteLevel {
  PrerequisiteLevel({
    this.level = 0,
    this.className,
    this.classVisible,
    this.subclassName,
    this.subclassVisible,
  });

  int level;
  String? className;
  bool? classVisible;
  String? subclassName;
  bool? subclassVisible;

  factory PrerequisiteLevel.fromJson(dynamic json) {
    if (json is int) {
      return PrerequisiteLevel(level: json);
    } else if (json is Map<String, dynamic>) {
      var level = json["level"];
      if (level is int) {
        String? className;
        bool? classVisible;
        var cl = json["class"];
        if (cl is Map<String, dynamic> && cl["name"] is String) {
          className = cl["name"];
          classVisible = cl["visible"] == true;
        }

        String? subclassName;
        bool? subclassVisible;
        var subcl = json["subclass"];
        if (subcl is Map<String, dynamic> && subcl["name"] is String) {
          subclassName = cl["name"];
          subclassVisible = cl["visible"] == true;
        }

        return PrerequisiteLevel(
          level: level,
          className: className,
          classVisible: classVisible,
          subclassName: subclassName,
          subclassVisible: subclassVisible,
        );
      }
    }

    return PrerequisiteLevel();
  }

  Map<String, dynamic> toJson() => _$PrerequisiteLevelToJson(this);
}
