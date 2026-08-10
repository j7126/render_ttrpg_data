import 'package:render_ttrpg_data/datamodel/5e/data/book_source.dart';

abstract class NamedBaseObject extends BaseObject {
  NamedBaseObject({
    required this.name,
    required super.source,
    super.page,
    super.otherSources,
    super.srd,
    super.basicRules,
  });

  String name;
}

abstract class BaseObject {
  BaseObject({
    required this.source,
    this.page,
    this.otherSources,
    this.srd,
    this.basicRules,
  });

  String source;
  int? page;
  List<BookSource>? otherSources;
  dynamic srd;
  bool? basicRules;
}

mixin WithReference {
  abstract final String refString;
}
