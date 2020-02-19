import 'dart:convert';

MaterialModel materialModelFromJson(String str) => MaterialModel.fromMap(json.decode(str));

String materialModelToJson(MaterialModel data) => json.encode(data.toMap());

class MaterialModel {
    String id;
    String code;
    String description;
    DateTime createdAt;
    DateTime updatedAt;
    DateTime deletedAt;
    MaterialUnit materialUnit;

    MaterialModel({
        this.id,
        this.code,
        this.description,
        this.createdAt,
        this.updatedAt,
        this.deletedAt,
        this.materialUnit,
    });

    MaterialModel copyWith({
        String id,
        String code,
        String description,
        DateTime createdAt,
        DateTime updatedAt,
        DateTime deletedAt,
        MaterialUnit materialUnit,
    }) => 
        MaterialModel(
            id: id ?? this.id,
            code: code ?? this.code,
            description: description ?? this.description,
            createdAt: createdAt ?? this.createdAt,
            updatedAt: updatedAt ?? this.updatedAt,
            deletedAt: deletedAt ?? this.deletedAt,
            materialUnit: materialUnit ?? this.materialUnit,
        );

    factory MaterialModel.fromMap(Map<String, dynamic> json) => MaterialModel(
        id: json["id"],
        code: json["code"],
        description: json["description"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        deletedAt: DateTime.parse(json["deleted_at"]),
        materialUnit: MaterialUnit.fromMap(json["material_unit"]),
    );

    Map<String, dynamic> toMap() => {
        "id": id,
        "code": code,
        "description": description,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "deleted_at": deletedAt.toIso8601String(),
        "material_unit": materialUnit.toMap(),
    };

    static List<MaterialModel> fromJsonList(List list) {
      if (list == null) return null;
      return list
        .map<MaterialModel>((item) => MaterialModel.fromMap(item))
        .toList();
    }
}

class MaterialUnit {
    String id;
    String code;
    String description;
    DateTime createdAt;
    DateTime updatedAt;
    DateTime deletedAt;

    MaterialUnit({
        this.id,
        this.code,
        this.description,
        this.createdAt,
        this.updatedAt,
        this.deletedAt,
    });

    MaterialUnit copyWith({
        String id,
        String code,
        String description,
        DateTime createdAt,
        DateTime updatedAt,
        DateTime deletedAt,
    }) => 
        MaterialUnit(
            id: id ?? this.id,
            code: code ?? this.code,
            description: description ?? this.description,
            createdAt: createdAt ?? this.createdAt,
            updatedAt: updatedAt ?? this.updatedAt,
            deletedAt: deletedAt ?? this.deletedAt,
        );

    factory MaterialUnit.fromMap(Map<String, dynamic> json) => MaterialUnit(
        id: json["id"],
        code: json["code"],
        description: json["description"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        deletedAt: DateTime.parse(json["deleted_at"]),
    );

    Map<String, dynamic> toMap() => {
        "id": id,
        "code": code,
        "description": description,
        "description": description,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "deleted_at": deletedAt.toIso8601String(),
    };
}