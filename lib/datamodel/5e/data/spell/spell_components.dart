import 'package:json_annotation/json_annotation.dart';

part 'spell_components.g.dart';

@JsonSerializable(explicitToJson: true)
class SpellComponents {
  SpellComponents({
    this.verbal = false,
    this.somatic = false,
    this.material = false,
    this.materialText,
    this.materialCost,
    this.materialConsume,
  });

  @JsonKey(name: "v")
  bool verbal;
  @JsonKey(name: "s")
  bool somatic;

  bool material;
  String? materialText;
  int? materialCost;
  String? materialConsume;

  factory SpellComponents.fromJson(Map<String, dynamic> json) {
    var jsonMaterial = json["m"];
    if (jsonMaterial is bool) {
      json["material"] = true;
    } else if (jsonMaterial is String) {
      json["material"] = true;
      json["materialText"] = jsonMaterial;
    } else if (jsonMaterial is Map<String, dynamic>) {
      json["material"] = true;
      json["materialText"] = jsonMaterial["text"];
      json["materialCost"] = jsonMaterial["cost"];
      json["materialConsume"] = jsonMaterial["consume"]?.toString();
    }
    return _$SpellComponentsFromJson(json);
  }

  Map<String, dynamic> toJson() => _$SpellComponentsToJson(this);
}

enum CastingTimeUnit { action, bonus, reaction, minute, hour }
