import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/state_manager.dart';
import 'package:sgd_client_mobile/controllers/register_controller.dart';

enum Gender { masculino, femenino }

class RegisterPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<RegisterController>(
      init: RegisterController(),
      builder: (_) => Scaffold(
        backgroundColor: Theme.of(context).primaryColorLight,
        body: Container(
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(
                    height: 80,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Center(
                        child: Text(
                          'Crea tu Cuenta',
                          style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                            color: Theme.of(context).primaryColor,
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 30, top: 35),
                        child: Text(
                          'Género',
                          style: TextStyle(fontSize: 18),
                        ),
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: ListTile(
                              title: Text('Femenino'),
                              leading: Radio(
                                value: 'F',
                                groupValue: _.gender,
                                onChanged: (value) {
                                  _.onChangeGender(value.toString());
                                },
                              ),
                            ),
                          ),
                          Expanded(
                            child: ListTile(
                              title: Text('Masculino'),
                              leading: Radio(
                                value: 'M',
                                groupValue: _.gender,
                                onChanged: (value) {
                                  _.onChangeGender(value.toString());
                                },
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 12,
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: Padding(
                              padding: EdgeInsets.only(left: 29, right: 1),
                              child: TextFormField(
                                inputFormatters: [
                                  FilteringTextInputFormatter.allow(
                                      RegExp(r'[a-zA-ZÀ-ÿ\u00f1\u00d1+|\s]'))
                                ],
                                onChanged: (val) =>
                                    _.firstName = val.toString(),
                                decoration: const InputDecoration(
                                  hintText: 'Nombres',
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            child: Padding(
                              padding: EdgeInsets.only(left: 1, right: 29),
                              child: TextFormField(
                                inputFormatters: [
                                  FilteringTextInputFormatter.allow(
                                      RegExp(r'[a-zA-ZÀ-ÿ\u00f1\u00d1+|\s]'))
                                ],
                                onChanged: (val) => _.lastName = val.toString(),
                                decoration: const InputDecoration(
                                  hintText: 'Apellidos',
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 30, right: 30, top: 20),
                        child: TextFormField(
                          keyboardType: TextInputType.number,
                          inputFormatters: [
                            FilteringTextInputFormatter.allow(
                                RegExp('^[0-9]{1,9}'))
                          ],
                          onChanged: (val) => _.phone = val.toString(),
                          decoration: const InputDecoration(
                            hintText: 'Teléfono',
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 30, right: 30, top: 20),
                        child: TextFormField(
                          onChanged: (val) => _.email = val.toString(),
                          decoration: const InputDecoration(
                            hintText: 'Correo Electrónico',
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 30, right: 30, top: 20),
                        child: TextFormField(
                          onChanged: (val) => _.password = val.toString(),
                          obscureText: true,
                          decoration: const InputDecoration(
                            hintText: 'Contraseña',
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 30, right: 30, top: 50),
                        child: GestureDetector(
                          onTap: _.onRegister,
                          child: Container(
                            child: Center(
                              child: Text(
                                'REGISTRARSE',
                                style: TextStyle(
                                  fontSize: 20,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                            color: Theme.of(context).primaryColor,
                            width: double.infinity,
                            height: 50.0,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
