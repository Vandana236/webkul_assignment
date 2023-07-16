import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:grocery1/provider/cart_provider.dart';
import 'package:grocery1/provider/product_provider.dart';
import 'package:provider/provider.dart';

import 'UI/splash.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ProductProvider()),
        ChangeNotifierProvider(create: (_) => CartProvider()),
      ],
      child: MyApp(),
    ),
  );
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home:  SplashPage()
    );
  }
}
