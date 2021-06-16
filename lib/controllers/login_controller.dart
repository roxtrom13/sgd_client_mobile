import 'package:get/state_manager.dart';
import 'package:sgd_client_mobile/api/auth.dart';
import 'package:sgd_client_mobile/models/auth/user.dart';
import 'package:sgd_client_mobile/screens/home_page.dart';
import 'package:get/route_manager.dart';
import 'package:sgd_client_mobile/controllers/global_controller.dart';

class LoginController extends GetxController {
  String _email = '';
  String _password = '';

  bool isLoading = false;

  void onChangeEmail(String email) {
    this._email = email;
  }

  void onChangePass(String password) {
    this._password = password;
  }

  onLogin() async {
    isLoading = true;
    update();

    LoggedUser? loggedUser =
        await Auth.instance.login(this._email, this._password);
    if (loggedUser != null) {
      isLoading = false;
      GlobalController().setKeys(loggedUser.access, loggedUser.refresh);
      Future.delayed(Duration(seconds: 1), () {
        Get.off(HomePage());
      });
    } else {
      isLoading = false;
      update();
    }
  }
}
