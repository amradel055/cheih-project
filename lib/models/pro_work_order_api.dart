// To parse this JSON data, do
//
//     final proWorkorderOrderRecipeModel = proWorkorderOrderRecipeModelFromJson(jsonString);

import 'dart:convert';

import 'package:cheif_project/models/proworkorder_detail_recipe.dart';


class ProWorkOrderDetailAPI {
  ProWorkOrderDetailAPI({
    this.itemId,
    this.code,
    this.unitId,
    this.screwing,
    this.qyantity,
    this.proWorkOrderDetailRecipeApiList,
    this.itemIdRecipe,
  });

  int ?itemId;
  String ?code;
  int ?unitId;
  num ?screwing;
  num ?qyantity;
  List<ProWorkorderDetailRecipeModel> ?proWorkOrderDetailRecipeApiList;
  int ?itemIdRecipe;

  factory ProWorkOrderDetailAPI.fromRawJson(String str) => ProWorkOrderDetailAPI.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory ProWorkOrderDetailAPI.fromJson(Map<String, dynamic> json) => ProWorkOrderDetailAPI(
    itemId: json["itemId"] == null ? null : json["itemId"],
    code: json["code"] == null ? null : json["code"],
    unitId: json["unitId"] == null ? null : json["unitId"],
    screwing: json["screwing"] == null ? null : json["screwing"],
    qyantity: json["qyantity"] == null ? null : json["qyantity"],
    proWorkOrderDetailRecipeApiList: json["proWorkOrderDetailRecipeAPIList"] == null ? null : List<ProWorkorderDetailRecipeModel>.from(json["proWorkOrderDetailRecipeAPIList"].map((x) => ProWorkOrderDetailAPI.fromJson(x))),
    itemIdRecipe: json["itemIdRecipe"] == null ? null : json["itemIdRecipe"],
  );

  Map<String, dynamic> toJson() => {
    "itemId": itemId == null ? null : itemId,
    "code": code == null ? null : code,
    "unitId": unitId == null ? null : unitId,
    "screwing": screwing == null ? null : screwing,
    "qyantity": qyantity == null ? null : qyantity,
    "proWorkOrderDetailRecipeAPIList": proWorkOrderDetailRecipeApiList == null ? null : List<dynamic>.from(proWorkOrderDetailRecipeApiList!.map((x) => x.toJson())),
    "itemIdRecipe": itemIdRecipe == null ? null : itemIdRecipe,
  };
}
