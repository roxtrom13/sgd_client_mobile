import 'package:get/state_manager.dart';
import 'package:sgd_client_mobile/models/service/service.dart';

class ServicesController extends GetxController {
  List<Service> _services = [];

  List<Service> get services => _services;
}
