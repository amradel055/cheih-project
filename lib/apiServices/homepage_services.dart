


import 'dart:convert';
import 'package:cheif_project/models/pro_work_order_api.dart';
import 'package:cheif_project/models/proworkorder_detail_recipe.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import '../const/strings.dart';

class HomePageServices {

  Future getItemsList(int branchId ) async{

    Uri uri = Uri.parse(url + "ProWorkOrderDetail/itemList") ;
    var body = jsonEncode({
      "branchId" : branchId ,
    });

    Map<String,String> headers = {
      "Content-Type": "application/json",
    };

    try {
      var response = await http.post(uri , body: body , headers: headers );
      if(response.statusCode == 200){
        var _response = json.decode(utf8.decode(response.bodyBytes)) ;
        return _response ;
      }
    }catch (e){
      print(e);
    }
  }

  Future getRecipeyList(int branchId , int itemIdAPI ) async{

    Uri uri = Uri.parse(url + "ProWorkOrderDetail/getRecipeByItemId") ;
    var body = jsonEncode({
      "branchId" : branchId ,
      "itemIdAPI": itemIdAPI
    });

    Map<String,String> headers = {
      "Content-Type": "application/json",
    };

    try {
      var response = await http.post(uri , body: body , headers: headers );
      if(response.statusCode == 200){
        var _response = json.decode(utf8.decode(response.bodyBytes)) ;
        return _response ;
      }
    }catch (e){
      print(e);
    }
  }

  Future getAllRecipesList(int branchId ) async{

    Uri uri = Uri.parse(url + "ProWorkOrderDetail/getRecipe") ;
    var body = jsonEncode({
      "branchId" : branchId ,
    });

    Map<String,String> headers = {
      "Content-Type": "application/json",
    };

    try {
      var response = await http.post(uri , body: body , headers: headers );
      if(response.statusCode == 200){
        var _response = json.decode(utf8.decode(response.bodyBytes)) ;
        return _response ;
      }
    }catch (e){
      print(e);
    }
  }



  Future save(ProWorkOrderDetailAPI dto,int branchId,int companyId,int createdBy,int inventoryId) async{
    Uri uri = Uri.parse(url + "ProWorkOrderDetail/saveProworkAndRecipe");

    var body = jsonEncode({

      "branchId" : branchId ,
      "companyId" : companyId ,
      "createdBy" : createdBy ,
      "inventoryId":inventoryId,
      "proWorkOrderDetailAPI":dto,

    });
    // print(body);
    Map<String,String> headers = {
      "Content-Type": "application/json",
    };

    try {
      var response = await http.post(uri , body: body , headers: headers );
      if(response.statusCode == 200){
        var _response = json.decode(utf8.decode(response.bodyBytes)) ;
        return _response ;
      }
    }catch (e){
      print(e);
    }
  }


}