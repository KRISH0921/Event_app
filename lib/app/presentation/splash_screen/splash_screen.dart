import 'package:event_app/app/utils/utils_pref.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  bool isIntro = false;


  void iniState(){
    super.initState();
    getData();
  }

  Future<void> getData() async {
    UtilsPref prefUtil = UtilsPref();
    isIntro = await prefUtil.getIntro();
    
  }
  @override
  Widget build(BuildContext context) {
    Future.delayed(
       Duration(seconds: 3),
          () {
            Navigator.pushReplacementNamed(context, isIntro == true ? "home" : "intro" );
            },
    );
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Image.asset(
                "assets/images/Eventopia.png",
                height: 35.59,
                width: 197.63,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
