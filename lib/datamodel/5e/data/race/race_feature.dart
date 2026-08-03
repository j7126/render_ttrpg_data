import 'package:json_annotation/json_annotation.dart';
import 'package:render_ttrpg_data/datamodel/5e/data/book_source.dart';
import 'package:render_ttrpg_data/datamodel/5e/data/feature_like.dart';
import 'package:render_ttrpg_data/datamodel/5e/data/generic/entry.dart';

part 'race_feature.g.dart';

@JsonSerializable(explicitToJson: true)
class RaceFeature extends FeatureLike {
  RaceFeature({
    required super.name,
    required super.source,
    required super.page,
    super.otherSources,
    super.srd,
    required this.raceName,
    required this.raceSource,
    super.header = 0,
    super.entries = const [],
  });

  String raceName;
  String raceSource;

  @override
  String get featureSource => raceName;

  @override
  int get order => 0;

  factory RaceFeature.fromJson(Map<String, dynamic> json) =>
      _$RaceFeatureFromJson(json);

  Map<String, dynamic> toJson() => _$RaceFeatureToJson(this);
}
