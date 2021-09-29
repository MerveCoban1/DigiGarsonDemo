import 'package:digigarson_demo/mail/send_mail.dart';
import 'package:digigarson_demo/views/login_screen.dart';
import 'package:flutter/material.dart';

class ForgotPasswordScreen extends StatefulWidget {
  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  TextEditingController emailController = TextEditingController();
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                    controller: emailController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'E-mail',
                    ),
                  ),
                ),
                SizedBox(height: 20.0,),
                Container(
                    height: 50,
                    padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                    child: RaisedButton(
                      textColor: Colors.white,
                      color: Colors.red[400],
                      child: Text('Send Mail'),
                      onPressed: () {
                        var sendMail=new SendMail();
                        sendMail.main();
                      },
                    )),
                SizedBox(height: 10.0,),
                Container(
                  alignment: Alignment.centerRight,
                  child: FlatButton(
                    textColor: Colors.red[400],
                      child: Text(
                        'Sign in',
                         style: TextStyle(fontSize: 16),
                      ),
                      onPressed: () {
                        Navigator.pop(context);
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>LoginScreen()));
                      },
                  ),
                ),
              ],
            )));
  }
}