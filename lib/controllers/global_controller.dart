import 'package:get/state_manager.dart';

class GlobalController extends GetxController {
  String _accessKey = '';
  String _refreshKey = '';

  String get accessKey => _accessKey;
  String get refreshKey => _refreshKey;

  void setKeys(String acces, refresh) {
    this._accessKey = acces;
    this._refreshKey = refresh;
  }

  void clearKeys() {
    this._refreshKey = '';
    this._accessKey = '';
  }


  @override
    void onInit() {
      super.onInit();
    }
}