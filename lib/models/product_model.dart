// To parse this JSON data, do
//
//     final cartModel = cartModelFromJson(jsonString);

import 'dart:convert';

import 'package:cheif_project/models/proworkorder_detail_recipe.dart';

class CartModel {
  CartModel({
    required this.products,
  });

  List<ProWorkorderDetailRecipeModel> products;

  factory CartModel.fromJson(Map<String, dynamic> json) => CartModel(
      products: List<ProWorkorderDetailRecipeModel>.from(json["products"].map((e)=>ProWorkorderDetailRecipeModel.fromJson(e)).toList())
  );

  Map<String, dynamic> toJson() => {
    "products": products.map((e) => e.toJson()).toList(),
  };
}
