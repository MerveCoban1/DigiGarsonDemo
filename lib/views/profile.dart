//@dart=2.9

import 'package:digigarson_demo/views/address.dart';
import 'package:flutter/material.dart';

class Profile extends StatelessWidget {

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
              "Profil",
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
                color: Colors.grey,
              ),
            ),
          ),
        ),
        body: ListView(
          children: [
            Column(
              children: <Widget>[
                Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(bottomLeft:Radius.circular(25), bottomRight: Radius.circular(25)),
                      gradient: LinearGradient(
                        begin:Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [Colors.redAccent,Colors.red[200]],
                      )
                  ),
                  child: Container(
                    width: double.infinity,
                    height: 300.0,
                    child: Center(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children:<Widget> [
                          CircleAvatar(
                            backgroundImage: AssetImage("assets/images/avatar.png"),
                            radius: 50.0,
                          ),
                          SizedBox(height: 10.0,),
                          Text(
                            "Nigar Ulucutsoy",
                            style: TextStyle(
                              fontSize: 22.0,
                              color: Colors.white,

                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 15.0,),
            Padding(
              padding: const EdgeInsets.only(right: 10.0, left: 10.0),
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: Colors.grey[200]
                ),
                child: ListTile(
                  title: Text("Adreslerim", style: TextStyle(
                    color:Colors.red,
                    fontWeight: FontWeight.normal,
                    fontSize:20.0,
                  ),),
                  leading: Icon(Icons.place_outlined, color: Colors.red,),
                  onTap: (){Navigator.push(context, MaterialPageRoute(builder: (context)=>Adress()));},
                ),
              ),
            ),
          ],
        )
    );
  }
}





