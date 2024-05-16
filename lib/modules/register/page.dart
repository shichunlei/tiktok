import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'logic.dart';

class RegisterPage extends StatelessWidget {
  RegisterLogic get logic => Get.find<RegisterLogic>();

  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
            title: const Text("New user registration", style: TextStyle(color: Colors.white)),
            centerTitle: true,
            iconTheme: const IconThemeData(color: Colors.white),
            backgroundColor: Colors.black,
            elevation: 0),
        body: Column(crossAxisAlignment: CrossAxisAlignment.start, children: []));
  }
}
