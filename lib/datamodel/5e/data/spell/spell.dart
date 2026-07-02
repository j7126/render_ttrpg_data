import 'package:json_annotation/json_annotation.dart';
import 'package:render_ttrpg_data/datamodel/5e/data/base_object.dart';
import 'package:render_ttrpg_data/datamodel/5e/data/book_source.dart';
import 'package:render_ttrpg_data/datamodel/5e/data/generic/entry.dart';
import 'package:render_ttrpg_data/datamodel/5e/data/spell/casting_time.dart';
import 'package:render_ttrpg_data/datamodel/5e/data/spell/spell_duration.dart';
import 'package:render_ttrpg_data/datamodel/5e/data/spell/spell_range.dart';

part 'spell.g.dart';

@JsonSerializable(explicitToJson: true)
class Spell extends NamedBaseObject {
  Spell({
    required super.name,
    required super.source,
    super.page,
    super.otherSources,
    super.srd,
    required this.level,
    required this.school,
    required this.time,
    required this.range,
    required this.duration,
    this.entries = const [],
    this.entriesHigherLevel = const [],
  });
  
  int level;
  String school;
  List<CastingTime> time;
  SpellRange range;
  List<SpellDuration> duration;
  
  List<FeatureEntry> entries;
  List<FeatureEntry> entriesHigherLevel;

  factory Spell.fromJson(Map<String, dynamic> json) => _$SpellFromJson(json);

  Map<String, dynamic> toJson() => _$SpellToJson(this);

  bool searchCompare(String searchString) {
    return name.toLowerCase().contains(searchString) ||
        (srd is String && srd.toLowerCase().contains(searchString));
  }

  bool refCompare(String searchString) {
    return name.toLowerCase() == searchString ||
        (srd is String && srd.toLowerCase() == searchString);
  }
}
