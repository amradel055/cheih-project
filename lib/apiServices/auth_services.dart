
import 'dart:convert';


import 'package:cheif_project/const/strings.dart';
import 'package:http/http.dart' as http;



class AuthServices {



  Future signIn(userCode,password) async{

    Uri uri = Uri.parse(url + "auth/loginUser") ;
    var body = jsonEncode({
      "userCode" : userCode,
      "password" : password
    });

    Map<String,String> headers = {
      "Content-Type": "application/json",
      "Charset": "utf-8",
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