import 'package:json_annotation/json_annotation.dart';

enum CreatureSize {
  @JsonValue("S") small,
  @JsonValue("M") medium,
  @JsonValue("L") large,
  @JsonValue("V") varies,
}
