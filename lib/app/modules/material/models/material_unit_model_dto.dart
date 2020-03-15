import 'dart:convert';

MaterialUnitModelDto materialUnitModelFromJson(String str) => MaterialUnitModelDto.fromMap(json.decode(str));

String materialUnitModelToJson(MaterialUnitModelDto data) => json.encode(data.toMap());

class MaterialUnitModelDto {
    final String id;
    final String code;
    final String description;
    final String createdAt;
    final String updateAt;
    final String deletedAt;

    MaterialUnitModelDto({
        this.id,
        this.code,
        this.description,
        this.createdAt,
        this.updateAt,
        this.deletedAt,
    });

    MaterialUnitModelDto copyWith({
        String id,
        String code,
        String description,
        String createdAt,
        String updateAt,
        String deletedAt,
    }) => 
        MaterialUnitModelDto(
            id: id ?? this.id,
            code: code ?? this.code,
            description: description ?? this.description,
            createdAt: createdAt ?? this.createdAt,
            updateAt: updateAt ?? this.updateAt,
            deletedAt: deletedAt ?? this.deletedAt,
        );

    factory MaterialUnitModelDto.fromJson(Map<String, dynamic> json) => MaterialUnitModelDto(
        id: json["id"],
        code: json["code"],
        description: json["description"],
        createdAt: json["created_at"],
        updateAt: json["update_at"],
        deletedAt: json["deleted_at"],
    );
    
    factory MaterialUnitModelDto.fromMap(Map<String, dynamic> json) => MaterialUnitModelDto(
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

    static List<MaterialUnitModelDto> fromJsonList(List list) {
      if (list == null) return null;
      return list
        .map<MaterialUnitModelDto>((item) => MaterialUnitModelDto.fromMap(item))
        .toList();
    }
}
