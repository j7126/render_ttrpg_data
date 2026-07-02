import 'package:json_annotation/json_annotation.dart';

part 'dice.g.dart';

@JsonSerializable(explicitToJson: true)
class Dice {
  Dice({required this.number, required this.faces});

  int number;
  int faces;

  factory Dice.fromJson(dynamic json) {
    if (json is String) {
      var diceString = json.replaceAll(" ", "");
      var match = RegExp(r'(\d*)d(\d+)').firstMatch(diceString);
      if (match != null && match.groupCount == 2) {
        var qty = int.tryParse(match.group(1) ?? '1') ?? 1;
        var faces = int.tryParse(match.group(2) ?? '-1');
        if (faces != null && faces > 0 && qty > 0) {
          return Dice(number: qty, faces: faces);
        }
      }
      return Dice(number: 0, faces: 0);
    } else {
      return _$DiceFromJson(json);
    }
  }

  Map<String, dynamic> toJson() => _$DiceToJson(this);
}
