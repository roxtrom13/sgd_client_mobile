import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sgd_client_mobile/controllers/home_controller.dart';
import 'package:sgd_client_mobile/models/service/service.dart';
import 'package:sgd_client_mobile/screens/photos_page.dart';

class ServicesPage extends StatelessWidget {
  const ServicesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      init: HomeController(),
      builder: (_) => Scaffold(
        body: Center(
          child: ListView.builder(
            itemBuilder: (__, index) {
              Service? service = _.services[index];
              return ListTile(
                leading: Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.purple, width: 3),
                    borderRadius: BorderRadius.all(
                      Radius.circular(10),
                    ),
                  ),
                  child: Icon(
                    Icons.bolt,
                    size: 50,
                    color: Colors.purple[900],
                  ),
                ),
                title: Text(
                  service.name,
                  style: TextStyle(fontSize: 35, color: Colors.purple[900]),
                ),
                subtitle: Text(
                  service.description,
                  style: TextStyle(fontSize: 15),
                ),
              );
            },
            itemCount: _.services.length,
          ),
        ),
        floatingActionButton: SizedBox(
            width: double.infinity,
          height: 30,
          child: FloatingActionButton.extended(
              label: Text(
                'Ver Fotos',
                style: TextStyle(color: Colors.white),
              ),
              backgroundColor: Colors.green[200],
              elevation: 0,
              onPressed: () {
                Get.to(PhotosPage());
              },
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(0))),
        ),
        floatingActionButtonLocation:
            FloatingActionButtonLocation.miniCenterDocked,
      ),
    );
  }
}
