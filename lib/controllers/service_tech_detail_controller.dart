import 'package:get/state_manager.dart';
import 'package:get/route_manager.dart';
import 'package:sgd_client_mobile/models/service/tech_scheduled_service.dart';

class ServiceTechDetailController extends GetxController {
  late TechScheduledService service;

  @override
  void onInit() {
    super.onInit();
    this.service = Get.arguments;
  }
}
