import 'package:get/state_manager.dart';
import 'package:sgd_client_mobile/screens/login_page.dart';
import 'package:get/route_manager.dart';

class SplashController extends GetxController {
  @override
  void onReady() {
    super.onReady();
    Future.delayed(
      Duration(seconds: 2),
      () {
        Get.off(
          LoginPage(),
          transition: Transition.fade,
        );
      },
    );
  }
}
