import 'package:json_annotation/json_annotation.dart';

part 'spell_source_class.g.dart';

@JsonSerializable(explicitToJson: true)
class SpellSourceClass {
  SpellSourceClass({
    required this.name,
    required this.source,
    this.definedInSource,
  });

  String name;
  String source;
  String? definedInSource;

  factory SpellSourceClass.fromJson(Map<String, dynamic> json) =>
      _$SpellSourceClassFromJson(json);

  Map<String, dynamic> toJson() => _$SpellSourceClassToJson(this);
}
