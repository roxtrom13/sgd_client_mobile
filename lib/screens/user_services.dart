import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';
import 'package:sgd_client_mobile/controllers/user_services_controller.dart';
import 'package:sgd_client_mobile/screens/services/pending_services.dart';
import 'package:sgd_client_mobile/screens/services/completed_services.dart';
import 'package:sgd_client_mobile/screens/services/canceled_services.dart';


class UserServices extends StatelessWidget {
  const UserServices({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<UserServicesController>(
      init: UserServicesController(),
      builder: (_) => Scaffold(
        appBar: AppBar(
          iconTheme: IconThemeData(color: Colors.white),
          title: Text(
            'Servicios Agendados',
            style: TextStyle(color: Colors.white),
          ),
        ),
        body: SafeArea(
          child: IndexedStack(
            index: _.currentIndex,
            children: [
              PendingServices(),
              CompletedServices(),
              CanceledServices(),
            ],
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _.currentIndex,
          selectedItemColor: Colors.purple[900],
          type: BottomNavigationBarType.fixed,
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.pending_actions),
              label: 'Pendientes',
              backgroundColor: Theme.of(context).primaryColor,
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.task_alt),
              label: 'Completados',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.disabled_by_default),
              label: 'Cancelados',
            ),
          ],
          onTap: _.onTapButtonNavBar,
        ),
      ),
    );
  }
}

