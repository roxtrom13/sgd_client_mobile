import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/state_manager.dart';
import 'package:sgd_client_mobile/controllers/service_raiting_controller.dart';

class ServiceRating extends StatelessWidget {
  const ServiceRating({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ServiceRatingController>(
      init: ServiceRatingController(),
      builder: (_) => Scaffold(
        appBar: AppBar(),
        body: SingleChildScrollView(
          child: _.isLoading
              ? Center(child: Text('Cargando información'))
              : Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 40),
                    Container(
                      child: Center(
                        child: Text(
                          'Servicio a calificar',
                          style: TextStyle(fontSize: 22),
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                    ListTile(
                      leading: CircleAvatar(
                        backgroundImage:
                            NetworkImage(_.service.technician.photo),
                      ),
                      title: Text(
                        _.service.service.name,
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: Colors.orange,
                        ),
                      ),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                              'Profesional: ${_.service.technician.firstName} ${_.service.technician.lastName}'),
                          Text('Fecha: ${_.service.date}'),
                        ],
                      ),
                    ),
                    SizedBox(height: 60),
                    Container(
                      padding: EdgeInsets.only(left: 20),
                      child: Text(
                        'Calificación',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                    Center(
                      child: RatingBar.builder(
                        initialRating: 4.5,
                        minRating: 1,
                        direction: Axis.horizontal,
                        allowHalfRating: false,
                        itemCount: 5,
                        itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
                        itemBuilder: (context, _) => Icon(
                          Icons.star,
                          color: Colors.amber,
                        ),
                        onRatingUpdate: (rating) {
                          _.onChangeRating(rating);
                        },
                      ),
                    ),
                    SizedBox(height: 10),
                    Center(
                      child: Text(
                        _.stringRating[_.rating] as String,
                        style: TextStyle(
                          color: Colors.amber[800],
                          fontSize: 16,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                    ),
                    SizedBox(height: 60),
                    Container(
                      padding: EdgeInsets.only(left: 20),
                      child: Text(
                        'Déjanos tu comentario',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 20),
                      padding: EdgeInsets.only(bottom: 30),
                      color: Colors.grey[100],
                      child: TextField(
                        maxLines: 4,
                        onChanged: _.onTextChanged,
                      ),
                    ),
                    Center(
                      child: ElevatedButton(
                        style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all(Colors.red[800])),
                        child: Text('Enviar calificación'),
                        onPressed: _.onSendCalifitation,
                      ),
                    ),
                  ],
                ),
        ),
      ),
    );
  }
}
