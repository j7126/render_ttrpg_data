import 'package:json_annotation/json_annotation.dart';
import 'package:render_ttrpg_data/datamodel/5e/data/interface/base_object.dart';
import 'package:render_ttrpg_data/datamodel/5e/data/book_source.dart';
import 'package:render_ttrpg_data/datamodel/5e/data/data_model_5e.dart';
import 'package:render_ttrpg_data/datamodel/5e/data/generic/entry.dart';
import 'package:render_ttrpg_data/datamodel/5e/data/spell/casting_time.dart';
import 'package:render_ttrpg_data/datamodel/5e/data/spell/spell_duration.dart';
import 'package:render_ttrpg_data/datamodel/5e/data/spell/spell_range.dart';
import 'package:render_ttrpg_data/datamodel/5e/data/spell/spell_school.dart';
import 'package:render_ttrpg_data/datamodel/5e/data/spell/spell_source.dart';

part 'spell.g.dart';

@JsonSerializable(explicitToJson: true)
class Spell extends NamedBaseObject with ReferenceMixin {
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
    this.spellClassSource,
  });

  int level;
  SpellSchool school;
  List<CastingTime> time;
  SpellRange range;
  List<SpellDuration> duration;

  List<FeatureEntry> entries;
  List<FeatureEntry> entriesHigherLevel;

  SpellSource? spellClassSource;

  @override
  String get refString => "{@spell $name|$source}";

  factory Spell.fromJson(Map<String, dynamic> json) => _$SpellFromJson(json);

  Map<String, dynamic> toJson() => _$SpellToJson(this);

  bool searchCompare(String searchString) {
    return name.toLowerCase().contains(searchString) ||
        (srd is String && srd.toLowerCase().contains(searchString));
  }

  bool refCompare(String searchString) {
    var splitElements = searchString.split("|");
    return splitElements.isNotEmpty &&
        (name.toLowerCase() == splitElements[0] ||
            (srd is String && srd.toLowerCase() == splitElements[0])) &&
        (splitElements.length == 1 || source.toLowerCase() == splitElements[1].toLowerCase());
  }

  void hydrateReferences() {
    spellClassSource = DataModel5e.spellSources[source]?[name];
  }
}
