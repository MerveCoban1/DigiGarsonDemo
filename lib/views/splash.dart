import 'package:digigarson_demo/views/login_screen.dart';
import 'package:flutter/material.dart';

class Splash extends StatefulWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  State<Splash> createState() => _SplashState();
}
class _SplashState extends State<Splash> {
  @override
  Widget build(BuildContext context) {
    return
      Material(
        child: Stack(
          alignment: Alignment.center,
          children: [
            InkWell(
              onTap: (){Navigator.push(context, MaterialPageRoute(builder: (context)=>LoginScreen()));},
              child: Container(
                  color:Colors.white,
                  width: double.infinity,
                  height:double.infinity,
                  child:
                  Positioned(
                      bottom: 0,
                      right: 0,
                      child: Image.asset("assets/images/arkaplan1.jpg",
                        fit: BoxFit.cover,)),

              ),
            ),
            Stack(
              alignment: Alignment.center,
              children: [
                Container(
                    alignment: Alignment.center,
                    width: 230.0,
                    height: 230.0,
                    child:
                    Positioned(
                      child: Image.asset("assets/images/img_1.png",
                      ),
                    )
                ),
              ],
            ),
          ],
        ),
      );

  }
}
