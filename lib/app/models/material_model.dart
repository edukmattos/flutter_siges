import 'dart:convert';

class MaterialModel {
    final String id;
    final String code;
    final String description;
    final String materialUnitId;
    final String createdAt;
    final String updatedAt;
    final String deletedAt;
    final MaterialUnit materialUnit;

    MaterialModel({
        this.id,
        this.code,
        this.description,
        this.materialUnitId,
        this.createdAt,
        this.updatedAt,
        this.deletedAt,
         this.materialUnit,
    });

    MaterialModel copyWith({
        String id,
        String code,
        String description,
        String materialUnitId,
        String createdAt,
        String updatedAt,
        String deletedAt,
        MaterialUnit materialUnit,
    }) => 
        MaterialModel(
            id: id ?? this.id,
            code: code ?? this.code,
            description: description ?? this.description,
            materialUnitId: materialUnitId ?? this.materialUnitId,
            createdAt: createdAt ?? this.createdAt,
            updatedAt: updatedAt ?? this.updatedAt,
            deletedAt: deletedAt ?? this.deletedAt,
            materialUnit: materialUnit ?? this.materialUnit,
        );

    factory MaterialModel.fromJson(String str) => MaterialModel.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory MaterialModel.fromMap(Map<String, dynamic> json) => MaterialModel(
        id: json["id"],
        code: json["code"],
        description: json["description"],
        materialUnitId: json["material_unit_id"],
        createdAt: json["created_at"],
        updatedAt: json["updated_at"],
        deletedAt: json["deleted_at"],
        materialUnit: MaterialUnit.fromMap(json["material_unit"]),
    );

    Map<String, dynamic> toMap() => {
        "id": id,
        "code": code,
        "description": description,
        "material_unit_id": materialUnitId,
        "created_at": createdAt,
        "updated_at": updatedAt,
        "deleted_at": deletedAt,
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