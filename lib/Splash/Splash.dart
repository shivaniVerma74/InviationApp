import 'dart:async';

import 'package:doctorapp/Helper/Color.dart';
import 'package:doctorapp/Screen/HomeScreen.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../AuthenticationView/LoginScreen.dart';
import '../Screen/Bottom.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  String? uid;
  String? type;
  bool? isSeen;
  @override
  void initState() {
    print("u id in splash screeen-----------$uid");
    // TODO: implement initState
    Future.delayed(const Duration(seconds: 3),() async {
      SharedPreferences prefs  = await SharedPreferences.getInstance();
      bool? isLogin  =  prefs.getBool('isLogin');
      print("is login trueee--------${isLogin}");
      if(isLogin ?? false) {
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> const BottomScreen()));
      } else {
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> LoginScreen()));
      }
    });
    // Timer(Duration(seconds: 3), () {Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> IntroSlider()));});
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        body: Container(
          height: MediaQuery.of(context).size.height,
          child: Center(
            child: Image.asset("assets/splash/splashimages.png", fit: BoxFit.cover)
          ),
        ),
      ),
    );
  }
}
