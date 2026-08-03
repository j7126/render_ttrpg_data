extension JsonExtension on Map<String, dynamic> {
  T? traverse<T>(String path) {
    var pathElements = path.split("/");
    dynamic json = this;
    for (var key in pathElements) {
      if (!json.containsKey(key)) {
        return null;
      }
      json = json[key];

      if (json is! Map<String, dynamic>) {
        return json is T ? json : null;
      }
    }

    return json;
  }
}
