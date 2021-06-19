import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:get/state_manager.dart';
import 'package:sgd_client_mobile/controllers/global_controller.dart';

import 'package:sgd_client_mobile/screens/register_page.dart';
import 'package:sgd_client_mobile/controllers/login_controller.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<LoginController>(
      init: LoginController(),
      builder: (_) => Scaffold(
        backgroundColor: Theme.of(context).primaryColorLight,
        body: Container(
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Center(
                    child: CircleAvatar(
                      radius: 120,
                      backgroundColor: Theme.of(context).primaryColor,
                      backgroundImage: AssetImage('assets/img/user.png'),
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Form(
                    key: GlobalController().formKey,
                    child: Column(
                      children: [
                        Text(
                          'Inicia Sesión',
                          style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                            color: Theme.of(context).primaryColor,
                          ),
                        ),
                        Padding(
                          padding:
                              EdgeInsets.only(left: 15, right: 30, top: 20),
                          child: TextFormField(
                            decoration: const InputDecoration(
                              icon: Icon(Icons.email),
                              hintText: 'Correo Electrónico',
                            ),
                            validator: (email) {
                              return _.validateEmail(email as String);
                            },
                          ),
                        ),
                        Padding(
                          padding:
                              EdgeInsets.only(left: 15, right: 30, top: 20),
                          child: TextFormField(
                            obscureText: true,
                            decoration: const InputDecoration(
                              icon: Icon(Icons.lock),
                              hintText: 'Contraseña',
                            ),
                            validator: (password){
                              return _.validatePassword(password as String);
                            },
                          ),
                        ),
                        Padding(
                          padding:
                              EdgeInsets.only(left: 30, right: 30, top: 50),
                          child: GestureDetector(
                            onTap: _.onLogin,
                            child: Container(
                              child: Center(
                                  child: _.isLoading
                                      ? CircularProgressIndicator()
                                      : Text(
                                          'INGRESAR',
                                          style: TextStyle(
                                            fontSize: 20,
                                            color: Colors.white,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        )),
                              color: Theme.of(context).primaryColor,
                              width: double.infinity,
                              height: 50.0,
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 20),
                          child: Text(
                            '¿No estás registrado?',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(),
                          child: TextButton(
                            onPressed: () {
                              Get.to(RegisterPage(),
                                  transition: Transition.rightToLeft);
                            },
                            child: Text(
                              'Crea una cuenta',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w600,
                                decoration: TextDecoration.underline,
                                color: Theme.of(context).primaryColorDark,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
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
