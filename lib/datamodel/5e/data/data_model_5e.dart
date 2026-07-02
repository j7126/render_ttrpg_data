import 'package:render_ttrpg_data/datamodel/5e/data/class/class.dart';
import 'package:render_ttrpg_data/datamodel/5e/data/class/class_feature.dart';
import 'package:render_ttrpg_data/datamodel/5e/data/condition/condition.dart';
import 'package:render_ttrpg_data/datamodel/5e/data/feature/optional_feature.dart';
import 'package:render_ttrpg_data/datamodel/5e/data/item/item.dart';
import 'package:render_ttrpg_data/datamodel/5e/data/item/item_group.dart';
import 'package:render_ttrpg_data/datamodel/5e/data/item/item_property.dart';
import 'package:render_ttrpg_data/datamodel/5e/data/item/item_type.dart';
import 'package:render_ttrpg_data/datamodel/5e/data/spell/spell.dart';

class DataModel5e {
  // class
  static List<Class5e> classes = [];
  static List<ClassFeature5e> classFeatures = [];

  // items
  static List<Item> items = [];
  static List<ItemType> itemTypes = [];
  static List<ItemGroup> itemGroups = [];
  static List<ItemProperty> itemProperties = [];

  // conditions
  static List<Condition> conditions = [];

  // features
  static List<OptionalFeature> optionalFeatures = [];

  // spells
  static List<Spell> spells = [];
}
