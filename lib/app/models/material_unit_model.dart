import 'dart:convert';

MaterialUnitModel materialUnitModelFromJson(String str) => MaterialUnitModel.fromMap(json.decode(str));

String materialUnitModelToJson(MaterialUnitModel data) => json.encode(data.toMap());

class MaterialUnitModel {
    final String id;
    final String code;
    final String description;
    final String createdAt;
    final String updateAt;
    final String deletedAt;

    MaterialUnitModel({
        this.id,
        this.code,
        this.description,
        this.createdAt,
        this.updateAt,
        this.deletedAt,
    });

    MaterialUnitModel copyWith({
        String id,
        String code,
        String description,
        String createdAt,
        String updateAt,
        String deletedAt,
    }) => 
        MaterialUnitModel(
            id: id ?? this.id,
            code: code ?? this.code,
            description: description ?? this.description,
            createdAt: createdAt ?? this.createdAt,
            updateAt: updateAt ?? this.updateAt,
            deletedAt: deletedAt ?? this.deletedAt,
        );

    factory MaterialUnitModel.fromJson(Map<String, dynamic> json) => MaterialUnitModel(
        id: json["id"],
        code: json["code"],
        description: json["description"],
        createdAt: json["created_at"],
        updateAt: json["update_at"],
        deletedAt: json["deleted_at"],
    );
    
    factory MaterialUnitModel.fromMap(Map<String, dynamic> json) => MaterialUnitModel(
        id: json["id"],
        code: json["code"],
        description: json["description"],
        createdAt: json["created_at"],
        updateAt: json["update_at"],
        deletedAt: json["deleted_at"],
    );

    Map<String, dynamic> toMap() => {
        "id": id,
        "code": code,
        "description": description,
        "created_at": createdAt,
        "update_at": updateAt,
        "deleted_at": deletedAt,
    };

    static List<MaterialUnitModel> fromJsonList(List list) {
      if (list == null) return null;
      return list
        .map<MaterialUnitModel>((item) => MaterialUnitModel.fromMap(item))
        .toList();
    }
}
