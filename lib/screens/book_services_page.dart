import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';
import 'package:sgd_client_mobile/controllers/home_controller.dart';

class BookServicesPage extends StatelessWidget {
  const BookServicesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      init: HomeController(),
      builder: (_) => Text('${_.services[0].name}'),
    );
  }
}
