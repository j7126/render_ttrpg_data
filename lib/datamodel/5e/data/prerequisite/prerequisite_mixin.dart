import 'package:render_ttrpg_data/datamodel/5e/data/interface/base_object.dart';
import 'package:render_ttrpg_data/datamodel/5e/data/interface/reference_mixin.dart';
import 'package:render_ttrpg_data/datamodel/5e/data/prerequisite/prerequisite.dart';

mixin PrerequisiteMixin on BaseObject, ReferenceMixin {
  List<Prerequisite>? prerequisite;
}
