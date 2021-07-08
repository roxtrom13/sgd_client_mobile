import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';
import 'package:sgd_client_mobile/controllers/home_controller.dart';

class BookServicesPage extends StatelessWidget {
  const BookServicesPage({Key? key}) : super(key: key);
  static const labelStyle = TextStyle(fontSize: 14, color: Colors.grey);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      init: HomeController(),
      builder: (_) => SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 30),
              Container(
                child: Text('Tipo de servicio', style: labelStyle),
              ),
              Container(
                child: DropdownButtonFormField(
                  hint: Text('Seleccione un servicio'),
                  onChanged: ((newValue) {
                    _.onSelectService(newValue as int);
                  }),
                  items: _.services.map((service) {
                    return DropdownMenuItem(
                      value: service.id,
                      child: Text(service.name),
                    );
                  }).toList(),
                ),
              ),
              SizedBox(height: 20),
              Container(
                child: Text('Técnico', style: labelStyle),
              ),
              Container(
                child: _.getTechnicianList(),
              ),
              //(_.technicians.length == 0)
                  //? Container(
                      //child: DropdownButtonFormField(
                        //hint: Text('Seleccione un técnico'),
                        //items: [
                          //DropdownMenuItem(
                            //child: Text('No se encontraron técnicos'),
                          //)
                        //],
                      //),
                    //)
                  //: Container(
                      //child: DropdownButtonFormField(
                        //hint: Text('Seleccione un técnico'),
                        //onChanged: ((newValue) {
                          //_.onSelectTechnician(newValue as int?);
                        //}),
                        //items: _.technicians.map((technician) {
                          //return DropdownMenuItem(
                            //value:
                                //_.loading ? 'Cargando técnicos' : technician.id,
                            //child: Text(technician.firstName),
                          //);
                        //}).toList(),
                      //),
                    //),
              SizedBox(height: 20),
              Row(
                children: [
                  Expanded(
                    flex: 60,
                    child: TextFormField(
                        enabled: false,
                        decoration:
                            InputDecoration(hintText: 'Fecha de la visita:')),
                  ),
                  Expanded(
                    flex: 35,
                    child: TextFormField(
                      enabled: false,
                      decoration: InputDecoration(
                        hintText: ((_.date == null)
                            ? 'día/mes/año'
                            : '${_.date!.day}/${_.date!.month}/${_.date!.year}'),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 15,
                    child: IconButton(
                      icon: Icon(Icons.calendar_today, size: 30),
                      color: Colors.purple[900],
                      onPressed: () => _.pickDate(context),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),
              Row(
                children: [
                  Expanded(
                    flex: 60,
                    child: TextFormField(
                        enabled: false,
                        decoration:
                            InputDecoration(hintText: 'Hora de visita:')),
                  ),
                  Expanded(
                    flex: 35,
                    child: TextFormField(
                      enabled: false,
                      decoration: InputDecoration(
                        hintText: ((_.time == null)
                            ? 'HH:mm am/pm'
                            : '${_.time!.hour}:${_.time!.minute.toString().padLeft(2, '0')} ${_.time!.period.toString().substring(10, 12)}'),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 15,
                    child: IconButton(
                      icon: Icon(Icons.schedule, size: 30),
                      color: Colors.purple[900],
                      onPressed: () => _.pickTime(context),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),
              Row(
                children: [
                  Expanded(
                    flex: 85,
                    child: TextFormField(
                        enabled: false,
                        decoration:
                            InputDecoration(hintText: 'Compartir ubicación')),
                  ),
                  Expanded(
                    flex: 15,
                    child: Switch(
                      activeColor: Colors.purple[900],
                      value: _.shareLocation,
                      onChanged: _.switchShareLocation,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),
              TextFormField(
                onChanged: _.onChangedReference,
                decoration: InputDecoration(
                  hintText: 'Añadir referencia del lugar',
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 60, left: 39, right: 30),
                color: Colors.purple[900],
                child: Center(
                  child: TextButton(
                    child: Text(
                      'Solicitar servicio técnico',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                      ),
                    ),
                    onPressed: () {
                      _.bookService();
                    },
                  ),
                ),
              ),
              //Container(
                //margin: EdgeInsets.only(top: 10, left: 39, right: 30),
                //color: Colors.purple[900],
                //child: Center(
                  //child: TextButton(
                    //child: Text(
                      //'CLEAR',
                      //style: TextStyle(
                        //color: Colors.white,
                        //fontSize: 18,
                      //),
                    //),
                    //onPressed: _.cleanForm,
                  //),
                //),
              //),
            ],
          ),
        ),
      ),
    );
  }
}
