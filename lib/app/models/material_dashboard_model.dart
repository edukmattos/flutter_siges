import 'dart:convert';

MaterialDashboardModel materialDashboardModelFromJson(String str) => MaterialDashboardModel.fromMap(json.decode(str));

String materialDashboardModelToJson(MaterialDashboardModel data) => json.encode(data.toMap());

class MaterialDashboardModel {
    final int count;

    MaterialDashboardModel({
        this.count,
    });

    MaterialDashboardModel copyWith({
        int count,
    }) => 
        MaterialDashboardModel(
            count: count ?? this.count,
        );

    factory MaterialDashboardModel.fromMap(Map<String, dynamic> json) => MaterialDashboardModel(
        count: json["count"],
    );

    Map<String, dynamic> toMap() => {
        "count": count,
    };
}
