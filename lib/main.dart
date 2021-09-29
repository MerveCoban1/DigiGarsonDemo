//@dart=2.9
import 'dart:io';

import 'package:digigarson_demo/views//splash.dart';
import 'package:digigarson_demo/views/forgot_password_screen.dart';
import 'package:digigarson_demo/views/home.dart';
import 'package:flutter/material.dart';

void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'DigiGarson',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: Home(),
    );
  }
}
