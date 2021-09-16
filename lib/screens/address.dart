import 'package:digigarson_demo/screens/address/newaddress.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Adress extends StatefulWidget {
  const Adress({Key? key}) : super(key: key);

  @override
  State<Adress> createState() => _AdressState();
}

class _AdressState extends State<Adress> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Colors.red[400],
        ),
        backgroundColor: Colors.white,
        elevation: 0.0,
        title: Container(
          child: Text(
            "Adreslerim",
            style: TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
              color: Colors.grey,
            ),
          ),
        ),
        actions:<Widget>[
          MaterialButton(
            child: Row(
              children: [
                Icon(Icons.add, color: Colors.red[300],),
                SizedBox(width: 5.0,),
                Text("Adres ekle", style: TextStyle(color: Colors.red[300], fontWeight: FontWeight.bold, fontSize: 17.0))
              ],
            ),
              onPressed: (){Navigator.push(context, MaterialPageRoute(builder: (context)=>NewAddress()));})
        ],
      ),
      body: ListView(
      children: [
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: Container(
            height:180.0,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20.0),
              border: Border.all(
                style: BorderStyle.solid, width: 1.0, color: Colors.white,
              )
            ),
          ),
        ),
      ],)
    );
  }
}
