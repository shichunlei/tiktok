import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'logic.dart';

class WithdrawalPage extends StatelessWidget {
  WithdrawalLogic get logic => Get.find<WithdrawalLogic>();

  const WithdrawalPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(crossAxisAlignment: CrossAxisAlignment.start, children: []),
    );
  }
}
