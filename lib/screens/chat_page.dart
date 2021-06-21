import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';

class ChatPage extends StatelessWidget {
  const ChatPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
          onPressed: () => Get.back(),
        ),
        title: Text(
          'Chat bot',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Center(
        child: Text('Chat Page'),
      ),
    );
  }
}
