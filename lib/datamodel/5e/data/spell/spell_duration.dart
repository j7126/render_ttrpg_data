import 'package:json_annotation/json_annotation.dart';
import 'package:render_ttrpg_data/datamodel/5e/data/spell/spell_duration_time.dart';

part 'spell_duration.g.dart';

@JsonSerializable(explicitToJson: true)
class SpellDuration {
  SpellDuration({
    required this.type,
    this.concentration = false,
    this.duration,
    this.end,
  });

  SpellDurationType type;
  bool concentration;
  SpellDurationTime? duration;
  List<SpellDurationEndCondition>? end;

  String get displayName => switch (type) {
    SpellDurationType.timed =>
      duration == null
          ? "No Duration"
          : "${duration!.amount} ${duration!.type.name}${duration!.amount > 1 ? "s" : ""}",
    _ => type.name,
  };

  factory SpellDuration.fromJson(Map<String, dynamic> json) =>
      _$SpellDurationFromJson(json);

  Map<String, dynamic> toJson() => _$SpellDurationToJson(this);
}

enum SpellDurationType { instant, timed, special, permanent }

enum SpellDurationEndCondition { dispel }
