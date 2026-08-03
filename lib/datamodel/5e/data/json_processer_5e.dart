import 'package:render_ttrpg_data/datamodel/5e/data/json_extension.dart';

class JsonProcesser5e {
  static void mergeDataCopyProps(
    Map<String, dynamic> json,
    List<dynamic> sourceItems,
  ) {
    var copy = json.traverse<Map<String, dynamic>>("_copy");
    if (copy == null) {
      return;
    }

    var name = copy.traverse<String>("name");
    var source = copy.traverse<String>("source");
    if (name == null || source == null) {
      return;
    }

    Map<String, dynamic> item = sourceItems.firstWhere(
      (x) =>
          x is Map<String, dynamic> &&
          x.traverse("name") == name &&
          x.traverse("source") == source,
    );

    for (var kvp in item.entries) {
      if (!json.containsKey(kvp.key)) {
        json[kvp.key] = kvp.value;
      }
    }
  }

  static Map<String, dynamic> process(Map<String, dynamic> json) {
    var internalCopies = json.traverse("_meta/internalCopies");
    if (internalCopies is List<dynamic>) {
      for (var prop in internalCopies) {
        if (prop is String &&
            json.containsKey(prop) &&
            json[prop] is List<dynamic>) {
          for (var entry in json[prop]) {
            if (entry is Map<String, dynamic>) {
              mergeDataCopyProps(entry, json[prop]);
            }
          }
        }
      }
    }

    return json;
  }
}
