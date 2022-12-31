// To parse this JSON data, do
//
//     final itemListModel = itemListModelFromJson(jsonString);

import 'dart:convert';

class ItemListModel {
  ItemListModel({
    this.code,
    this.id,
    this.name,
    this.unitId,

  });

  String?code;
  int ?id;
  String? name;
  int ?unitId;


  factory ItemListModel.fromRawJson(String str) => ItemListModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory ItemListModel.fromJson(Map<String, dynamic> json) => ItemListModel(
    code: json["code"] == null ? null : json["code"],
    id: json["id"] == null ? null : json["id"],
    name: json["name"] == null ? null : json["name"],
    unitId: json["unitId"] == null ? null : json["unitId"],


  );

  Map<String, dynamic> toJson() => {
    "code": code == null ? null : code,
    "id": id == null ? null : id,
    "name": name == null ? null : name,
    "unitId": unitId == null ? null : unitId,


  };
}
