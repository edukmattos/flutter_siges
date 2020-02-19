import 'dart:convert';

ClientModel clientModelFromJson(String str) => ClientModel.fromJson(json.decode(str));

String clientModelToJson(ClientModel data) => json.encode(data.toJson());

class ClientModel {
    String id;
    String einSsa;
    String name;
    String email;

    ClientModel({
        this.id,
        this.einSsa,
        this.name,
        this.email,
    });

    factory ClientModel.fromJson(Map<String, dynamic> json) => ClientModel(
        id: json["id"],
        einSsa: json["ein_ssa"],
        name: json["name"],
        email: json["email"],
    );

    factory ClientModel.fromMap(Map<String, dynamic> json) => ClientModel(
        id: json["id"],
        einSsa: json["ein_ssa"],
        name: json["name"],
        email: json["email"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "ein_ssa": einSsa,
        "name": name,
        "email": email,
    };

    static List<ClientModel> fromJsonList(List list) {
      if (list == null) return null;
      return list
        .map<ClientModel>((item) => ClientModel.fromMap(item))
        .toList();
    }
}