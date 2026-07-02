import 'package:json_annotation/json_annotation.dart';

part 'spell_duration_time.g.dart';

@JsonSerializable(explicitToJson: true)
class SpellDurationTime {
  SpellDurationTime({required this.type, required this.amount});

  SpellDurationUnit type;
  int amount;

  factory SpellDurationTime.fromJson(Map<String, dynamic> json) =>
      _$SpellDurationTimeFromJson(json);

  Map<String, dynamic> toJson() => _$SpellDurationTimeToJson(this);
}

enum SpellDurationUnit { day, hour, minute, round }
