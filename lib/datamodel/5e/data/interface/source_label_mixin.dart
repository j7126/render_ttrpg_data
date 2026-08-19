import 'package:json_annotation/json_annotation.dart';
import 'package:render_ttrpg_data/datamodel/5e/data/interface/base_object.dart';

mixin SourceLabelMixin on NamedBaseObject {
  @JsonKey(includeFromJson: false, includeToJson: false)
  abstract final String sourceLabel;
}
