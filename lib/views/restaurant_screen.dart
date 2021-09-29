//@dart=2.9
import 'package:flutter/material.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

class RestaurantScreen extends StatefulWidget {
  Barcode result;
  RestaurantScreen(this.result);
  @override
  _RestaurantScreenState createState() => _RestaurantScreenState();
}

class _RestaurantScreenState extends State<RestaurantScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Colors.red[400],
        ),
        backgroundColor: Colors.white,
        elevation: 0.0,
        title: Container(
          padding: EdgeInsets.only(left: 85.0),
          child: Text(
            "Restaurant",
            style: TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
              color: Colors.grey,
            ),
          ),
        ),
      ),
      body: Text("Restaurant Screen barkod: "+widget.result.toString()),
    );
  }
}




