class PokeListResults {
  int? count;
  String? next;
  String? previous;
  List<PokeListModel>? results;

  PokeListResults({this.count, this.next, this.previous, this.results});

  PokeListResults.fromJson(Map<String, dynamic> json) {
    count = json['count'];
    next = json['next'];
    previous = json['previous'];
    if (json['results'] != null) {
      results = <PokeListModel>[];
      json['results'].forEach((v) {
        results!.add(PokeListModel.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['count'] = count;
    data['next'] = next;
    data['previous'] = previous;
    if (results != null) {
      data['results'] = results!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class PokeListModel {
  String? name;
  String? url;

  PokeListModel({this.name, this.url});

  PokeListModel.fromJson(Map<String, dynamic> json) {
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
