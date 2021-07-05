import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';
import 'package:sgd_client_mobile/controllers/home_controller.dart';
import 'package:sgd_client_mobile/screens/book_services_page.dart';
import 'package:sgd_client_mobile/screens/covid_page.dart';
import 'package:sgd_client_mobile/screens/services_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      init: HomeController(),
      builder: (_) => Scaffold(
        appBar: AppBar(
          iconTheme: IconThemeData(color: Colors.white),
          title: Text(
            _.titleList[_.currentIndex],
            style: TextStyle(color: Colors.white),
          ),
        ),
        body: SafeArea(
          child: IndexedStack(
            index: _.currentIndex,
            children: [
              ServicesPage(),
              BookServicesPage(),
              CovidPage(),
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
                          leading: Icon(Icons.today),
                          title: Text('Mis Servicios'),
                          onTap: () {
                            Navigator.of(context).pop();
                            _.myServices();
                          },
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
              icon: Icon(Icons.home_repair_service),
              label: 'Servicios',
              backgroundColor: Theme.of(context).primaryColor,
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.event),
              label: 'Agendar Servicio',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.sanitizer),
              label: 'Protocolos',
            ),
          ],
          onTap: _.onTapButtonNavBar,
        ),
        floatingActionButton: FloatingActionButton(
          heroTag: 'chat',
          onPressed: _.routeToChat,
          child: Icon(
            Icons.forum_outlined,
            color: Colors.purple[900],
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      ),
    );
  }
}
