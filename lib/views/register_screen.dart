import 'package:digigarson_demo/models/session.dart';
import 'package:digigarson_demo/models/users.dart';
import 'package:digigarson_demo/services/auth_service.dart';
import 'package:digigarson_demo/views/login_screen.dart';
import 'package:flutter/material.dart';

import 'home.dart';

class RegisterScreen extends StatefulWidget {
  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController passwordController2 = TextEditingController();

  AuthService apiManager=AuthService();
  late Users user;
  late Session session;
  final GlobalKey<ScaffoldState> key=GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: key,
        body: Padding(
            padding: EdgeInsets.only(top: 80.0,left: 30.0,right: 30.0),
            child: ListView(
              children: <Widget>[
                Container(
                    alignment: Alignment.center,
                    padding: EdgeInsets.all(10),
                    child: Text(
                      'DigiGarson',
                      style: TextStyle(
                          color: Colors.red[400],
                          fontWeight: FontWeight.w500,
                          fontSize: 30),
                    )),
                SizedBox(height: 20.0,),
                Container(
                  child: TextField(
                    controller: nameController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Name',
                    ),
                  ),
                ),
                SizedBox(height: 5.0,),
                Container(
                  child: TextField(
                    controller: emailController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'E-mail',
                    ),
                  ),
                ),
                SizedBox(height: 5.0,),
                Container(
                  child: TextField(
                    obscureText: true,
                    controller: passwordController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Password',
                    ),
                  ),
                ),
                SizedBox(height: 8.0,),
                Container(
                  child: TextField(
                    obscureText: true,
                    controller: passwordController2,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Password',
                    ),
                  ),
                ),
                SizedBox(height: 20.0,),
                Container(
                    height: 50,
                    padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                    child: RaisedButton(
                      textColor: Colors.white,
                      color: Colors.red[400],
                      child: Text('Register'),
                      onPressed: () {
                        register();
                      },
                    )),
                SizedBox(height: 20.0,),
                Container(
                    child: Row(
                      children: <Widget>[
                        Text('Do you have an account?'),
                        FlatButton(
                          textColor: Colors.red[400],
                          child: Text(
                            'Login',
                            style: TextStyle(fontSize: 15),
                          ),
                          onPressed: () {
                            Navigator.push(context, MaterialPageRoute(builder: (context)=>LoginScreen()));
                          },
                        )
                      ],
                      mainAxisAlignment: MainAxisAlignment.center,
                    ))
              ],
            )));
  }

  void register() async{
    user=await apiManager.registerUser(nameController.text.toString(),emailController.text.toString(), passwordController.text.toString(), passwordController2.text.toString());
    if(user.name=="Hata"){
      key.currentState!.showSnackBar(SnackBar(content: Text("${user.email.toString()}")));
    }else{
      key.currentState!.showSnackBar(SnackBar(content: Text("Registration Successful")));
      session=await apiManager.loginUser(emailController.text.toString(), passwordController.text.toString());
      if(session.accessToken=="Hata"){
        key.currentState!.showSnackBar(SnackBar(content: Text("${session.refreshToken.toString()}")));
      }else{
        Navigator.of(context).pop();
        //Navigator.push(context, MaterialPageRoute(builder: (context)=>Home(session)));
      }
    }
  }
}