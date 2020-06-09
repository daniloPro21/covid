
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:covid/utils/TextStyles.dart';
import 'package:covid/utils/consts.dart';

import 'BoardingView/OnBoardingScreen.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {



  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.blue,
        body:Center(
          child: Column(

            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Icon(Icons.verified_user,color: kwhite,size: 80,),
              SizedBox(height: 50),
              BoldText("Stay Safe",40.0,Colors.white),

              /*TypewriterAnimatedTextKit(
                text: ["Safety first"],
                textStyle: TextStyle(fontSize: 30.0,color: kwhite,fontFamily: "nunito"),

                speed: Duration(milliseconds: 150),
              )*/


            ],
          ),
        )

    );
  }

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 5),(){
      Navigator.push(context, MaterialPageRoute(builder: (_) {
        return LandingPage();
      }));
    });
  }
}
