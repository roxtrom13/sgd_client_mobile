import 'package:get/state_manager.dart';
import 'package:get/route_manager.dart';
import 'package:sgd_client_mobile/models/service/user_scheduled_service.dart';

class ServiceDetailController extends GetxController {
  late UserScheduledService service;

  @override
  void onInit() {
    super.onInit();
    this.service = Get.arguments;
  }
}
