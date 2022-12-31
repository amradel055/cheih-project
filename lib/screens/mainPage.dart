import 'package:cheif_project/const/colors.dart';
import 'package:cheif_project/const/text_styles.dart';
import 'package:cheif_project/models/items_list_model.dart';
import 'package:cheif_project/models/product_model.dart';
import 'package:cheif_project/models/proworkorder_detail_recipe.dart';
import 'package:cheif_project/providers/auth_provider.dart';
import 'package:cheif_project/providers/homepage_provider.dart';
import 'package:cheif_project/screens/login.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:provider/src/provider.dart';


class mainPage extends StatefulWidget {
  const mainPage({Key? key}) : super(key: key);

  @override
  _mainPageState createState() => _mainPageState();
}

class _mainPageState extends State<mainPage> {

  List<ItemListModel> itemslist = [] ;
  bool Loading = true ;

  List<ProWorkorderDetailRecipeModel> recipylist = [] ;
  bool recipyLoading = true ;
  List<ProWorkorderDetailRecipeModel> Allrecipylist = [] ;
  var firstquantity =TextEditingController();
  var quantity =TextEditingController();
  var quantityedited =TextEditingController();
  late CartModel cart;


  @override
  void initState() {
    context.read<HomepageProvider>().findItemsList(240 ,context).then((value){
      itemslist = context.read<HomepageProvider>().itemsList ;
    });
    context.read<HomepageProvider>().findAllRecipesList(240 ,context).then((value){
      Allrecipylist = context.read<HomepageProvider>().AllrecipyList ;
    });
    // cart = context.read<HomepageProvider>().getCart();


    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size =MediaQuery.of(context).size;
    itemslist = context.watch<HomepageProvider>().itemsList ;
    Allrecipylist = context.watch<HomepageProvider>().AllrecipyList ;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey[200],
        elevation: 0.0,
        leading: Icon(
          Icons.arrow_back_ios,
          color: Colors.black,
        ),title: Padding(
          padding:  EdgeInsets.fromLTRB(size.width*.2,0,0,0),
          child: Text('انشاء امر شغل',style: titleTextStyleBold(size,color: appHallsRedDark),),
        ),
        actions: [
          Padding(
            padding: EdgeInsets.fromLTRB(0, 0, size.width * .05, 0),
            child:
            GestureDetector(
              onTap: (){
                context.read<AuthProvider>().logout(context);
              },
              child: Row(
                children: [
                  Text("LOGOUT",style: smallTextStyleBold(size,color: appHallsRedDark),),
                  Icon(
                    Icons.logout,
                    color: Colors.black,
                  ),

                ],
              ),
            )
            
          ),
        ],
      ),
      body: Directionality(
        textDirection: TextDirection.rtl,
        child: SingleChildScrollView(
          physics: const AlwaysScrollableScrollPhysics(),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Center(
                  child: Container(
                    width: size.width * .9,
                    height: size.height*.2,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(
                            Radius.circular(10)),
                        color: Colors.grey[200],
                        border: Border.all(color: Colors.grey,width: 2)),
                    child:Column(
                      children: [
                        Row(
                          children: [
                            Column(
                              children: [
                                Text('الصنف',style: titleTextStyleBold(size)),
                                Padding(
                                  padding: const EdgeInsets.fromLTRB(0, 0, 10, 0),
                                  child: Container(
                                      width: size.width * .4,
                                      height: size.height * .07,

                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(5)),
                                          color: Colors.white,
                                          border: Border.all(color: Colors.grey)),
                                      child: DropdownSearch<ItemListModel>(
                                        showSearchBox: true,
                                        items: itemslist.map((e) => e).toList(),
                                        itemAsString: (ItemListModel? e) => e!.name!,
                                        // dropdownSearchDecoration: InputDecoration(
                                        //   hintText: delegatorList.isNotEmpty?  delegatorList[0].name:"" ,
                                        // ),
                                        onChanged: (value) => context.read<HomepageProvider>().setItemSelected(value),
                                        selectedItem:context.read<HomepageProvider>().itemSelectetd,
                                      )
                                  ),
                                ),
                              ],
                            ),
                            Column(
                              children: [
                                Text('الكميه',style: titleTextStyleBold(size)),
                                Padding(
                                  padding: const EdgeInsets.fromLTRB(0, 0, 10, 0),
                                  child: Container(
                                    width: size.width * .4,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(5)),
                                        color: Colors.white,
                                        border: Border.all(color: Colors.grey)),
                                    child:  TextFormField(
                                      // focusNode: quantityFocus,
                                      textAlign: TextAlign.center,
                                      decoration: const InputDecoration(
                                          border: OutlineInputBorder(), contentPadding: EdgeInsets.zero),
                                      controller: firstquantity,
                                      onChanged: (value)  {
                                        firstquantity.text=value;

                                      },
                                    ),

                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),

                        Padding(
                          padding: const EdgeInsets.all(6.0),
                          child: Container(
                            width: size.width*.3,
                            height: size.height*.055,
                            decoration: BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(20.00)),

                              color: appcolor,
                            ),
                            child: MaterialButton(
                              onPressed: () {

                              context.read<HomepageProvider>().findRecipyList(context.read<AuthProvider>().userModel!.branchId!,context.read<HomepageProvider>().itemSelectetd!.id! ,context).then((value){
                                recipylist = context.read<HomepageProvider>().recipyList ;
                              });
                              // recipylist = context.watch<HomepageProvider>().recipyList ;
                              cart = context.read<HomepageProvider>().getCart();
                              setState(() {});
                              },
                              child:  Text(
                                'عرض',
                                style: titleTextStyleBold(size,color: Colors.white),
                              ),
                            ),
                          ),
                        ),

                      ],
                    )


                  ),
                ),
              ),
              Center(
                child: Container(
                  width: size.width*.95,
                  height: size.height*.004,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(
                          Radius.circular(30)),
                      color:appHallsRedDark,
                )
                ),
              ),
              Container(
                child: Column(
                  children: [
                    Center(
                      child: Container(
                        width: size.width*.9,
                        height: size.height*.07,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("المكونات",style: titleTextStyleBold(size,color:appHallsRedDark ),),
                            // GestureDetector(
                            //     onTap: (){
                            //       context.read<HomepageProvider>().deleteallProduct();
                            //       setState(() {
                            //
                            //       });
                            //     },
                            //     child:  Container(
                            //
                            //       height: size.height * .03,
                            //       width: size.width * .1,
                            //       decoration: BoxDecoration(
                            //         borderRadius: BorderRadius.all(
                            //             Radius.circular(50.00)), color: Colors.grey[200],
                            //       ),
                            //       child:
                            //       Row(mainAxisAlignment: MainAxisAlignment.spaceAround,
                            //         children: [
                            //           Icon(Icons.delete,color: appHallsRedDark ),
                            //         ],
                            //       ),
                            //
                            //     ),),
                            Padding(
                              padding:  EdgeInsets.fromLTRB(8,0,size.width*.33,0),
                              child: GestureDetector(onTap: () {
                                Widget okButton = TextButton(
                                  child: Center(child: Text("اضافه",style: titleTextStyleNormal(size,color: Colors.white),)),
                                  onPressed: () {
                                     ProWorkorderDetailRecipeModel prod=ProWorkorderDetailRecipeModel();
                                     prod.itemIdRecipe= context.read<HomepageProvider>().recipeSelectetd!.itemIdRecipe;
                                     prod.itemNameRecipe= context.read<HomepageProvider>().recipeSelectetd!.itemNameRecipe;
                                     prod.qyantity= double.tryParse(quantity.text);
                                     prod.code= context.read<HomepageProvider>().recipeSelectetd!.code;
                                     prod.unitId=context.read<HomepageProvider>().recipeSelectetd!.unitId;
                                     context.read<HomepageProvider>().addProduct(prod);
                                     Navigator.pop(context);
                                     setState(() {

                                     });
                                  },
                                );

                                AlertDialog alert = AlertDialog(
                                  title: Center(child: Text("اضافه",style: subTitleTextStyle(size),)),

                                  content: Directionality(textDirection: TextDirection.rtl,
                                    child: Container(

                                      height: size.height*.33,
                                      width: size.width*.4,
                                      child:

                                      SingleChildScrollView(
                                        physics: AlwaysScrollableScrollPhysics(),
                                        child: Column(

                                          children: [

                                            Padding(
                                              padding: const EdgeInsets.all(8.0),
                                              child: Center(
                                                child: Container(
                                                    width: size.width * .9,
                                                    height: size.height*.3,
                                                    decoration: BoxDecoration(
                                                        borderRadius: BorderRadius.all(
                                                            Radius.circular(10)),
                                                        color: Colors.grey[200],
                                                        border: Border.all(color: Colors.grey,width: 2)),
                                                    child: Column(
                                                      children: [
                                                        Column(
                                                          children: [
                                                            Text('المكونات:',style: titleTextStyleBold(size)),
                                                            Padding(
                                                              padding: const EdgeInsets.fromLTRB(0, 0, 10, 0),
                                                              child: Container(
                                                                  width: size.width * .4,
                                                                  decoration: BoxDecoration(
                                                                      borderRadius: BorderRadius.all(
                                                                          Radius.circular(5)),
                                                                      color: Colors.white,
                                                                      border: Border.all(color: Colors.grey)),
                                                                  child: DropdownSearch<ProWorkorderDetailRecipeModel>(
                                                                    showSearchBox: true,
                                                                    items: Allrecipylist.map((e) => e).toList(),
                                                                    itemAsString: (ProWorkorderDetailRecipeModel? e) => e!.itemNameRecipe!,
                                                                    // dropdownSearchDecoration: InputDecoration(
                                                                    //   hintText: delegatorList.isNotEmpty?  delegatorList[0].name:"" ,
                                                                    // ),
                                                                    onChanged: (value) => context.read<HomepageProvider>().setRecipeSelected(value),
                                                                    selectedItem:context.read<HomepageProvider>().recipeSelectetd,
                                                                  )
                                                              ),
                                                            ),

                                                          ],
                                                        ),
                                                        Column(
                                                          children: [
                                                            Text('الكميه',style: titleTextStyleBold(size)),
                                                            Padding(
                                                              padding: const EdgeInsets.fromLTRB(0, 0, 10, 0),
                                                              child: Container(
                                                                width: size.width * .4,
                                                                decoration: BoxDecoration(
                                                                    borderRadius: BorderRadius.all(
                                                                        Radius.circular(5)),
                                                                    color: Colors.white,
                                                                    border: Border.all(color: Colors.grey)),
                                                                child:  TextFormField(
                                                                  // focusNode: quantityFocus,
                                                                  textAlign: TextAlign.center,
                                                                  decoration: const InputDecoration(
                                                                      border: OutlineInputBorder(), contentPadding: EdgeInsets.zero),
                                                                  controller: quantity,
                                                                  onChanged: (value)  {
                                                                    quantity.text=value;
                                                                  },
                                                                ),

                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ],
                                                    )

                                                ),
                                              ),
                                            ),

                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                  actions: [
                                    Center(
                                      child: Container(
                                          height: size.height*.1,
                                          width: size.width*.2,
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(6.00)),
                                            color: Colors.blueAccent,
                                          ),
                                          child: okButton),
                                    ),
                                  ],
                                );
                                showDialog(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return alert;
                                  },
                                );


                              },
                                child: Container(

                                  height: size.height * .06,
                                  width: size.width * .1,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.all(
                                        Radius.circular(50.00)), color: Colors.grey[200],
                                  ),
                                  child:
                                  Row(mainAxisAlignment: MainAxisAlignment.spaceAround,
                                    children: [
                                      Icon(Icons.add,color: appHallsRedDark ),
                                    ],
                                  ),

                                ),
                              ),
                            ),

                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Center(
                child: Container(
                    width: size.width*.95,
                    height: size.height*.004,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(
                          Radius.circular(30)),
                      color:appHallsRedDark,
                    )
                ),
              ),
              recipylist==null?SizedBox():
              SingleChildScrollView(
                physics: AlwaysScrollableScrollPhysics(),
                child: Stack(

                  children: [

                   Container(
                      width: size.width,
                      height: size.height*.58,
                      child: SingleChildScrollView(
                        physics: const AlwaysScrollableScrollPhysics(),
                        child: Column(
                          children: [
                            Container(height: size.height*.53,
                                child:recipylist != null?
                                ListView.builder(   itemCount:recipylist != null? recipylist.length:0,
                                  itemBuilder:(context,index){
                                    final recipes = recipylist[index];

                                    return  item(size,recipes);

                                  },scrollDirection:Axis.vertical,):Container()
                            )



                          ],
                        ),
                      ),
                    ),
                    Positioned(
                      top: size.height*.5,
                      right: size.width*.3,
                      child:
                      Container(
                        width: size.width*.4,
                        decoration: BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(20.00)),

                          color: appcolor,
                        ),
                        child: MaterialButton(
                          onPressed: () {
                            context.read<HomepageProvider>().save(context.read<AuthProvider>().userModel!.branchId,context.read<AuthProvider>().userModel!.companyId, context.read<AuthProvider>().userModel!.id, context.read<AuthProvider>().userModel!.inventoryId, double.parse(firstquantity.text), 1, context.read<HomepageProvider>().itemSelectetd!.code, context.read<HomepageProvider>().itemSelectetd!.id, context.read<HomepageProvider>().itemSelectetd!.unitId, context.read<HomepageProvider>().itemSelectetd!.id,context.read<HomepageProvider>().recipyList, context);
                            // context.read<HomepageProvider>().recipyList.clear();
                            // context.read<HomepageProvider>().recipeSelectetd=null;
                            // firstquantity.clear();
                            setState(() {

                            });
                          },
                          child:  Text(
                            'حفظ',
                            style: titleTextStyleBold(size,color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              )






            ],
          ),
        ),
      ),
    );
  }
  item (Size size,ProWorkorderDetailRecipeModel recipy){
    return  Column(
      children: [
        Center(
          child: Container(
              width: size.width ,
              height: size.height*.1,
              color: Colors.grey[200],

              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(3.0),
                    child: CircleAvatar(
                      child: Text("${0}",style: titleTextStyleBold(size,color: Colors.grey[200]),),
                      radius: size.width*.04,
                      backgroundColor:appHallsRedDark ,
                    ),
                  ),
                  SizedBox(
                    width: size.width*.6,
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Text('المكون:',style: titleTextStyleBold(size)),
                            // Text('المكون:',style: titleTextStyleBold(size)),

                            Text(recipy.itemNameRecipe==null?"":recipy.itemNameRecipe!,style: titleTextStyleBold(size)),
                          ],
                        ),
                        Row(
                          children: [
                            Text('الكميه:',style: titleTextStyleBold(size)),

                            // Text(recipy.qyantity==null?"":(recipy.qyantity! *(double.parse(quantity.text))).toString(),style: titleTextStyleBold(size)),
                            Text(recipy.qyantity==null ?"":((recipy.qyantity!*double.parse(firstquantity.text==null?"1":firstquantity.text)).toStringAsFixed(3)).toString(),style: titleTextStyleBold(size)),

                          ],
                        ),

                      ],
                    ),
                  ),
                  Padding(
                    padding:  EdgeInsets.fromLTRB(8,0,0,0),
                    child: GestureDetector(onTap: () {
                      Widget okButton = TextButton(
                        child: Center(child: Text("تعديل",style: titleTextStyleNormal(size,color: Colors.white),)),
                        onPressed: () {

                          context.read<HomepageProvider>().saveCart(cart);
                          quantityedited.text="";
                          Navigator.pop(context);
                        },
                      );

                      AlertDialog alert = AlertDialog(
                        title: Center(child: Text("تعديل",style: subTitleTextStyle(size),)),

                        content: Directionality(textDirection: TextDirection.rtl,
                          child: Container(

                            height: size.height*.3,
                            width: size.width*.4,
                            child:

                            SingleChildScrollView(
                              physics: AlwaysScrollableScrollPhysics(),
                              child: Column(

                                children: [

                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Center(
                                      child: Container(
                                          width: size.width * .9,
                                          height: size.height*.24,
                                          decoration: BoxDecoration(
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(10)),
                                              color: Colors.grey[200],
                                              border: Border.all(color: Colors.grey,width: 2)),
                                          child: Column(
                                            children: [
                                              SizedBox(

                                                child: Row(
                                                  children: [
                                                    Text('الصنف:',style: titleTextStyleBold(size)),
                                                    SizedBox(
                                                        child: Text(recipy.itemNameRecipe!,style: titleTextStyleBold(size))),

                                                  ],
                                                ),
                                              ),
                                              Column(
                                                children: [
                                                  Text('الكميه',style: titleTextStyleBold(size)),
                                                  Padding(
                                                    padding: const EdgeInsets.fromLTRB(0, 0, 10, 0),
                                                    child: Container(
                                                      width: size.width * .4,
                                                      decoration: BoxDecoration(
                                                          borderRadius: BorderRadius.all(
                                                              Radius.circular(5)),
                                                          color: Colors.white,
                                                          border: Border.all(color: Colors.grey)),
                                                      child:  TextFormField(
                                                        // focusNode: quantityFocus,
                                                        textAlign: TextAlign.center,
                                                        decoration: const InputDecoration(
                                                            border: OutlineInputBorder(), contentPadding: EdgeInsets.zero),
                                                        controller: quantityedited,
                                                        onChanged: (value)  {
                                                          quantityedited.text=value;
                                                          recipy.qyantity = double.tryParse(quantityedited.text)??0;
                                                          recipy.qyantity = double.tryParse(value)??0;
                                                        },
                                                      ),

                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          )

                                      ),
                                    ),
                                  ),



                                ],
                              ),
                            ),
                          ),
                        ),
                        actions: [
                          Center(
                            child: Container(
                                height: size.height*.1,
                                width: size.width*.2,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.all(
                                      Radius.circular(6.00)),
                                  color: Colors.blueAccent,
                                ),
                                child: okButton),
                          ),
                        ],
                      );
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return alert;
                        },
                      );


                    },
                      child: Container(

                        height: size.height * .06,
                        width: size.width * .13,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(
                              Radius.circular(50.00)), color:Colors.green,
                        ),
                        child:
                        Row(mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Icon(Icons.edit,color: Colors.white ),
                          ],
                        ),

                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: (){
                      context.read<HomepageProvider>().removeProduct(recipy);
                      // cart.products.removeWhere((element) => element.itemIdRecipe == recipy.itemIdRecipe);
                      setState((){});
                    },
                    child: Container(

                      height: size.height * .06,
                      width: size.width * .13,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(
                            Radius.circular(50.00)), color:Colors.red,
                      ),
                      child:
                      Row(mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Icon(Icons.delete,color: Colors.white ),
                        ],
                      ),

                    ),
                  ),





                ],
              )


          ),
        ),
        Center(
          child: Container(
              width: size.width,
              height: size.height*.004,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(
                    Radius.circular(30)),
                color:appHallsRedDark,
              )
          ),
        ),

      ],
    );

  }

}
