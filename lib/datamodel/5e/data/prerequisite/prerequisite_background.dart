import 'package:json_annotation/json_annotation.dart';

part 'prerequisite_background.g.dart';

@JsonSerializable(explicitToJson: true)
class PrerequisiteBackground {
  PrerequisiteBackground({required this.name, this.displayEntry});

  String name;
  String? displayEntry;

  factory PrerequisiteBackground.fromJson(Map<String, dynamic> json) =>
      _$PrerequisiteBackgroundFromJson(json);

  Map<String, dynamic> toJson() => _$PrerequisiteBackgroundToJson(this);
}
