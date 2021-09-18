//@dart=2.9

import 'package:flutter/material.dart';


class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {

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
                "Profile",
                style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey,
                ),
              ),
            ),
          ),
      body: Text("profil sayfası"),
    );
  }
}




