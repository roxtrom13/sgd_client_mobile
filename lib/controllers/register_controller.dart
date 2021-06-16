import 'package:get/state_manager.dart';
import 'package:sgd_client_mobile/api/auth.dart';
import 'package:get/route_manager.dart';
import 'package:sgd_client_mobile/screens/login_page.dart';

class RegisterController extends GetxController {
  String gender = '';
  String firstName = '';
  String lastName = '';
  String phone = '';
  String email = '';
  String password = '';

  bool isLoading = false;

  void onChangeGender(String gender) {
    this.gender = gender;
    update();
  }

  void onRegister() async {
    isLoading = true;
    print('${this.gender}');
    print('${this.firstName}');
    print('${this.lastName}');
    print('${this.phone}');
    print('${this.email}');
    print('${this.password}');

    bool ok = await Auth.instance.register(this.firstName, this.lastName, this.gender, this.phone, this.email, this.password) as bool;

    if(ok) {
      isLoading = false;
      Get.off(LoginPage(), transition: Transition.leftToRight);
    }
  }
}
