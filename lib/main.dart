import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'UI/course_data_list.dart';
import 'UI/data_Detail.dart';
import 'UI/courses_listing.dart';
import 'UI/login.dart';
import 'UI/signUp.dart';
import 'UI/splash.dart';
import 'UI/video_listing.dart';
import 'model/video_list.dart';
// import 'package:better_player/better_player.dart';


void main() {

  runApp(const MyApp());

}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Navigation with GetX',
      initialRoute: '/splash', // Set your initial route as needed.
      getPages: [
        GetPage(name: '/splash', page: () => SplashPage()),
        GetPage(name: '/login', page: () => LogIn()),
        GetPage(name: '/signup', page: () => SignUpScreen()),
        GetPage(name: '/home', page: () => HomePage()),
        GetPage(name: '/video', page: () => VideoListing()),
        GetPage(name: '/courseList', page: () => CourseDataList()),
        GetPage(name: '/detail', page: () => Detail()),
      ],
    );
    //   MaterialApp(
    //     debugShowCheckedModeBanner: false,
    //     title: 'Flutter Demo',
    //     theme: ThemeData(
    //       primarySwatch: Colors.blue,
    //     ),
    //     home:  SplashPage()
    // );
  }
}
