import 'package:json_annotation/json_annotation.dart';

part 'casting_time.g.dart';

@JsonSerializable(explicitToJson: true)
class CastingTime {
  CastingTime({required this.number, required this.unit});

  int number;
  CastingTimeUnit unit;

  factory CastingTime.fromJson(Map<String, dynamic> json) =>
      _$CastingTimeFromJson(json);

  Map<String, dynamic> toJson() => _$CastingTimeToJson(this);
}

enum CastingTimeUnit { action, bonus, reaction, minute, hour }
