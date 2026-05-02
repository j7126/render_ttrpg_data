import 'package:json_annotation/json_annotation.dart';

part 'armor_proficiency.g.dart';

@JsonSerializable(explicitToJson: true, createFactory: false)
class ArmorProficiency {
  const ArmorProficiency(this.type, {this.fullText});

  final ArmorProficiencyType type;
  final String? fullText;

  factory ArmorProficiency.fromJson(dynamic json) {
    if (json is String) {
      return ArmorProficiency($enumDecode(_$ArmorProficiencyTypeEnumMap, json));
    } else if (json is Map<String, dynamic>) {
      return ArmorProficiency(
        $enumDecode(_$ArmorProficiencyTypeEnumMap, json["proficiency"]),
        fullText: json["full"],
      );
    }

    throw ArgumentError("Invalid armor proficiency type: $json");
  }

  Map<String, dynamic> toJson() => _$ArmorProficiencyToJson(this);
}

enum ArmorProficiencyType { light, medium, heavy, shield }
