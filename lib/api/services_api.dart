import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:sgd_client_mobile/models/service/service.dart';
import 'package:sgd_client_mobile/models/service/user_scheduled_service.dart';
import 'package:sgd_client_mobile/models/technician/technician.dart';

class ServicesApi {
  ServicesApi._internal();
  static ServicesApi _instance = ServicesApi._internal();
  static ServicesApi get instance => _instance;

  final _dio = Dio(BaseOptions(baseUrl: 'http://45.79.48.145:8000/'));

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
      print(response);
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

  Future<UserScheduledService?> getScheduledService(String auth, int id) async {
    try {
      final response = await _dio.get(
        'v1/scheduled_services/$id/',
        options: Options(headers: {'Authorization': 'Bearer $auth'}),
      );
      UserScheduledService service =
          UserScheduledService.fromJson(response.data);
      return service;
    } catch (e) {
      if (e is DioError) {
        _showError("Hubo un error obteniendo la lista de servicios");
        return null;
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

  Future<List<UserScheduledService>?> loadScheduledServices(
      String auth, String query) async {
    try {
      final response = await _dio.get(
        'v1/scheduled_services/',
        options: Options(headers: {'Authorization': 'Bearer $auth'}),
        queryParameters: {'status': query, 'paginated': false},
      );
      print(response);
      List<UserScheduledService> res = (response.data as List)
          .map((e) => UserScheduledService.fromJson(e))
          .toList();
      print('response: $res');
      return res;
    } catch (e) {
      if (e is DioError) {
        _showError("Hubo un error obteniendo la lista de servicios");
        return [];
      }
    }
  }

  Future<void> createCalification(
      String auth, int score, String comment, int scheduledService) async {
    try {
      final response = await _dio.post(
        'v1/califications/',
        options: Options(headers: {'Authorization': 'Bearer $auth'}),
        data: {
          "score": score,
          "comment": comment,
          "scheduled_service": scheduledService
        },
      );
      print(response);
    } catch (e) {
      if (e is DioError) {
        if (e.response!.statusCode == 200) {
          _showError(e.response!.data["comment"]);
        }
        _showError("Hubo un error obteniendo la lista de servicios");
        return;
      }
    }
  }
}
