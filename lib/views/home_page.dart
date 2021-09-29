//@dart=2.9
import 'package:digigarson_demo/models/session.dart';
import 'package:digigarson_demo/views/qr_scan.dart';
import 'package:digigarson_demo/views/qr_scan.dart';
import 'package:flappy_search_bar/flappy_search_bar.dart';
import 'package:flappy_search_bar/search_bar_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';

class HomePage extends StatefulWidget {
  //Session session;
  //HomePage(this.session);
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Container(
            child: Row(
              children: [
                Container(
                  height: 80.0,
                  width: 200.0,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: SearchBar(
                      loader: Text("loading..."),
                      iconActiveColor: Colors.red[400],
                      searchBarStyle: SearchBarStyle(
                        backgroundColor: Colors.white,
                        padding: EdgeInsets.only(left: 50.0),
                        borderRadius: BorderRadius.circular(50.0),
                      ),
                    ),
                  ),
                ),
                Container(
                  height: 80.0,
                  width: 50.0,
                  child: Padding(
                    padding: EdgeInsets.only(top: 0.0),
                    child: IconButton(
                      icon: Icon(Icons.qr_code),
                      onPressed: (){
                        Navigator.of(context).push(MaterialPageRoute(builder: (context)=> QrScan()));
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            child: ImageSlideshow(
              width: double.infinity,
              height: 200.0,
              indicatorColor: Colors.blue,
              indicatorBackgroundColor: Colors.grey,
              children: [
                Image.asset(
                  'assets/images/1.jpg',
                  fit: BoxFit.cover,
                ),
                Image.asset(
                  'assets/images/2.jpg',
                  fit: BoxFit.cover,
                ),
                Image.asset(
                  'assets/images/3.jpg',
                  fit: BoxFit.cover,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}




