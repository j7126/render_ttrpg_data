// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'skill_proficiency.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Map<String, dynamic> _$SkillProficiencyToJson(
  SkillProficiency instance,
) => <String, dynamic>{
  'fixedSkills': instance.fixedSkills.map((e) => _$SkillEnumMap[e]!).toList(),
  'chooseSkills': instance.chooseSkills.map((e) => _$SkillEnumMap[e]!).toList(),
  'chooseNumber': instance.chooseNumber,
  'numAny': instance.numAny,
  'displayString': instance.displayString,
};

const _$SkillEnumMap = {
  Skill.athletics: 'athletics',
  Skill.acrobatics: 'acrobatics',
  Skill.sleightOfHand: 'sleightOfHand',
  Skill.stealth: 'stealth',
  Skill.arcana: 'arcana',
  Skill.history: 'history',
  Skill.investigation: 'investigation',
  Skill.nature: 'nature',
  Skill.religion: 'religion',
  Skill.animalHandling: 'animalHandling',
  Skill.insight: 'insight',
  Skill.medicine: 'medicine',
  Skill.perception: 'perception',
  Skill.survival: 'survival',
  Skill.deception: 'deception',
  Skill.intimidation: 'intimidation',
  Skill.performance: 'performance',
  Skill.persuasion: 'persuasion',
};
