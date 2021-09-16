//@dart=2.9
import 'package:digigarson_demo/screens/login_screen.dart';
import 'package:digigarson_demo/screens/splash.dart';
import 'package:flutter/material.dart';

void main()=>runApp(MyApp());

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'DigiGarson',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: Splash(),
    );
  }
}
