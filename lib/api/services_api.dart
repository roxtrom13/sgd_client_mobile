import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:sgd_client_mobile/models/service/service.dart';
import 'package:sgd_client_mobile/models/technician/technician.dart';

class ServicesApi {
  ServicesApi._internal();
  static ServicesApi _instance = ServicesApi._internal();
  static ServicesApi get instance => _instance;

  final _dio = Dio(BaseOptions(baseUrl: 'http://10.0.2.2:8000/'));

  _showError(String msg) {
    return Get.dialog(
      AlertDialog(
        title: Text("Error"),
        content: Text(msg),
      ),
    );
  }

  Future<List<Service>?> loadServices(String auth) async {
    try {
      final response = await _dio.get(
        'v1/services/',
        options: Options(headers: {'Authorization': 'Bearer $auth'}),
      );
      return (response.data["results"] as List)
          .map((e) => Service.fromJson(e))
          .toList();
    } catch (e) {
      if (e is DioError) {
        _showError("Hubo un error obteniendo la lista de servicios");
        return [];
      }
    }
  }

  Future<List<Technician>?> loadTechnicians(String auth, int techID) async {
    try {
      final response = await _dio.get(
        'v1/users/technicians/',
        options: Options(headers: {'Authorization': 'Bearer $auth'}),
        queryParameters: {'service': techID},
      );
      List<Technician>? techs = (response.data["results"] as List)
          .map((e) => Technician.fromJson(e))
          .toList();
      return techs;
    } catch (e) {
      if (e is DioError) {
        _showError("Hubo un error obteniendo la lista de técnicos");
        return [];
      }
    }
  }

  Future<List> bookService(String auth, int serviceID, int technicianID,
      String date, String time, String location, String reference) async {
    try {
      final response = await _dio.post(
        'v1/scheduled_services/',
        data: {
          "service": serviceID,
          "technician": technicianID,
          "date": date,
          "time": time,
          "address": location,
          "latitude": null,
          "longitude": null,
          "reference": reference
        },
        options: Options(headers: {'Authorization': 'Bearer $auth'}),
      );
      print(response.statusCode);
      List res = [true, response.data];
      return res;
    } catch (e) {
      if (e is DioError) {
        print(e.response!.data["validation"][0]);
        return [false, e.response];
      }
      return [false, e];
    }
  }
}
