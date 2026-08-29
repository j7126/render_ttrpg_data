import 'package:collection/collection.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:render_ttrpg_data/datamodel/5e/data/ability.dart';
import 'package:render_ttrpg_data/util/int_extension.dart';

part 'ability_bonus.g.dart';

@JsonSerializable(explicitToJson: true)
class AbilityBonus {
  AbilityBonus({
    this.strength,
    this.dexterity,
    this.constitution,
    this.intelligence,
    this.wisdom,
    this.charisma,
    this.choose,
  });

  @JsonKey(name: "str")
  int? strength;
  @JsonKey(name: "dex")
  int? dexterity;
  @JsonKey(name: "con")
  int? constitution;
  @JsonKey(name: "int")
  int? intelligence;
  @JsonKey(name: "wis")
  int? wisdom;
  @JsonKey(name: "cha")
  int? charisma;

  AbilityBonusChoose? choose;

  Map<Ability, int?> get fixedBonus => {
    Ability.str: strength,
    Ability.dex: dexterity,
    Ability.con: constitution,
    Ability.int: intelligence,
    Ability.wis: wisdom,
    Ability.cha: charisma,
  };

  String getDisplayText() {
    var fixedBonusAbilities = fixedBonus.entries
        .map((x) => x.value != null ? x.key : null)
        .nonNulls
        .toSet();

    var text = "";
    for (var kvp in fixedBonus.entries) {
      if (kvp.value != null) {
        if (text.isNotEmpty) {
          text += "; ";
        }
        text += "${kvp.key.name} ${kvp.value!.toStringWithSign()}";
      }
    }
    if (choose != null) {
      var fromText = choose!.from.equals(Ability.values)
          ? "any"
          : choose!.from.equals(
              Ability.values.whereNot(fixedBonusAbilities.contains).toList(),
            )
          ? "any other"
          : choose!.from.map((x) => x.name).join(" or ");
      var countText = choose!.count != -1
          ? choose!.count == 1 || choose!.count == null
                ? (choose!.amount ?? 1).toStringWithSign()
                : "${choose!.count!.singleDigitAsText()} unique ${(choose!.amount ?? 1).toStringWithSign()}"
          : "combination totaling ${(choose!.amount ?? 1).toStringWithSign()}";
      if (text.isNotEmpty) {
        text += "; ";
      }
      text += "Choose $fromText $countText";
    }
    return text;
  }

  factory AbilityBonus.fromJson(Map<String, dynamic> json) =>
      _$AbilityBonusFromJson(json);

  Map<String, dynamic> toJson() => _$AbilityBonusToJson(this);
}

@JsonSerializable(explicitToJson: true)
class AbilityBonusChoose {
  AbilityBonusChoose({required this.from, this.count, this.amount});

  List<Ability> from;
  int? count;
  int? amount;

  factory AbilityBonusChoose.fromJson(Map<String, dynamic> json) =>
      _$AbilityBonusChooseFromJson(json);

  Map<String, dynamic> toJson() => _$AbilityBonusChooseToJson(this);
}
