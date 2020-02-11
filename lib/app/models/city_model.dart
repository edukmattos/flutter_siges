import 'dart:convert';

class CityModel {
    final int id;
    final String description;
    final Regions regions;

    CityModel({
        this.id,
        this.description,
        this.regions,
    });

    CityModel copyWith({
        int id,
        String description,
        Regions regions,
    }) => 
        CityModel(
            id: id ?? this.id,
            description: description ?? this.description,
            regions: regions ?? this.regions,
        );

    factory CityModel.fromJson(String str) => CityModel.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory CityModel.fromMap(Map<String, dynamic> json) => CityModel(
        id: json["id"] == null ? null : json["id"],
        description: json["description"] == null ? null : json["description"],
        regions: json["regions"] == null ? null : Regions.fromMap(json["regions"]),
    );

    Map<String, dynamic> toMap() => {
        "id": id == null ? null : id,
        "description": description == null ? null : description,
        "regions": regions == null ? null : regions.toMap(),
    };
}

class Regions {
    final int id;
    final String code;
    final String description;

    Regions({
        this.id,
        this.code,
        this.description,
    });

    Regions copyWith({
        int id,
        String code,
        String description,
    }) => 
        Regions(
            id: id ?? this.id,
            code: code ?? this.code,
            description: description ?? this.description,
        );

    factory Regions.fromJson(String str) => Regions.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory Regions.fromMap(Map<String, dynamic> json) => Regions(
        id: json["id"] == null ? null : json["id"],
        code: json["code"] == null ? null : json["code"],
        description: json["description"] == null ? null : json["description"],
    );

    Map<String, dynamic> toMap() => {
        "id": id == null ? null : id,
        "code": code == null ? null : code,
        "description": description == null ? null : description,
    };

    List<CityModel> fromJsonList(List list) {
      if (list == null) return null;
      return list
        .map<CityModel>((item) => CityModel.fromMap(item))
        .toList();
    }
}