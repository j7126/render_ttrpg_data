import 'package:json_annotation/json_annotation.dart';

part 'speed.g.dart';

@JsonSerializable(explicitToJson: true)
class Speed {
  Speed({
    required this.walkSpeed,
    this.flySpeed,
    this.flying = false,
    this.swimSpeed,
    this.swimming = false,
  });

  int walkSpeed;
  int? flySpeed;
  bool flying;
  int? swimSpeed;
  bool swimming;

  factory Speed.fromJson(dynamic json) {
    if (json is int) {
      return Speed(walkSpeed: json);
    } else if (json is Map<String, dynamic> && json.containsKey("walk")) {
      return Speed(
        walkSpeed: (json['walk'] as num).toInt(),
        flying: json.containsKey("fly"),
        flySpeed: json["fly"] is num ? (json["fly"] as num).toInt() : null,
        swimming: json.containsKey("swim"),
        swimSpeed: json["swim"] is num ? (json["swim"] as num).toInt() : null,
      );
    }

    return _$SpeedFromJson(json);
  }

  Map<String, dynamic> toJson() => _$SpeedToJson(this);
}
