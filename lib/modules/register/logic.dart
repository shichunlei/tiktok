import 'package:flutter/material.dart';
import 'package:tiktok/base/base_list_logic.dart';
import 'package:tiktok/beans/base_bean.dart';
import 'package:tiktok/beans/sub_user.dart';
import 'package:tiktok/repository/repository.dart';
import 'package:tiktok/utils/toast_util.dart';

class RegisterLogic extends BaseListLogic<SubUser> {
  TextEditingController accountController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  RegisterLogic() {
    accountController.addListener(update);
    passwordController.addListener(update);
  }

  @override
  void onInit() {
    initData();
    super.onInit();
  }

  @override
  Future<List<SubUser>> loadData() async {
    return await Repository.getSubUserById();
  }

  Future register() async {
    if (accountController.text.isEmpty) {
      showToast(text: "Please enter account");
      return;
    }

    if (passwordController.text.isEmpty) {
      showToast(text: "Please enter password");
      return;
    }

    showLoading();
    BaseBean result =
        await Repository.registerSubUser(username: accountController.text, password: passwordController.text);
    hiddenLoading();
    showToast(text: "${result.message}");
    if (result.code == 200) {
      accountController.text = "";
      passwordController.text = "";
      refreshData();
    }
  }

  @override
  void onClose() {
    accountController.dispose();
    passwordController.dispose();
    super.onClose();
  }
}
