import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';
import 'package:sgd_client_mobile/controllers/user_services_controller.dart';
import 'package:sgd_client_mobile/models/service/user_scheduled_service.dart';

class CanceledServices extends StatelessWidget {
  const CanceledServices({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<UserServicesController>(
      builder: (_) => Scaffold(
        body: Container(
          padding: EdgeInsets.only(bottom: 40),
          child: ListView.builder(
            itemBuilder: (__, index) {
              UserScheduledService? service =
                  _.canceledScheduledServices[index];
              return Container(
                child: ListTile(
                leading: CircleAvatar(
                  backgroundImage: NetworkImage(service.technician.photo),
                ),
                  title: Container(
                    padding: EdgeInsets.only(left: 30),
                    child: Text(
                      service.service.name,
                      style: TextStyle(
                        fontSize: 25,
                        color: Colors.red[600],
                        fontWeight: FontWeight.w500,
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
                            'Profesional: ${service.technician.firstName} ${service.technician.lastName}'),
                        Text('Contacto: ${service.technician.phone}'),
                        Text('Fecha: ${service.date}'),
                      ],
                    ),
                  ),
                ),
              );
            },
            itemCount: _.canceledScheduledServices.length,
          ),
        ),
      ),
    );
  }
}
