import 'package:render_ttrpg_data/datamodel/5e/data/interface/base_object.dart';
import 'package:render_ttrpg_data/datamodel/5e/data/interface/source_label_mixin.dart';

mixin AdditionalSpellsMixin on NamedBaseObject, ReferenceMixin, SourceLabelMixin {
  List<Map<String, dynamic>>? additionalSpells;
}
