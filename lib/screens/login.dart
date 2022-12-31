import 'package:cheif_project/const/colors.dart';
import 'package:cheif_project/const/text_styles.dart';
import 'package:cheif_project/providers/auth_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/src/provider.dart';

import 'mainPage.dart';



class login extends StatefulWidget {
  const login({Key? key}) : super(key: key);

  @override
  _loginState createState() => _loginState();
}

class _loginState extends State<login> {

  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    Size size =MediaQuery.of(context).size;
    return Scaffold(

        body: Stack(

          children: [
            Container(
              color: appcolor,
              width: double.infinity,
              height: double.infinity,
            ),
            Padding(
              padding:  EdgeInsets.fromLTRB(size.width*.4, size.height*.17, 0, 0),
              child: Container(
                  decoration: BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(40.00))

                  ),
                  child: IconButton(onPressed: (){}, icon:Icon(Icons.arrow_back_ios,color:Colors.white ,size: size.height*.12,) )),
            ),
            Padding(
              padding:  EdgeInsets.fromLTRB(size.width*.25, size.height*.3, 0, 0),
              child: Text("WELCOME",style: titleTextStyle(size,color:Colors.white),),
            ),

            Padding(
              padding:  EdgeInsets.fromLTRB(size.width*.05, size.height*.4, size.width*.05, 0),
              child: Container(


                height:size.height*.45 ,
                width: size.width*.9,
                decoration: BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(20.00)),

                  color: Colors.white,
                ),
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Center(
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [

                          Container(
                            decoration: BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(20.00)),
                            ),
                            child: TextFormField(
                              controller: emailController,
                              keyboardType: TextInputType.emailAddress,
                              decoration:

                              const InputDecoration(
                                labelText: 'User Name',
                                prefixIcon: const Icon(
                                  Icons.phone,
                                ),
                                border: OutlineInputBorder(),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: size.height*.05,
                          ),
                          Container(
                            decoration: BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(20.00)),

                            ),
                            child: TextFormField(
                              controller: passwordController,
                              keyboardType: TextInputType.visiblePassword,
                              obscureText: true,
                              decoration: const InputDecoration(
                                labelText: 'Password',
                                prefixIcon: Icon(
                                  Icons.lock,
                                ),
                                suffixIcon: Icon(
                                  Icons.remove_red_eye,
                                ),
                                border: OutlineInputBorder(),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: size.height*.05,
                          ),
                          Container(
                            width: double.infinity,
                            decoration: BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(20.00)),

                              color: appcolor,
                            ),
                            child: MaterialButton(
                              onPressed: () {
                                context.read<AuthProvider>().signIn(emailController.text, passwordController.text, context);
                              },
                              child: const Text(
                                'LOGIN',
                                style: const TextStyle(
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                          // Padding(
                          //   padding:  EdgeInsets.fromLTRB(size.width*.15, 5, 0, 0),
                          //   child: Row(
                          //       children:[
                          //         Text("Do You Have Account?"),
                          //         GestureDetector(
                          //             onTap: (){
                          //             },
                          //             child: Text(" SIGNUP..",style: subTitleTextStyle(size,color: Colors.blue),))
                          //       ]
                          //
                          //
                          //   ),
                          // )


                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),


          ],
        )
    );
  }
}
