import 'package:json_annotation/json_annotation.dart';

part 'race_age.g.dart';

@JsonSerializable(explicitToJson: true)
class RaceAge {
  RaceAge({required this.max, this.mature});

  int max;
  int? mature;

  factory RaceAge.fromJson(Map<String, dynamic> json) =>
      _$RaceAgeFromJson(json);

  Map<String, dynamic> toJson() => _$RaceAgeToJson(this);
}
