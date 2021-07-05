import 'package:get/state_manager.dart';
import 'package:get/route_manager.dart';
import 'package:sgd_client_mobile/api/services_api.dart';
import 'package:sgd_client_mobile/models/service/user_scheduled_service.dart';

class ServiceRatingController extends GetxController {
  int rating = 5;
  late int serviceID;
  String accessKey = '';
  late UserScheduledService service;
  String comment = '';
  bool isLoading = true;

  Map<int, String> stringRating = {
    1: 'Mal servicio',
    2: 'Regular servicio',
    3: 'Buen servicio',
    4: 'Muy buen servicio',
    5: 'Excelente servicio',
  };

  void onChangeRating(double value) {
    this.rating = value.toInt();
    print(this.rating);
    update();
  }

  void onSendCalifitation() async {
    await ServicesApi.instance.createCalification(
        this.accessKey, this.rating, this.comment, this.serviceID);
    Get.back();
  }

  void onTextChanged(text) {
    this.comment = text;
  }


  @override
  void onInit() async {
    super.onInit();
    print('Service ID: ${Get.arguments[0]}');
    this.serviceID = Get.arguments[0];
    this.accessKey = Get.arguments[1];
    this.service = await ServicesApi.instance.getScheduledService(
        this.accessKey, this.serviceID) as UserScheduledService;
    this.isLoading = false;
    update();
  }
}
