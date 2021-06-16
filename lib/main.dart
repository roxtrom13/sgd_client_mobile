import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sgd_client_mobile/controllers/global_controller.dart';

import 'package:sgd_client_mobile/screens/splash_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Get.put(GlobalController());
    return GetMaterialApp(
      title: 'Servicios Generales a Domicilio',
      theme: ThemeData(
        //primaryColor: Color(0xffb2dfdb),
        //accentColor: Color(0xff4db6ac),
        primaryColor: Color(0xff4db6ac),
        accentColor: Color(0xffb2dfdb),
        buttonColor: Colors.white,
        primaryColorLight: Color(0xffe5ffff),
        primaryColorDark: Color(0xff82ada9),
      ),
      home: SplashPage(),
    );
  }
}
