import 'package:digigarson_demo/models/session.dart';
import 'package:digigarson_demo/services/auth_service.dart';
import 'package:digigarson_demo/views/home.dart';
import 'package:digigarson_demo/views/register_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'forgot_password_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  var txtEmail=TextEditingController();
  var txtPassword=TextEditingController();

  late Session session;
  AuthService apiManager=AuthService();
  final GlobalKey<ScaffoldState> key=GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: key,
      body: Material(
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
                ListView(
                  padding: EdgeInsets.only(top: 0.0,left: 30.0,right: 30.0),
                  children: <Widget>[
                    Container(
                      padding: EdgeInsets.only(top: 0.0,left: 40.0,right: 40.0),
                      height: (MediaQuery.of(context).size.height)/3,
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
                            hintText: "E-mail",
                            hintStyle: TextStyle(fontSize: 18.0, color: Colors.black),
                            prefixIcon: Icon(Icons.mail,
                              color: Colors.red,),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10)
                            )
                        ),
                        controller: txtEmail,
                      ),
                    ),
                    SizedBox(height: 5.0,),
                    Container(
                      height: 60.0,
                      width:340.0,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10)
                      ),
                      child:  TextField(
                        decoration: InputDecoration(
                            hintText: "Password",
                            hintStyle: TextStyle(fontSize: 18.0, color: Colors.black),
                            prefixIcon: Icon(Icons.password_rounded,
                              color: Colors.red,),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10)
                            )
                        ),
                        obscureText: true,
                        controller: txtPassword,
                      ),
                    ),
                    SizedBox(height: 10.0,),
                    Container(
                      alignment: Alignment.centerRight,
                      width: 340.0,
                      height: 20.0,
                      child: FlatButton(
                        onPressed: (){
                          Navigator.pop(context);
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>ForgotPasswordScreen()));
                        },
                        textColor: Colors.red[400],
                        child: Text('Forgot Password'),
                      ),
                    ),
                    SizedBox(height: 10.0,),
                    Container(
                      height: 55.0,
                      width:340.0,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10)
                      ),
                      child: MaterialButton(
                        onPressed: (){
                          control();
                        },
                        height: 55.0,
                        minWidth: double.infinity,
                        elevation: 25.0,
                        color: Theme.of(context).primaryColor,
                        textColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)
                        ),
                        child: Text(
                          "Login",
                          style:TextStyle(fontSize: 18.0,
                              fontWeight: FontWeight.bold) ,
                        ),
                      ),
                    ),
                    SizedBox(height: 20.0,),
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
                    SizedBox(height: 80.0,),
                    InkWell(
                      onTap: (){
                        Navigator.of(context).pop();
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>RegisterScreen()));
                      },
                      child: Container(
                        alignment: Alignment.center,
                        height: 40.0,
                        width:MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                          border: Border(
                            top: BorderSide( //                    <--- top side
                              color: Colors.white,
                              width: 0.5,
                            ),
                          ),
                        ),
                        child: Text(
                          "Don't have an account? Register",
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ],
                )
              ],
            )
          ],
        ),
      ),
    );
  }

  void control() async{
    session=await apiManager.loginUser(txtEmail.text.toString(), txtPassword.text.toString());
    if(session.accessToken=="Hata"){
      key.currentState!.showSnackBar(SnackBar(content: Text("${session.refreshToken.toString()}")));
    }else{
      Navigator.of(context).pop();
      //Navigator.push(context, MaterialPageRoute(builder: (context)=>Home(session)));
    }
  }
}
