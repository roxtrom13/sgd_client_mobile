import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';
import 'package:sgd_client_mobile/controllers/splash_controller.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: SplashController(),
      builder: (_) => Scaffold(
        body: Center(
          child: Image.asset('assets/img/logo.png'),
        ),
      ),
    );
  }
}
