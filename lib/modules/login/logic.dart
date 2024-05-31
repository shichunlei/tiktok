import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:tiktok/base/base_logic.dart';
import 'package:tiktok/beans/login_result.dart';
import 'package:tiktok/repository/repository.dart';
import 'package:tiktok/route/route_path.dart';
import 'package:tiktok/utils/sp_util.dart';

class LoginLogic extends BaseLogic {
  TextEditingController accountController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  LoginLogic() {
    accountController
      ..addListener(update)
      ..text = "user01_01";
    passwordController
      ..addListener(update)
      ..text = "123";
  }

  Future login() async {
    showLoading();
    LoginResult? result = await Repository.login(username: accountController.text, password: passwordController.text);
    hiddenLoading();
    if (result != null) {
      SpUtil.setString("_TOKEN_", "${result.token}");
      Get.offNamed(RoutePath.HOME_PAGE);
    }
  }

  @override
  void onClose() {
    accountController.dispose();
    passwordController.dispose();
    super.onClose();
  }
}
