import 'dart:convert';

class CityModel {
    final String id;
    final String description;
    final String stateId;
    final String createdAt;
    final String updatedAt;
    final String deletedAt;
    final State state;

    CityModel({
        this.id,
        this.description,
        this.stateId,
        this.createdAt,
        this.updatedAt,
        this.deletedAt,
        this.state,
    });

    CityModel copyWith({
        String id,
        String description,
        String stateId,
        String createdAt,
        String updatedAt,
        String deletedAt,
        State state,
    }) => 
        CityModel(
            id: id ?? this.id,
            description: description ?? this.description,
            stateId: stateId ?? this.stateId,
            createdAt: createdAt ?? this.createdAt,
            updatedAt: updatedAt ?? this.updatedAt,
            deletedAt: deletedAt ?? this.deletedAt,
            state: state ?? this.state,
        );

    factory CityModel.fromJson(String str) => CityModel.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory CityModel.fromMap(Map<String, dynamic> json) => CityModel(
        id: json["id"],
        description: json["description"],
        stateId: json["state_id"],
        createdAt: json["created_at"],
        updatedAt: json["updated_at"],
        deletedAt: json["deleted_at"],
        state: State.fromMap(json["state"]),
    );

    Map<String, dynamic> toMap() => {
        "id": id,
        "description": description,
        "state_id": stateId,
        "created_at": createdAt,
        "updated_at": updatedAt,
        "deleted_at": deletedAt,
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
    final String id;
    final String code;
    final String description;

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

    factory State.fromJson(String str) => State.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

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