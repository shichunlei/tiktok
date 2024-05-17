import 'package:flutter/material.dart';
import 'package:tiktok/base/base_logic.dart';

class ResetPasswordLogic extends BaseLogic {
  TextEditingController originalPasswordController = TextEditingController();
  TextEditingController newPasswordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  ResetPasswordLogic() {
    originalPasswordController.addListener(update);
    confirmPasswordController.addListener(update);
    newPasswordController.addListener(update);
  }

  @override
  void onClose() {
    originalPasswordController.dispose();
    newPasswordController.dispose();
    confirmPasswordController.dispose();
    super.onClose();
  }
}
