import 'package:json_annotation/json_annotation.dart';

part 'prerequisite_race.g.dart';

@JsonSerializable(explicitToJson: true)
class PrerequisiteRace {
  PrerequisiteRace({required this.name, this.subrace, this.displayEntry});

  String name;
  String? subrace;
  String? displayEntry;

  factory PrerequisiteRace.fromJson(Map<String, dynamic> json) =>
      _$PrerequisiteRaceFromJson(json);

  Map<String, dynamic> toJson() => _$PrerequisiteRaceToJson(this);
}
