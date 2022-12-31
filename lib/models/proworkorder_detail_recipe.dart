// To parse this JSON data, do
//
//     final proWorkorderDetailRecipeModel = proWorkorderDetailRecipeModelFromJson(jsonString);

import 'dart:convert';

class ProWorkorderDetailRecipeModel {
  ProWorkorderDetailRecipeModel({
    this.code,
    this.itemIdRecipe,
    this.qyantity,
    this.screwing,
    this.unitId,
    this.itemNameRecipe,
  });

  String?code;
  int ?itemIdRecipe;
  double? qyantity;
  num ?screwing;
  num ?unitId;
  String ?itemNameRecipe;


  factory ProWorkorderDetailRecipeModel.fromRawJson(String str) => ProWorkorderDetailRecipeModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory ProWorkorderDetailRecipeModel.fromJson(Map<String, dynamic> json) => ProWorkorderDetailRecipeModel(
    code: json["code"] == null ? null : json["code"],
    itemIdRecipe: json["itemIdRecipe"] == null ? null : json["itemIdRecipe"],
    qyantity: json["qyantity"] == null ? null : json["qyantity"].toDouble(),
    screwing: json["screwing"] == null ? null : json["screwing"],
    unitId: json["unitId"] == null ? null : json["unitId"],
    itemNameRecipe: json["itemNameRecipe"] == null ? null : json["itemNameRecipe"],
  );

  Map<String, dynamic> toJson() => {
    "code": code == null ? null : code,
    "itemIdRecipe": itemIdRecipe == null ? null : itemIdRecipe,
    "qyantity": qyantity == null ? null : qyantity,
    "screwing": screwing == null ? null : screwing,
    "unitId": unitId == null ? null : unitId,
    "itemNameRecipe": itemNameRecipe == null ? null : itemNameRecipe,
  };
}
