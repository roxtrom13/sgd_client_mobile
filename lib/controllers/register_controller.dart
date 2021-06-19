import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';
import 'package:sgd_client_mobile/api/auth.dart';
import 'package:get/route_manager.dart';
import 'package:sgd_client_mobile/screens/login_page.dart';

class RegisterController extends GetxController {
  GlobalKey<FormState> _regKey = GlobalKey();
  GlobalKey<FormState> get regKey => _regKey;

  String gender = '';
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

  String? validateFirst(String name) {
    this.firstName = name;
    RegExp exp = new RegExp(r"[^a-z ]", caseSensitive: false);
    bool valid = exp.allMatches(name).length == 0;
    print('firstName valid: $valid');
    if (name.trim().length < 1) {
      return ("Este campo es obligatorio");
    } else if (!valid) {
      return ('Solo se permiten letras');
    }
    return null;
  }

  String? validateLast(String name) {
    this.lastName = name;
    RegExp exp = new RegExp(r"[^a-z ]", caseSensitive: false);
    bool valid = exp.allMatches(name).isEmpty;
    print('lastName valid: $valid');
    if (name.trim().length < 1) {
      return ("Este campo es obligatorio");
    } else if (!valid) {
      return ('Solo se permiten letras');
    }
    return null;
  }

  String? validateEmail(String email) {
    this.email = email;
    if (email.trim().length < 1) {
      return ("Este campo es obligatorio");
    } else if (!email.contains('@')) {
      return ("Ingrese un email válido");
    } else if (email.trim().length > 50) {
      return ("No se debe exeder más de 50 caracteres");
    }
    return null;
  }

  String? validatePhone(String phone) {
    this.phone = phone;
    RegExp exp = new RegExp(r"[^0-9 ]", caseSensitive: false);
    bool valid = exp.allMatches(phone).isEmpty;
    if (!valid) {
      return ('Solo se permiten números');
    }
    return null;
  }

  String? validatePassword(String pass) {
    this.password = pass;
    if (pass.trim().length < 1) {
      return ('Este campo es obligatorio');
    }
    return null;
  }

  void onRegister() async {
    print('$gender');
    print('$firstName');
    print('$lastName');
    print('$phone');
    print('$email');
    print('$password');
    update();

    bool isOk = _regKey.currentState!.validate();
    if (isOk) {
      isLoading = true;
      update();

      bool ok = await Auth.instance.register(this.firstName, this.lastName,
          this.gender, this.phone, this.email, this.password) as bool;

      if (ok) {
        Get.off(LoginPage(), transition: Transition.leftToRight);
      }
    }
  }
}
