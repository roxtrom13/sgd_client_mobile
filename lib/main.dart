import 'package:flutter/material.dart';
import 'package:sgd_client_mobile/screens/splash_page.dart';
import 'package:get/get.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Seguidores De la Grasa',
      theme: ThemeData(
        primaryColor: Color(0xffb2dfdb),
        accentColor: Color(0xff4db6ac),
      ),
      home: SplashPage(),
    );
  }
}
