import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:get/state_manager.dart';
import 'package:sgd_client_mobile/controllers/service_detail_controller.dart';
import 'package:sgd_client_mobile/screens/chat_page.dart';

class ServiceDetail extends StatelessWidget {
  const ServiceDetail({Key? key}) : super(key: key);
  static TextStyle titleStyle = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.w500,
  );

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ServiceDetailController>(
      init: ServiceDetailController(),
      builder: (_) => Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back,
              color: Colors.white,
            ),
            onPressed: () => Get.back(),
          ),
          title: Text(
            'Detalle del servicio',
            style: TextStyle(color: Colors.white),
          ),
        ),
        body: Container(
          padding: EdgeInsets.only(top: 80, left: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Servicio agendado:', style: titleStyle),
                        Text(_.service.service.name),
                        SizedBox(height: 15),
                        Text('Técnico asignado:', style: titleStyle),
                        Text(
                            '${_.service.technician.firstName} ${_.service.technician.lastName}'),
                        SizedBox(height: 15),
                        Text('Número de contacto:', style: titleStyle),
                        Text(_.service.technician.phone),
                        SizedBox(height: 15),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Column(
                      children: [
                        Container(
                          padding: EdgeInsets.only(bottom: 30),
                          child: CircleAvatar(
                            radius: 50,
                            backgroundImage: NetworkImage(
                                _.service.technician.photo,
                                scale: 10),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Text('Fecha y hora:', style: titleStyle),
              Text(_.service.date),
              SizedBox(height: 15),
              Text('Lugar de servicio:', style: titleStyle),
              Text(_.service.address ?? ''),
              SizedBox(height: 15),
              Text('Referencia de la ubicación:', style: titleStyle),
              Text(_.service.reference ?? ''),
              SizedBox(height: 85),
              Center(
                child: Container(
                  color: Colors.purple[900],
                  height: 40,
                  width: 300,
                  child: TextButton(
                    child: Text(
                      'Ver todos los servicios agendados',
                      style: TextStyle(color: Colors.white, fontSize: 16),
                    ),
                    onPressed: () {
                      Get.back();
                    },
                  ),
                ),
              ),
              SizedBox(height: 25),
              Center(
                child: Container(
                  color: Colors.red[700],
                  height: 40,
                  width: 100,
                  child: TextButton(
                    child: Text(
                      'Ayuda',
                      style: TextStyle(color: Colors.white, fontSize: 16),
                    ),
                    onPressed: () {
                      Get.to(ChatPage());
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
