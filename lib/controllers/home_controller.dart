import 'package:get/state_manager.dart';
import 'package:get/route_manager.dart';
import 'package:sgd_client_mobile/api/services_api.dart';
import 'package:sgd_client_mobile/models/auth/user.dart';
import 'package:sgd_client_mobile/models/service/service.dart';
import 'package:sgd_client_mobile/models/technician/technician.dart';
import 'package:sgd_client_mobile/screens/chat_page.dart';
import 'package:sgd_client_mobile/screens/login_page.dart';
import 'package:flutter/material.dart';

class HomeController extends GetxController {
  String _accessKey = '';
  String _refreshKey = '';
  int _currentIndex = 0;
  bool _logoutLoading = false;
  int? _serviceValue;
  int? _technicianValue;
  late User _user;
  List<Service> _services = [];
  List<Technician> _technicians = [];
  bool loading = false;
  List<dynamic> days = [];
  String daySelected = '';
  bool shareLocation = false;
  DateTime? date;
  TimeOfDay? time;
  String reference = '';

  List<Service> get services => _services;
  List<Technician> get technicians => _technicians;
  String get accessKey => this._accessKey;
  String get refreshKey => this._refreshKey;

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

  void switchShareLocation(bool value) {
    this.shareLocation = value;
    update();
  }

  String formatDate(DateTime? date) {
    String text = date.toString();
    int idx = text.indexOf(' ');
    String res = text.substring(0, idx);
    return res;
  }

  String formatTime(TimeOfDay? time) {
    String text = time.toString();
    int idx1 = text.indexOf('(') + 1;
    int idx2 = text.indexOf(')');
    String res = text.substring(idx1, idx2);
    return res;
  }

  // TODO: Fix techinician select on services changes
  void onSelectService(int newValue) async {
    print('technicianValue: ${this._technicianValue}');
    loading = true;
    this._technicianValue = null;
    this._serviceValue = newValue;
    this._technicians = [];
    this._technicians = await ServicesApi.instance
        .loadTechnicians(this._accessKey, newValue) as List<Technician>;
    loading = false;
    update();
    print('onSelectService passed value: ${this._serviceValue}');
  }

  void onSelectTechnician(int? newValue) async {
    this._technicianValue = newValue;
    update();
    print('onSelectTechnician passed value: ${this._technicianValue}');
  }

  void logout() {
    this._logoutLoading = true;
    update();
    this._accessKey = '';
    this._refreshKey = '';
    Future.delayed(Duration(seconds: 1), () {
      Get.off(LoginPage());
    });
  }

  Future pickDate(BuildContext context) async {
    final initialDate = DateTime.now();
    final newDate = await showDatePicker(
      context: context,
      initialDate: date ?? initialDate,
      firstDate: DateTime(DateTime.now().month),
      lastDate: DateTime(DateTime.now().year + 5),
    );
    if (newDate == null) return;
    this.date = newDate;
    print(formatDate(this.date));
    update();
  }

  Future pickTime(BuildContext context) async {
    final initialTime = TimeOfDay(hour: 12, minute: 0);
    final newTime = await showTimePicker(
      context: context,
      initialTime: time ?? initialTime,
    );

    if (newTime == null) return;
    this.time = newTime;
    print(formatTime(this.time));
    update();
  }

  void onChangedReference(String ref) {
    this.reference = ref;
  }

  void bookService() async {
    List res = await ServicesApi.instance.bookService(
      this._accessKey,
      this._serviceValue as int,
      this._technicianValue as int,
      formatDate(this.date),
      formatTime(this.time),
      '',
      this.reference,
    );
    update();
    if (res[0]) {
      Get.snackbar(
          '¡RESERVA EXITOSA!', 'La reserva del servicio fue satisfactoria!', snackPosition: SnackPosition.BOTTOM);
    } else {
      Get.dialog(
        AlertDialog(
          title: Text("Error"),
          content: Text(res[1]!.data["validation"][0]),
        ),
      );
    }
  }

  @override
  void onInit() async {
    super.onInit();
    this._accessKey = Get.arguments.access;
    this._refreshKey = Get.arguments.refresh;
    this._services = await ServicesApi.instance.loadServices(this._accessKey)
        as List<Service>;
    this._user = Get.arguments.user;
    print('user in home_controller:  ${this._user.firstName}');
    update();
  }
}
