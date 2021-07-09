import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';
import 'package:sgd_client_mobile/controllers/alt_home_controller.dart';
import 'package:sgd_client_mobile/screens/services/canceled_tech_services.dart';
import 'package:sgd_client_mobile/screens/services/completed_tech_services.dart';
import 'package:sgd_client_mobile/screens/services/pending_tech_services.dart';


class AltHomePage extends StatelessWidget {
  const AltHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AltHomeController>(
      init: AltHomeController(),
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
              PendingTechServices(),
              CompletedTechServices(),
              CanceledTechServices(),
            ],
          ),
        ),
        drawer: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              DrawerHeader(
                decoration: BoxDecoration(
                  color: Theme.of(context).primaryColor,
                ),
                child: Text(
                  'Menú',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                  ),
                ),
              ),
              _.logoutLoading
                  ? Center(
                      child: Padding(
                          padding: EdgeInsets.only(top: 50),
                          child: CircularProgressIndicator()))
                  : Column(
                      children: [
                        ListTile(
                          leading: Icon(Icons.manage_accounts),
                          title: Text('Mi Cuenta'),
                        ),
                        ListTile(
                          leading: Icon(Icons.logout),
                          title: Text('Cerrar Sesión'),
                          onTap: _.logout,
                        ),
                      ],
                    ),
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

