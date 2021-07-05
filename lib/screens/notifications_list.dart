import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sgd_client_mobile/controllers/home_controller.dart';
import 'package:sgd_client_mobile/models/service/service.dart';

class NotificationsList extends StatelessWidget {
  const NotificationsList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      init: HomeController(),
      builder: (_) => Scaffold(
        body: Container(
          padding: EdgeInsets.only(bottom: 40),
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
      ),
    );
  }
}
