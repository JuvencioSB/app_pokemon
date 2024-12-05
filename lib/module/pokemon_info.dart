class InfoPokemon {
  int accuracy;
  ContestCombos contestCombos;
  ContestEffect contestEffect;
  ContestType contestType;
  ContestType damageClass;
  int effectChance;
  List<dynamic> effectChanges;
  List<EffectEntry> effectEntries;
  List<FlavorTextEntry> flavorTextEntries;
  ContestType generation;
  int id;
  List<ContestType> learnedByPokemon;
  List<dynamic> machines;
  Meta meta;
  String name;
  List<Name> names;
  List<PastValue> pastValues;
  int power;
  int pp;
  int priority;
  List<dynamic> statChanges;
  ContestEffect superContestEffect;
  ContestType target;
  ContestType type;

  InfoPokemon({
    required this.accuracy,
    required this.contestCombos,
    required this.contestEffect,
    required this.contestType,
    required this.damageClass,
    required this.effectChance,
    required this.effectChanges,
    required this.effectEntries,
    required this.flavorTextEntries,
    required this.generation,
    required this.id,
    required this.learnedByPokemon,
    required this.machines,
    required this.meta,
    required this.name,
    required this.names,
    required this.pastValues,
    required this.power,
    required this.pp,
    required this.priority,
    required this.statChanges,
    required this.superContestEffect,
    required this.target,
    required this.type,
  });
}

class ContestCombos {
  Normal normal;
  Normal contestCombosSuper;

  ContestCombos({
    required this.normal,
    required this.contestCombosSuper,
  });
}

class Normal {
  List<ContestType>? useAfter;
  dynamic useBefore;

  Normal({
    required this.useAfter,
    required this.useBefore,
  });
}

class ContestType {
  String name;
  String url;

  ContestType({
    required this.name,
    required this.url,
  });
}

class ContestEffect {
  String url;

  ContestEffect({
    required this.url,
  });
}

class EffectEntry {
  String effect;
  ContestType language;
  String shortEffect;

  EffectEntry({
    required this.effect,
    required this.language,
    required this.shortEffect,
  });
}

class FlavorTextEntry {
  String flavorText;
  ContestType language;
  ContestType versionGroup;

  FlavorTextEntry({
    required this.flavorText,
    required this.language,
    required this.versionGroup,
  });
}

class Meta {
  ContestType ailment;
  int ailmentChance;
  ContestType category;
  int critRate;
  int drain;
  int flinchChance;
  int healing;
  dynamic maxHits;
  int maxTurns;
  dynamic minHits;
  int minTurns;
  int statChance;

  Meta({
    required this.ailment,
    required this.ailmentChance,
    required this.category,
    required this.critRate,
    required this.drain,
    required this.flinchChance,
    required this.healing,
    required this.maxHits,
    required this.maxTurns,
    required this.minHits,
    required this.minTurns,
    required this.statChance,
  });
}

class Name {
  ContestType language;
  String name;

  Name({
    required this.language,
    required this.name,
  });
}

class PastValue {
  int accuracy;
  dynamic effectChance;
  List<dynamic> effectEntries;
  dynamic power;
  dynamic pp;
  dynamic type;
  ContestType versionGroup;

  PastValue({
    required this.accuracy,
    required this.effectChance,
    required this.effectEntries,
    required this.power,
    required this.pp,
    required this.type,
    required this.versionGroup,
  });
}
