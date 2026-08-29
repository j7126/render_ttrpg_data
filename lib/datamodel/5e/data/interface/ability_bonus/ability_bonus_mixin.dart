import 'package:render_ttrpg_data/datamodel/5e/data/interface/ability_bonus/ability_bonus.dart';
import 'package:render_ttrpg_data/datamodel/5e/data/interface/base_object.dart';

mixin AbilityBonusMixin on NamedBaseObject, ReferenceMixin {
  List<AbilityBonus>? ability;
}
