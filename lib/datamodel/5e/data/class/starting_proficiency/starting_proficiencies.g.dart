// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'starting_proficiencies.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ClassStartingProficiencies _$ClassStartingProficienciesFromJson(
  Map<String, dynamic> json,
) =>
    ClassStartingProficiencies(
        armor: (json['armor'] as List<dynamic>?)
            ?.map(ArmorProficiency.fromJson)
            .toList(),
      )
      ..skills = (json['skills'] as List<dynamic>?)
          ?.map(SkillProficiency.fromJson)
          .toList();

Map<String, dynamic> _$ClassStartingProficienciesToJson(
  ClassStartingProficiencies instance,
) => <String, dynamic>{
  'armor': instance.armor?.map((e) => e.toJson()).toList(),
  'skills': instance.skills?.map((e) => e.toJson()).toList(),
};
