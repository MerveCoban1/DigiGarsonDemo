import 'package:digigarson_demo/models/customer_users.dart';
import 'package:digigarson_demo/views//security_code.dart';
import 'package:digigarson_demo/services/service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:math';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  var txtPhone=TextEditingController();
  var securityCode;
  late Future<CustomerUsers> _future;
  Service apiManager=Service();

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
            children: <Widget>[
              Column(
                children: <Widget>[
                  Container(
                    height: 300.0,
                    width: 250,
                    child: Positioned(
                      child: Image.asset("assets/images/logodigi.png"),),
                  ),
                  Container(
                    height: 60.0,
                    width:340.0,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10)
                    ),
                    child:  TextField(
                      decoration: InputDecoration(
                          hintText: "Phone Number",
                          hintStyle: TextStyle(fontSize: 18.0, color: Colors.black),
                          prefixIcon: Icon(Icons.phone,
                            color: Colors.red,),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10)
                          )
                      ),
                      controller: txtPhone,
                    ),
                  ),
                  SizedBox(height: 20.0,),
                  Padding(
                    padding: const EdgeInsets.only(right:45.0, left: 45.0, top:5.0, bottom:15.0),
                    child: MaterialButton(onPressed: (){
                      control();
                    },
                      height: 60,
                      minWidth: double.infinity,
                      elevation: 25.0,
                      color: Theme.of(context).primaryColor,
                      textColor: Colors.white,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)
                      ),
                      child: Text(
                        "Giriş Yap",
                        style:TextStyle(fontSize: 18.0,
                            fontWeight: FontWeight.bold) ,
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children:<Widget>[
                      Container(
                        height: 55.0,
                        width: 55.0,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child:
                        IconButton(onPressed:(){},
                          alignment: Alignment.center,
                          icon: Icon(Icons.facebook, color: Colors.white,),
                          iconSize: 40,
                        ),
                      ),

                      Container(
                        height: 55.0,
                        width: 55.0,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child:
                        IconButton(onPressed:(){},
                          alignment: Alignment.center,
                          icon: Icon(Icons.email, color: Colors.white,),
                          iconSize: 40,
                        ),
                      ),

                      Container(
                        height: 55.0,
                        width: 55.0,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child:
                        IconButton(onPressed:(){},
                          alignment: Alignment.center,
                          icon: Icon(Icons.qr_code, color: Colors.black,),
                          iconSize: 40,
                        ),
                      ),
                    ],
                  ),
                ],
              )
            ],
          )
        ],
      ),
    );
  }

  void control() async{
    //database telefon numarası kontrolü
    //var result=await databaseOperations.controlCustomerUsersPhone(txtPhone.text);

    var result="1";
    if(result=="1"){
      //Rastgele kod üretelim
      randomNumber();
      //şimdi de bu telefon numarasına ait satırın phone_confirm_code değerine bu kodu atalım
      //await databaseOperations.addSecurityCode(securityCode.toString(),txtPhone.text);
      //şimdi de telefona sms gönderelim


      //sayfa yönlendirmesi
      Navigator.push(context, MaterialPageRoute(builder: (context)=>Security()));
    }else{
      //    ?? hata mesajı showsnackbar
      print("hata ");
    }
  }

  void randomNumber() {
    var random = new Random();
    int minValue = 1000;
    int maxValue = 9999;
    int result = minValue + random.nextInt(maxValue - minValue);
    securityCode=result;
  }


}
