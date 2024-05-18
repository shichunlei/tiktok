import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import 'logic.dart';

class HomePage extends StatelessWidget {
  HomeLogic get logic => Get.find<HomeLogic>();

  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(systemOverlayStyle: SystemUiOverlayStyle.light));
  }
}
