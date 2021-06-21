import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:sgd_client_mobile/models/service/service.dart';

class ServicesApi {
  ServicesApi._internal();
  static ServicesApi _instance = ServicesApi._internal();
  static ServicesApi get instance => _instance;

  final _dio = Dio(BaseOptions(baseUrl: 'http://10.0.2.2:8000/'));

  _showError() {
    return Get.dialog(
      AlertDialog(
        title: Text("Error"),
        content: Text("Verifique sus credenciales y vuélvalo a intentar"),
      ),
    );
  }

  Future<List<Service>?> loadServices(String auth) async {
    try {
      final response = await _dio.get(
        'v1/services/',
        options: Options(headers: {'Authorization': 'Bearer $auth'}),
      );
      return (response.data["results"] as List).map((e) => Service.fromJson(e)).toList();
    } catch (e) {
      if (e is DioError) {
        _showError();
        return [];
      }
    }
  }
}
