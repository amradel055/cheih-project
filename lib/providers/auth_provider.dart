


import 'dart:convert';

import 'package:cheif_project/apiServices/auth_services.dart';
import 'package:cheif_project/const/strings.dart';
import 'package:cheif_project/models/user_model.dart';
import 'package:cheif_project/screens/login.dart';
import 'package:cheif_project/screens/mainPage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:local_auth/local_auth.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthProvider with ChangeNotifier {

  UserModel? userModel ;
  final LocalAuthentication auth = LocalAuthentication();

  Future signIn(userCode ,password, context) async{
    await AuthServices().signIn(userCode, password).then((value){
      if(value != null ){
        if(value['msg'] == null){

          userModel = UserModel.fromJson(value);
          saveUserData(userModel!);
          notifyListeners();
          // Helper().showSnackBar(context, "logged in successfully");
          Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => const  mainPage() ));
        }else {
          // Helper().showSnackBar(context, value['msg']);
        }
      }
    });
  }


  Future<void> authenticateWithBiometrics(BuildContext context) async {
    bool authenticated = false;
    try {
      authenticated = await auth.authenticate(
        localizedReason:
        'Scan your fingerprint (or face or whatever) to authenticate',
        // options: const AuthenticationOptions(
        //   stickyAuth: true,
        //   biometricOnly: true,
        // ),
      );
      if(authenticated == true){
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const mainPage()));
      }
    } on PlatformException catch (e) {
      print(e);
      return;
    }


  }






  Future saveUserData(UserModel user) async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString(loginDataKey, userToJson(user));
  }

  Future getUserData() async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if(prefs.getString(loginDataKey) != null){
      userModel = UserModel.fromJson(jsonDecode(prefs.getString(loginDataKey)!));
      notifyListeners();
    }else{
      userModel = null ;
      notifyListeners();
    }
  }

  Future logout(context)async{
    // SharedPreferences prefs = await SharedPreferences.getInstance();
    // prefs.remove(loginDataKey);
    Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => const  login() ));


  }
}