import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';
import 'package:sgd_client_mobile/api/auth.dart';
import 'package:sgd_client_mobile/models/auth/user.dart';
import 'package:sgd_client_mobile/screens/home_page.dart';
import 'package:get/route_manager.dart';
import 'package:sgd_client_mobile/controllers/global_controller.dart';

class LoginController extends GetxController {
  GlobalKey<FormState> _formKey = GlobalKey();

  GlobalKey<FormState> get formKey => _formKey;

  String _email = '';
  String _password = '';

  bool isLoading = false;

  String? validateEmail(String email) {
    _email = email;
    if (email.trim().length < 1) {
      return ("Este campo es obligatorio");
    } else if (email.trim().length > 50) {
      return ("No se debe exeder más de 50 caracteres");
    }
    return null;
  }

  String? validatePassword(String password) {
    this._password = password;
    if (password.trim().length < 1) {
      return ("Este campo es obligatorio");
    } else if (password.trim().length < 5) {
      return ('La contraseña debe tener más de 5 caracteres');
    } else if (password.trim().length > 30) {
      return ('La contraseña no debe tener más de 30 caracteres');
    }
    return null;
  }

  onLogin() async {
    bool isOk = _formKey.currentState!.validate();
    if (isOk) {
      isLoading = true;
      update();

      LoggedUser? loggedUser =
          await Auth.instance.login(this._email, this._password);
      if (loggedUser != null) {
        isLoading = false;
        GlobalController().setKeys(loggedUser.access, loggedUser.refresh);
        Future.delayed(Duration(seconds: 1), () {
          Get.off(HomePage());
        });
      } else {
        isLoading = false;
        update();
      }
    }
  }
}
