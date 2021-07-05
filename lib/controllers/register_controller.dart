import 'package:get/state_manager.dart';
import 'package:sgd_client_mobile/api/auth.dart';
import 'package:get/route_manager.dart';
import 'package:sgd_client_mobile/screens/login_page.dart';
import 'package:flutter/material.dart';

class RegisterController extends GetxController {
  String gender = 'F';
  String firstName = '';
  String lastName = '';
  String phone = '';
  String email = '';
  String password = '';

  bool isLoading = false;

  void onChangeGender(String gender) {
    this.gender = gender;
    update();
  }

  @override
  void onReady() {
    super.onReady();
    update();
  }

  void onRegister() async {
    isLoading = true;
    print('${this.gender}');
    print('${this.firstName}');
    print('${this.lastName}');
    print('${this.phone}');
    print('${this.email}');
    print('${this.password}');

    bool emailValid = RegExp(
            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(this.email);

    bool ok = await Auth.instance.register(this.firstName, this.lastName,
        this.gender, this.phone, this.email, this.password) as bool;

    if (ok && emailValid) {
      Get.snackbar(
        '¡Usuario registrado!',
        'Ya puedes iniciar sesión',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.lightGreen[200],
      );
      isLoading = false;
      Future.delayed(Duration(seconds: 2), () {
        Get.off(LoginPage(), transition: Transition.leftToRight);
      });
    }
  }
}
