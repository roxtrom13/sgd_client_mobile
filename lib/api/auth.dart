import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:sgd_client_mobile/models/auth/user.dart';

class Auth {
  Auth._internal();
  static Auth _instance = Auth._internal();
  static Auth get instance => _instance;

  final _dio = Dio(BaseOptions(baseUrl: 'http://10.0.2.2:8000/'));

  _showError() {
    return Get.dialog(
      AlertDialog(
        title: Text("Error"),
        content: Text("Verifique sus credenciales y vuélvalo a intentar"),
      ),
    );
  }

  Future<LoggedUser?> login(String email, String password) async {
    try {
      final response = await _dio.post('v1/auth/login/', data: {
        "username": email,
        "password": password,
      });
      LoggedUser logged = LoggedUser.fromJson(response.data);
      print(logged.user.groups[0].name);
      return logged;
    } catch (e) {
      if (e is DioError) {
        _showError();
      }
      return null;
    }
  }

  Future<bool?> register(
      String firstName, lastName, gender, phone, email, password) async {
    try {
      await _dio.post('v1/users/client/', data: {
        "first_name": firstName,
        "last_name": lastName,
        "gender": gender,
        "phone": phone,
        "email": email,
        "password": password
      });
      return true;
    } catch (e) {
      if (e is DioError) {
        _showError();
        return false;
      }
    }
  }
}
