import 'package:get/state_manager.dart';
import 'package:get/route_manager.dart';
import 'package:sgd_client_mobile/controllers/global_controller.dart';
import 'package:sgd_client_mobile/screens/login_page.dart';

class HomeController extends GetxController {
  int _currentIndex = 0;
  bool _logoutLoading = false;

  get currentIndex => _currentIndex;
  get logoutLoading => _logoutLoading;

  void onTapButtonNavBar (int index) {
    this._currentIndex = index;
    update();
  }

  void logout() {
    this._logoutLoading = true;
    update();
    GlobalController().clearKeys();
    Future.delayed(Duration(seconds: 1), () {
      Get.off(LoginPage());
    });
  }
}
