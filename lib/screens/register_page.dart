import 'package:flutter/material.dart';

enum Genre { masculino, femenino, nobinario }

class RegisterPage extends StatefulWidget {
  RegisterPage({Key? key}) : super(key: key);

  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  Genre? _genre = Genre.femenino;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                          color: Theme.of(context).accentColor,
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
                              value: Genre.femenino,
                              groupValue: _genre,
                              onChanged: (Genre? value) {
                                setState(() {
                                  _genre = value;
                                });
                              },
                            ),
                          ),
                        ),
                        Expanded(
                          child: ListTile(
                            title: Text('Masculino'),
                            leading: Radio(
                              value: Genre.masculino,
                              groupValue: _genre,
                              onChanged: (Genre? value) {
                                setState(() {
                                  _genre = value;
                                });
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
                        decoration: const InputDecoration(
                          hintText: 'Teléfono',
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 30, right: 30, top: 20),
                      child: TextFormField(
                        obscureText: true,
                        decoration: const InputDecoration(
                          hintText: 'Correo Electrónico',
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 30, right: 30, top: 20),
                      child: TextFormField(
                        obscureText: true,
                        decoration: const InputDecoration(
                          hintText: 'Contraseña',
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 30, right: 30, top: 50),
                      child: GestureDetector(
                        onTap: () {},
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
                          color: Theme.of(context).accentColor,
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
    );
  }
}
