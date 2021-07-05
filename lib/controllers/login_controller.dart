import 'package:get/state_manager.dart';
import 'package:sgd_client_mobile/api/auth.dart';
import 'package:sgd_client_mobile/models/auth/user.dart';
import 'package:sgd_client_mobile/screens/alt_home_page.dart';
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

  Future<void> onLogin() async {
    GlobalController _global = GlobalController();
    isLoading = true;
    update();

    LoggedUser? loggedUser =
        await Auth.instance.login(this._email, this._password);
    //LoggedUser? loggedUser =
        //await Auth.instance.login('cliente1@gmail.com', 'cliente1234');
    if (loggedUser != null) {
      isLoading = false;

      _global.setKeys(loggedUser.access, loggedUser.refresh);
      _global.setUser(loggedUser.user);

      int groupId = loggedUser.user.groups[0].id;
      Future.delayed(Duration(seconds: 1), () {
        if (groupId == 3) {
          Get.off(HomePage(), arguments: loggedUser);
        } else {
          Get.off(AltHomePage());
        }
      });
    } else {
      isLoading = false;
      update();
    }
  }
}
