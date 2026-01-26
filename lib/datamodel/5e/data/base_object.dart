import 'package:render_ttrpg_data/datamodel/5e/data/book_source.dart';

class BaseObject {
  BaseObject({
    required this.name,
    required this.source,
    this.page,
    this.otherSources,
    this.srd,
    this.basicRules,
  });

  String name;
  String source;
  int? page;
  List<BookSource>? otherSources;
  dynamic srd;
  bool? basicRules;
}
