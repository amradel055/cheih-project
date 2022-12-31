import 'package:cheif_project/providers/auth_provider.dart';
import 'package:cheif_project/providers/homepage_provider.dart';
import 'package:cheif_project/screens/login.dart';
import 'package:cheif_project/screens/mainPage.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'screens/login.dart';
import 'screens/mainPage.dart';

void main() {
  runApp(
      MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) => HomepageProvider()),
          ChangeNotifierProvider(create: (_) => AuthProvider()),

        ] ,
        child:  const MyApp(),
      )

  );}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const login(),
    );
  }
}

