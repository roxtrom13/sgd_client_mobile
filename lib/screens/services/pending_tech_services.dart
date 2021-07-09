import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';
import 'package:get/route_manager.dart';
import 'package:sgd_client_mobile/controllers/alt_home_controller.dart';
import 'package:sgd_client_mobile/models/service/tech_scheduled_service.dart';
import 'package:sgd_client_mobile/screens/service_tech_detail.dart';

class PendingTechServices extends StatelessWidget {
  const PendingTechServices({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AltHomeController>(
      builder: (_) => Scaffold(
        body: Container(
          padding: EdgeInsets.only(bottom: 40),
          child: ListView.builder(
            itemBuilder: (__, index) {
              TechScheduledService? service = _.pendingScheduledServices[index];
              return ListTile(
                leading: CircleAvatar(
                  backgroundImage: NetworkImage(service.client.photo),
                ),
                title: Container(
                  padding: EdgeInsets.only(left: 30),
                  child: GestureDetector(
                    onTap: () {
                      Get.to(ServiceTechDetail(), arguments: service);
                    },
                    child: Text(
                      service.service.name,
                      style: TextStyle(
                        fontSize: 25,
                        color: Colors.orange[600],
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
                subtitle: Container(
                  padding: EdgeInsets.only(left: 30),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                          'Profesional: ${service.client.firstName} ${service.client.lastName}'),
                      Text('Contacto: ${service.client.phone}'),
                      Text('Fecha: ${service.date}'),
                    ],
                  ),
                ),
              );
            },
            itemCount: _.pendingScheduledServices.length,
          ),
        ),
      ),
    );
  }
}
