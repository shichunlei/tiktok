import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tiktok/base/base_logic.dart';
import 'package:tiktok/beans/base_bean.dart';
import 'package:tiktok/repository/repository.dart';
import 'package:tiktok/route/route_path.dart';
import 'package:tiktok/utils/toast_util.dart';

class ResetPasswordLogic extends BaseLogic {
  TextEditingController originalPasswordController = TextEditingController();
  TextEditingController newPasswordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  ResetPasswordLogic() {
    originalPasswordController.addListener(update);
    confirmPasswordController.addListener(update);
    newPasswordController.addListener(update);
  }

  Future updatePassword() async {
    if (originalPasswordController.text.isEmpty) {
      showToast(text: "Please enter the original password");
      return;
    }

    if (newPasswordController.text.isEmpty) {
      showToast(text: "Please enter a new password");
      return;
    }

    if (confirmPasswordController.text.isEmpty) {
      showToast(text: "Please enter your password again");
      return;
    }

    // if (confirmPasswordController.text != newPasswordController.text) {
    //   showToast(text: "The two passwords are not consistent");
    //   return;
    // }

    showLoading();
    BaseBean result = await Repository.updateUserPassword(
        oldPassword: originalPasswordController.text,
        newPassword: newPasswordController.text,
        confirmPassword: confirmPasswordController.text);
    hiddenLoading();
    showToast(text: "${result.message}");
    if (result.code == 200) Get.offAllNamed(RoutePath.LOGIN_PAGE);
  }

  @override
  void onClose() {
    originalPasswordController.dispose();
    newPasswordController.dispose();
    confirmPasswordController.dispose();
    super.onClose();
  }
}
