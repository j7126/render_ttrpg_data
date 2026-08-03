import 'package:json_annotation/json_annotation.dart';
import 'package:render_ttrpg_data/datamodel/5e/data/spell/spell_source_class.dart';

part 'spell_source.g.dart';

@JsonSerializable(explicitToJson: true)
class SpellSource {
  SpellSource({this.classSource});

  @JsonKey(name: 'class')
  List<SpellSourceClass>? classSource;

  List<SpellSourceClass>? classVariant;

  factory SpellSource.fromJson(Map<String, dynamic> json) =>
      _$SpellSourceFromJson(json);

  Map<String, dynamic> toJson() => _$SpellSourceToJson(this);
}
