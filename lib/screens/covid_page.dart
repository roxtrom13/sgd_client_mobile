import 'package:flutter/material.dart';

class CovidPage extends StatelessWidget {
  const CovidPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SingleChildScrollView(
        child: Image(
          image: AssetImage('assets/img/protocolos.png'),
        ),
      ),
    );
  }
}
