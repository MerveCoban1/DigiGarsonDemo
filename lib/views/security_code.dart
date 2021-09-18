import 'package:digigarson_demo/views//home.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Security extends StatefulWidget {

  @override
  _SecurityState createState() => _SecurityState();
}

class _SecurityState extends State<Security> {
  var txtSecurityCode=TextEditingController();

  @override
  void initState() {

    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Stack(
        alignment: Alignment.topCenter,
        children: <Widget>[
      Container(
      color:Colors.white,
        width: double.infinity,
        height:double.infinity,
        child:
        Positioned(
            bottom: 0,
            right: 0,
            child: Image.asset("assets/images/img.png",
              fit: BoxFit.cover,)),
      ),
      
          Stack(
            alignment: Alignment.topCenter,
            children: <Widget>[
              Column(
                children:<Widget> [
                  Padding(
                    padding: const EdgeInsets.only(top:150.0,),
                    child: Container(
                      width: 240.0,
                      child: Positioned(

                        child: Image.asset("assets/images/logodigi.png"),),
                    ),
                  ),

                  SizedBox(height: 40.0,),
                  Container(
                    alignment: Alignment.center,
                    width: 350.0,
                    height: 300.0,
                    decoration: BoxDecoration(
                      color:Colors.white,
                    borderRadius: BorderRadius.circular(20),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 5,
                          blurRadius: 7,
                          offset: Offset(0, 3), // changes position of shadow
                        ),
                      ],
                    ),

                    child: Column(
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.only(top:40.0, right: 30.0, left: 30.0, bottom:10.0),
                          child: TextField(
                            decoration: InputDecoration(
                              hintText: "Güvenlik Kodu",
                              hintStyle: TextStyle(fontSize: 18.0, color: Colors.black),
                              prefixIcon: Icon(Icons.security,
                              color:Colors.red,),
                              border:OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10)
                              )
                            ),
                            controller: txtSecurityCode,
                          ),
                        ),
                           MaterialButton(onPressed: (){},
                           child: Text("Yeniden kod gönder.",
                           style: TextStyle(
                             fontSize: 16.0,

                           ),),),
                           MaterialButton(
                             onPressed: (){
                               control();
                             },
                             height: 60,
                             minWidth: 120,
                             elevation: 25.0,
                             color: Theme.of(context).primaryColor,
                             textColor: Colors.white,

                             shape: RoundedRectangleBorder(
                                 borderRadius: BorderRadius.circular(20)
                             ),
                             child: Text("Giriş",
                               style: TextStyle(
                                 fontSize: 18.0,
                                 fontWeight: FontWeight.bold,
                               ) ,),
                           )
                          ],

                    ),
                  )
                ],
              ),
            ],
          )
        ]
      ),
    );
  }

  void control() async{
    var result="1";
    if(result=="1"){
      Navigator.push(context, MaterialPageRoute(builder: (context)=>Home()));
    }else{
      //    ?? hata mesajı showsnackbar güvenlik kodları uyuşmuyor.
      print("hata ");
    }
  }
}
