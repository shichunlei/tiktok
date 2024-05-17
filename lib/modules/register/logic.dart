import 'package:flutter/material.dart';
import 'package:tiktok/base/base_logic.dart';

class RegisterLogic extends BaseLogic {
  TextEditingController accountController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  RegisterLogic() {
    accountController.addListener(update);
    passwordController.addListener(update);
  }

  @override
  void onClose() {
    accountController.dispose();
    passwordController.dispose();
    super.onClose();
  }
}
