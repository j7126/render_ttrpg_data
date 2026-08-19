import 'package:json_annotation/json_annotation.dart';
import 'package:render_ttrpg_data/datamodel/5e/data/interface/base_object.dart';
import 'package:render_ttrpg_data/datamodel/5e/data/generic/entry.dart';
import 'package:render_ttrpg_data/datamodel/5e/data/interface/source_label_mixin.dart';

abstract class FeatureLike extends NamedBaseObject
    with SourceLabelMixin, ReferenceMixin {
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
  abstract final int order;
}
