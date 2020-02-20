// To parse this JSON data, do
//
//     final productModel = productModelFromJson(jsonString);

import 'dart:convert';

class ProductModel {
    final String id;
    final String code;
    final String description;
    final String productTypeId;
    final ProductType productType;
    final DateTime createdAt;
    final DateTime updatedAt;
    final DateTime deletedAt;

    ProductModel({
        this.id,
        this.code,
        this.description,
        this.productTypeId,
        this.productType,
        this.createdAt,
        this.updatedAt,
        this.deletedAt,
    });

    ProductModel copyWith({
        String id,
        String code,
        String description,
        String productTypeId,
        ProductType productType,
        DateTime createdAt,
        DateTime updatedAt,
        DateTime deletedAt,
    }) => 
        ProductModel(
            id: id ?? this.id,
            code: code ?? this.code,
            description: description ?? this.description,
            productTypeId: productTypeId ?? this.productTypeId,
            productType: productType ?? this.productType,
            createdAt: createdAt ?? this.createdAt,
            updatedAt: updatedAt ?? this.updatedAt,
            deletedAt: deletedAt ?? this.deletedAt,
        );

    factory ProductModel.fromJson(String str) => ProductModel.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory ProductModel.fromMap(Map<String, dynamic> json) => ProductModel(
        id: json["id"],
        code: json["code"],
        description: json["description"],
        productTypeId: json["product_type_id"],
        productType: ProductType.fromMap(json["product_type"]),
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        deletedAt: DateTime.parse(json["deleted_at"]),
    );

    Map<String, dynamic> toMap() => {
        "id": id,
        "code": code,
        "description": description,
        "product_type_id": productTypeId,
        "product_type": productType.toMap(),
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "deleted_at": deletedAt.toIso8601String(),
    };

    static List<ProductModel> fromJsonList(List list) {
      if (list == null) return null;
      return list
        .map<ProductModel>((item) => ProductModel.fromMap(item))
        .toList();
    }
}

class ProductType {
    final String id;
    final String code;
    final String description;

    ProductType({
        this.id,
        this.code,
        this.description,
    });

    ProductType copyWith({
        String id,
        String code,
        String description,
    }) => 
        ProductType(
            id: id ?? this.id,
            code: code ?? this.code,
            description: description ?? this.description,
        );

    factory ProductType.fromJson(String str) => ProductType.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory ProductType.fromMap(Map<String, dynamic> json) => ProductType(
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