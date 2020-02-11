import 'dart:convert';

class CityModel {
    int id;
    String description;
    Regions regions;

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
        id: json["id"],
        description: json["description"],
        regions: Regions.fromMap(json["regions"]),
    );

    Map<String, dynamic> toMap() => {
        "id": id,
        "description": description,
        "regions": regions.toMap(),
    };

    static List<CityModel> fromJsonList(List list) {
      if (list == null) return null;
      return list
        .map<CityModel>((item) => CityModel.fromJson(item))
        .toList();
    }
}

class Regions {
    int id;
    String code;
    String description;

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
        id: json["id"],
        code: json["code"],
        description: json["description"],
    );

    Map<String, dynamic> toMap() => {
        "id": id,
        "code": code,
        "description": description,
    };
}