import 'package:json_annotation/json_annotation.dart';

part 'optional_feature_progression.g.dart';

@JsonSerializable(explicitToJson: true)
class OptionalFeatureProgression {
  OptionalFeatureProgression({
    required this.name,
    required this.featureType,
    required this.progression,
    this.required,
    this.classSource,
  });

  String name;
  List<String> featureType;
  dynamic progression;
  Map<String, List<String>>? required;
  String? classSource;

  factory OptionalFeatureProgression.fromJson(Map<String, dynamic> json) =>
      _$OptionalFeatureProgressionFromJson(json);

  Map<String, dynamic> toJson() => _$OptionalFeatureProgressionToJson(this);
}
