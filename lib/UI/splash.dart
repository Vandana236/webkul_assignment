import 'package:flutter/material.dart';
import 'package:get/get.dart';
// import 'package:flutter/services.dart';
//
// import 'home.dart';
import 'login.dart';

class SplashPage extends StatefulWidget {
  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {

  @override
  void initState() {

    super.initState();
    _navigateToHome();
  }

  void _navigateToHome() async {
    await Future.delayed(Duration(seconds: 10));
    Get.toNamed('/login'
    // Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => LogIn()),
    );

  }

  @override
  Widget build(BuildContext context) {
    // SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    //   statusBarColor: Colors.transparent,
    // ));
    return Scaffold(
      body: Container(
        color: Colors.white,
        child: Center(
          child: Image.asset('assets/images/images.png'),
        ),
      ),
    );
  }
}


