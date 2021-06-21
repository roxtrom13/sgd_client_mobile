import 'package:get/state_manager.dart';
import 'package:get/route_manager.dart';
import 'package:sgd_client_mobile/controllers/global_controller.dart';
import 'package:sgd_client_mobile/models/service/service.dart';
import 'package:sgd_client_mobile/screens/chat_page.dart';
import 'package:sgd_client_mobile/screens/login_page.dart';

class HomeController extends GetxController {
  int _currentIndex = 0;
  bool _logoutLoading = false;

  List<Service> _services = [];

  List<Service> get services => _services;

  List<String> _titleList = [
    'Nuestros Servicios',
    'Agendar Servicio Técnico',
    'Protocolos de Bioseguridad',
  ];

  get currentIndex => _currentIndex;
  get logoutLoading => _logoutLoading;
  get titleList => _titleList;

  void onTapButtonNavBar(int index) {
    this._currentIndex = index;
    update();
  }

  void routeToChat() {
    Get.to(ChatPage());
  }

  void logout() {
    this._logoutLoading = true;
    update();
    GlobalController _global = GlobalController();
    _global.logout();
    print('loged out user: ${_global.user}');
    Future.delayed(Duration(seconds: 1), () {
      Get.off(LoginPage());
    });
  }

  @override
  void onInit() async {
    super.onInit();
    GlobalController _g = GlobalController();
    _g.setAccess(Get.arguments);
    this._services = await _g.loadServices();
    update();
  }
}
