
import 'package:cheif_project/apiServices/homepage_services.dart';
import 'package:cheif_project/models/items_list_model.dart';
import 'package:cheif_project/models/pro_work_order_api.dart';
import 'package:cheif_project/models/product_model.dart';
import 'package:cheif_project/models/proworkorder_detail_recipe.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';


class HomepageProvider with ChangeNotifier {
  List<ItemListModel> itemsList = [] ;
  bool Loading = true ;
  ItemListModel? itemSelectetd;
  List<ProWorkorderDetailRecipeModel> recipyList = [] ;
  bool recipyLoading = true ;
  List<ProWorkorderDetailRecipeModel> AllrecipyList = [] ;
  ProWorkorderDetailRecipeModel? recipeSelectetd;
  final _box = GetStorage();
  static const _cartKey = "cart";
  ProWorkOrderDetailAPI?proWorkOrderDetailAPI;
  bool saveLoading = true ;

  //  quantityone(int index,double quantity,double val){
  //   val = recipyList[index].qyantity! * quantity;
  //
  // }









  Future findItemsList(int branchId  , BuildContext context) async{

    await HomePageServices().getItemsList(branchId).then((value){
      if(value != null){
        itemsList = List<ItemListModel>.from(value.map((e) => ItemListModel.fromJson(e)));
        Loading = false ;
        notifyListeners();
      }else{
        Loading = false ;
      }
    });
  }
  void setItemSelected(ItemListModel? itemSelected) {
    this.itemSelectetd = itemSelected;
    notifyListeners();
  }
  Future findRecipyList(int branchId ,int itemIdAPI , BuildContext context) async{

    await HomePageServices().getRecipeyList(branchId,itemIdAPI).then((value){
      if(value != null){
        recipyList = List<ProWorkorderDetailRecipeModel>.from(value.map((e) => ProWorkorderDetailRecipeModel.fromJson(e)));
        Loading = false ;
        notifyListeners();
      }else{
        Loading = false ;
      }
    });
  }
  Future findAllRecipesList(int branchId , BuildContext context) async{

    await HomePageServices().getAllRecipesList(branchId).then((value){
      if(value != null){
        AllrecipyList = List<ProWorkorderDetailRecipeModel>.from(value.map((e) => ProWorkorderDetailRecipeModel.fromJson(e)));
        Loading = false ;
        notifyListeners();
      }else{
        Loading = false ;
      }
    });
  }

  void setRecipeSelected(ProWorkorderDetailRecipeModel? recipeSelected) {
    this.recipeSelectetd = recipeSelected;
    notifyListeners();
  }

  Future save ( int?branchId ,int?createdBy ,int?companyId ,int?inventoryId ,num?qyantity ,num?screwing ,String?code ,int?itemIdRecipe ,int?unitId ,int?itemId ,List<ProWorkorderDetailRecipeModel>?proWorkOrderDetailRecipeApiList ,BuildContext context)async{
    await HomePageServices().save( ProWorkOrderDetailAPI(qyantity:qyantity,screwing: screwing,code: code,itemIdRecipe: itemIdRecipe,unitId: unitId,itemId: itemId,proWorkOrderDetailRecipeApiList: proWorkOrderDetailRecipeApiList) , branchId!, createdBy!,companyId!,inventoryId!).then((value) {
      saveLoading = true;

      if (value != null) {

        proWorkOrderDetailAPI = ProWorkOrderDetailAPI.fromJson(value);
        companyId=companyId;
        branchId=branchId;
        createdBy=createdBy;
        inventoryId=inventoryId;
        saveLoading = false;
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
              content: Text('تم الحفظ بنجاح..'),
          ),
        );
        recipyList.clear();
        recipeSelectetd=null;

        notifyListeners();

      }else{
        saveLoading = false;
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('لم يتم الحفظ..'),
          ),
        );
        // error message
      }
      notifyListeners();

    }
    );
  }
  CartModel getCart(){
    final data = _box.read(_cartKey);
    if(data == null) return CartModel(products: recipyList);
    return CartModel.fromJson(data);

  }
  Future<void> addProduct(ProWorkorderDetailRecipeModel product) async {
    final cart = getCart();
    recipyList.add(product);
    // cart.products.add(product);
    // addCounter();
    getCart();
    await saveCart(cart);
  }

  Future<void> updateProduct(ProWorkorderDetailRecipeModel product) async {
    final cart = getCart();
    // cart.products.insert(product!.itemIdRecipe!,);
    await saveCart(cart);
    notifyListeners();
    // removeCounter();

  }
  Future<void> removeProduct(ProWorkorderDetailRecipeModel product) async {
    final cart = getCart();
    recipyList.removeWhere((element) => element.itemIdRecipe == product.itemIdRecipe);
    cart.products.removeWhere((element) => element.itemIdRecipe == product.itemIdRecipe);
    // await saveCart(cart);
    notifyListeners();
    // removeCounter();

  }
  Future<void> deleteallProduct() async {
    await _box.remove(_cartKey);
    recipyList.clear();
    notifyListeners();
  }

  Future<void> saveCart(CartModel cartModel) async {
    await _box.write(_cartKey, cartModel.toJson());
  }

// filter(String orderNumber , index){
  //   if(index == 0){
  //       activeOrders = List<Sales>.from(allActiveOrders.where((element) => element.id.toString().contains(orderNumber)).toList());
  //       notifyListeners();
  //     }
  // }

}