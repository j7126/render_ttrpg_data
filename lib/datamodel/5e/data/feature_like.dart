import 'package:json_annotation/json_annotation.dart';
import 'package:render_ttrpg_data/datamodel/5e/data/base_object.dart';
import 'package:render_ttrpg_data/datamodel/5e/data/generic/entry.dart';

abstract class FeatureLike extends NamedBaseObject {
  FeatureLike({
    required super.name,
    required super.source,
    required super.page,
    super.otherSources,
    super.srd,
    this.header = 0,
    this.entries = const [],
  });

  int header;
  List<FeatureEntry> entries;

  @JsonKey(includeFromJson: false, includeToJson: false)
  abstract final String featureSource;

  @JsonKey(includeFromJson: false, includeToJson: false)
  abstract final int order;
}
