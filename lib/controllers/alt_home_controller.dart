import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';
import 'package:get/route_manager.dart';
import 'package:sgd_client_mobile/api/services_api.dart';
import 'package:sgd_client_mobile/models/auth/user.dart';
import 'package:sgd_client_mobile/models/service/tech_scheduled_service.dart';
import 'package:sgd_client_mobile/screens/login_page.dart';
import 'package:sgd_client_mobile/screens/service_rating.dart';

class AltHomeController extends GetxController {
  static const PENDING = 'PE';
  static const COMPLETED = 'CO';
  static const CANCELED = 'CA';

  int _currentIndex = 0;
  String _accessKey = '';
  String _refreshKey = '';
  bool logoutLoading = false;
  late User _user;
  List<TechScheduledService> _pendingScheduledServices = [];
  List<TechScheduledService> _completedScheduledServices = [];
  List<TechScheduledService> _canceledScheduledServices = [];

  get currentIndex => _currentIndex;
  get accessKey => _accessKey;
  get refreshKey => _refreshKey;
  get user => _user;
  List<TechScheduledService> get pendingScheduledServices =>
      _pendingScheduledServices;
  List<TechScheduledService> get completedScheduledServices =>
      _completedScheduledServices;
  List<TechScheduledService> get canceledScheduledServices =>
      _canceledScheduledServices;

  void onTapButtonNavBar(int index) {
    this._currentIndex = index;
    update();
  }

  Widget? gradableValidator(TechScheduledService service) {
    return Container(
      height: 35,
      width: 70,
      color: Colors.purple[300],
      child: TextButton(
        onPressed: () {
          Get.to(ServiceRating(), arguments: [service.id, this.accessKey]);
        },
        child: Text(
          'Calificar',
          style: TextStyle(
            color: Colors.white,
            fontSize: 13,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }

  @override
  void onReady() {
    super.onReady();
    print('on ready');
  }

  void logout() {
    this.logoutLoading = true;
    update();
    this._accessKey = '';
    this._refreshKey = '';
    _pendingScheduledServices = [];
    _completedScheduledServices = [];
    _canceledScheduledServices = [];
    Future.delayed(Duration(seconds: 1), () {
      Get.off(LoginPage());
    });
  }

  @override
  void onInit() async {
    super.onInit();
    this._user = Get.arguments.user;
    this._accessKey = Get.arguments.access;
    this._refreshKey = Get.arguments.refresh;
    this._pendingScheduledServices =
        await ServicesApi.instance.loadTechScheduledServices(_accessKey, PENDING)
            as List<TechScheduledService>;
    this._completedScheduledServices =
        await ServicesApi.instance.loadTechScheduledServices(_accessKey, COMPLETED)
            as List<TechScheduledService>;
    this._canceledScheduledServices =
        await ServicesApi.instance.loadTechScheduledServices(_accessKey, CANCELED)
            as List<TechScheduledService>;
    print('Penging services in class: ${this._pendingScheduledServices}');
    print('Completed services in class: ${this._completedScheduledServices}');
    print('Canceled services in class: ${this._canceledScheduledServices}');
    update();
  }
}
