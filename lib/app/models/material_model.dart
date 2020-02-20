import 'dart:convert';

class MaterialModel {
    final String id;
    final String code;
    final String description;
    final String materialUnitId;
    final MaterialUnit materialUnit;
    final DateTime createdAt;
    final DateTime updatedAt;
    final DateTime deletedAt;

    MaterialModel({
        this.id,
        this.code,
        this.description,
        this.materialUnitId,
        this.materialUnit,
        this.createdAt,
        this.updatedAt,
        this.deletedAt,
    });

    MaterialModel copyWith({
        String id,
        String code,
        String description,
        String materialUnitId,
        MaterialUnit materialUnit,
        DateTime createdAt,
        DateTime updatedAt,
        DateTime deletedAt,
    }) => 
        MaterialModel(
            id: id ?? this.id,
            code: code ?? this.code,
            description: description ?? this.description,
            materialUnitId: materialUnitId ?? this.materialUnitId,
            materialUnit: materialUnit ?? this.materialUnit,
            createdAt: createdAt ?? this.createdAt,
            updatedAt: updatedAt ?? this.updatedAt,
            deletedAt: deletedAt ?? this.deletedAt,
        );

    factory MaterialModel.fromJson(String str) => MaterialModel.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory MaterialModel.fromMap(Map<String, dynamic> json) => MaterialModel(
        id: json["id"],
        code: json["code"],
        description: json["description"],
        materialUnitId: json["material_unit_id"],
        materialUnit: MaterialUnit.fromMap(json["material_unit"]),
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        deletedAt: DateTime.parse(json["deleted_at"]),
    );

    Map<String, dynamic> toMap() => {
        "id": id,
        "code": code,
        "description": description,
        "material_unit_id": materialUnitId,
        "material_unit": materialUnit.toMap(),
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "deleted_at": deletedAt.toIso8601String(),
    };

    static List<MaterialModel> fromJsonList(List list) {
      if (list == null) return null;
      return list
        .map<MaterialModel>((item) => MaterialModel.fromMap(item))
        .toList();
    }
}

class MaterialUnit {
    final String id;
    final String code;
    final String description;

    MaterialUnit({
        this.id,
        this.code,
        this.description,
    });

    MaterialUnit copyWith({
        String id,
        String code,
        String description,
    }) => 
        MaterialUnit(
            id: id ?? this.id,
            code: code ?? this.code,
            description: description ?? this.description,
        );

    factory MaterialUnit.fromJson(String str) => MaterialUnit.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory MaterialUnit.fromMap(Map<String, dynamic> json) => MaterialUnit(
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