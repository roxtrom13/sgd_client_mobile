import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';
import 'package:get/route_manager.dart';
import 'package:sgd_client_mobile/controllers/home_controller.dart';
import 'package:sgd_client_mobile/models/service/service.dart';

class PhotosPage extends StatelessWidget {
  const PhotosPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      init: HomeController(),
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
            'Nuestros Servicios',
            style: TextStyle(color: Colors.white),
          ),
        ),
        body: Center(
            child: ListView.builder(
          itemBuilder: (__, index) {
            Service? service = _.services[index];
            return Container(
                margin: EdgeInsets.fromLTRB(4.0, 0.0, 4.0, 10.0),
                padding: EdgeInsets.all(5.0),
                width: double.infinity,
                child: Stack(
                  children: [
                    Column(
                      children: [
                        ConstrainedBox(
                          constraints: BoxConstraints(minHeight: 200),
                          child: Image.network(service.image),
                        ),
                        Container(
                          width: double.infinity,
                          padding: EdgeInsets.all(5.0),
                          color: Colors.grey.withOpacity(0.1),
                          child: Text(service.name,
                              textAlign: TextAlign.justify,
                              style: new TextStyle(fontSize: 14)),
                        )
                      ],
                    ),
                  ],
                ));
          },
          itemCount: _.services.length,
        )),
      ),
    );
  }
}
