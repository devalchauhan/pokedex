class PokemonModel {
  int? baseExperience;
  int? height;
  int? id;
  String? name;
  int? order;
  bool? isDefault;
  Species? species;
  int? weight;
  Sprites? sprites;
  List<Stats>? stats;
  List<Types>? types;

  PokemonModel(
      {this.baseExperience,
      this.height,
      this.id,
      this.name,
      this.order,
      this.isDefault,
      this.species,
      this.weight,
      this.sprites,
      this.stats,
      this.types});

  PokemonModel.fromJson(Map<String, dynamic> json) {
    baseExperience = json['base_experience'];
    height = json['height'];
    id = json['id'];
    name = json['name'];
    order = json['order'];
    isDefault = json['is_default'];
    species =
        json['species'] != null ? Species.fromJson(json['species']) : null;
    weight = json['weight'];
    sprites =
        json['sprites'] != null ? Sprites.fromJson(json['sprites']) : null;
    if (json['stats'] != null) {
      stats = <Stats>[];
      json['stats'].forEach((v) {
        stats!.add(Stats.fromJson(v));
      });
    }
    if (json['types'] != null) {
      types = <Types>[];
      json['types'].forEach((v) {
        types!.add(Types.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['base_experience'] = baseExperience;
    data['height'] = height;
    data['id'] = id;
    data['name'] = name;
    data['order'] = order;
    data['is_default'] = isDefault;
    if (species != null) {
      data['species'] = species!.toJson();
    }
    data['weight'] = weight;
    if (sprites != null) {
      data['sprites'] = sprites!.toJson();
    }
    if (stats != null) {
      data['stats'] = stats!.map((v) => v.toJson()).toList();
    }
    if (types != null) {
      data['types'] = types!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Species {
  String? name;
  String? url;

  Species({this.name, this.url});

  Species.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    url = json['url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['url'] = url;
    return data;
  }
}

class Sprites {
  Other? other;

  Sprites({
    this.other,
  });

  Sprites.fromJson(Map<String, dynamic> json) {
    other = json['other'] != null ? Other.fromJson(json['other']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (other != null) {
      data['other'] = other!.toJson();
    }
    return data;
  }
}

class Other {
  OfficialArtwork? officialArtwork;

  Other({this.officialArtwork});

  Other.fromJson(Map<String, dynamic> json) {
    officialArtwork = json['official-artwork'] != null
        ? OfficialArtwork.fromJson(json['official-artwork'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (officialArtwork != null) {
      data['official-artwork'] = officialArtwork!.toJson();
    }
    return data;
  }
}

class OfficialArtwork {
  String? frontDefault;

  OfficialArtwork({this.frontDefault});

  OfficialArtwork.fromJson(Map<String, dynamic> json) {
    frontDefault = json['front_default'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['front_default'] = frontDefault;
    return data;
  }
}

class Stats {
  int? baseStat;
  int? effort;
  Species? stat;

  Stats({this.baseStat, this.effort, this.stat});

  Stats.fromJson(Map<String, dynamic> json) {
    baseStat = json['base_stat'];
    effort = json['effort'];
    stat = json['stat'] != null ? Species.fromJson(json['stat']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['base_stat'] = baseStat;
    data['effort'] = effort;
    if (stat != null) {
      data['stat'] = stat!.toJson();
    }
    return data;
  }
}

class Types {
  int? slot;
  Species? type;

  Types({this.slot, this.type});

  Types.fromJson(Map<String, dynamic> json) {
    slot = json['slot'];
    type = json['type'] != null ? Species.fromJson(json['type']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['slot'] = slot;
    if (type != null) {
      data['type'] = type!.toJson();
    }
    return data;
  }
}
