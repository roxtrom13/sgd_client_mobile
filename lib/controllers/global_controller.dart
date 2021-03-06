import 'package:get/state_manager.dart';
import 'package:sgd_client_mobile/models/auth/user.dart';
import 'package:sgd_client_mobile/models/service/service.dart';
import 'package:sgd_client_mobile/api/services_api.dart';
import 'package:sgd_client_mobile/models/technician/technician.dart';

class GlobalController extends GetxController {
  String _accessKey = '';
  String _refreshKey = '';
  List<Service>? _services = [];
  List<Technician>? _technicians = [];
  late User? _user;

  User? get user => _user;

  List<Service>? get services => _services;

  List<Technician>? get technicians => _technicians;

  String get accessKey => _accessKey;
  String get refreshKey => _refreshKey;

  void setAccess(String access) {
    this._accessKey = access;
  }

  void setKeys(String accesKey, String refreshKey) {
    this._accessKey = accesKey;
    this._refreshKey = refreshKey;
  }

  User setUser(User usr) {
    this._user = usr;
    return this._user as User;
  }

  Future<List<Service>> loadServices() async {
    this._services = await ServicesApi.instance.loadServices(this._accessKey);
    print('services ${this._services}');
    return this._services as List<Service>;
  }

  void logout() {
    this._refreshKey = '';
    this._accessKey = '';
    this._user = null;
    this._services = [];
  }

  @override
  void onInit() {
    super.onInit();
  }
}
