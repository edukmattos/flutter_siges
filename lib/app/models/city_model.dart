import 'dart:convert';

CityModel cityModelFromJson(String str) => CityModel.fromMap(json.decode(str));

String cityModelToJson(CityModel data) => json.encode(data.toMap());

class CityModel {
    final String id;
    final String description;
    final DateTime createdAt;
    final DateTime updatedAt;
    final DateTime deletedAt;
    final State state;

    CityModel({
        this.id,
        this.description,
        this.createdAt,
        this.updatedAt,
        this.deletedAt,
        this.state,
    });

    CityModel copyWith({
        String id,
        String description,
        DateTime createdAt,
        DateTime updatedAt,
        DateTime deletedAt,
        State state,
    }) => 
        CityModel(
            id: id ?? this.id,
            description: description ?? this.description,
            createdAt: createdAt ?? this.createdAt,
            updatedAt: updatedAt ?? this.updatedAt,
            deletedAt: deletedAt ?? this.deletedAt,
            state: state ?? this.state,
        );

    factory CityModel.fromMap(Map<String, dynamic> json) => CityModel(
        id: json["id"],
        description: json["description"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        deletedAt: DateTime.parse(json["deleted_at"]),
        state: State.fromMap(json["state"]),
    );

    Map<String, dynamic> toMap() => {
        "id": id,
        "description": description,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "deleted_at": deletedAt.toIso8601String(),
        "state": state.toMap(),
    };

    static List<CityModel> fromJsonList(List list) {
      if (list == null) return null;
      return list
        .map<CityModel>((item) => CityModel.fromMap(item))
        .toList();
    }
}

class State {
    String id;
    String code;
    String description;

    State({
        this.id,
        this.code,
        this.description,
    });

    State copyWith({
        String id,
        String code,
        String description,
    }) => 
        State(
            id: id ?? this.id,
            code: code ?? this.code,
            description: description ?? this.description,
        );

    factory State.fromMap(Map<String, dynamic> json) => State(
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
