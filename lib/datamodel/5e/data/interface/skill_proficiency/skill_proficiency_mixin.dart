import 'package:render_ttrpg_data/datamodel/5e/data/interface/base_object.dart';
import 'package:render_ttrpg_data/datamodel/5e/data/interface/reference_mixin.dart';
import 'package:render_ttrpg_data/datamodel/5e/data/interface/skill_proficiency/skill_proficiency.dart';

mixin SkillProficiencyMixin on NamedBaseObject, ReferenceMixin {
  List<SkillProficiency>? skillProficiencies;

  String get skillProficiencyDisplayString => skillProficiencies == null
      ? ""
      : skillProficiencies!.map((prof) => prof.displayString).join("; ");
}
