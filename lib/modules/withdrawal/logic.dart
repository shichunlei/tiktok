import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:tiktok/base/base_logic.dart';
import 'package:tiktok/beans/base_bean.dart';
import 'package:tiktok/beans/withdrawal_address.dart';
import 'package:tiktok/beans/withdrawal_record_info.dart';
import 'package:tiktok/repository/repository.dart';
import 'package:tiktok/utils/toast_util.dart';

class WithdrawalLogic extends BaseLogic {
  TextEditingController passwordController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController priceController = TextEditingController();

  var networkChannelId = Rx<String?>(null);

  var withdrawalRecordInfo = Rx<WithdrawalRecordInfo?>(null);

  RxList<WithdrawalAddress> addresses = RxList<WithdrawalAddress>([]);

  @override
  void onInit() {
    super.onInit();
    getPageData();
  }

  void getPageData() async {
    showLoading();
    withdrawalRecordInfo.value = await Repository.withdrawalRecordInfo();
    addresses.value = await Repository.withdrawalAddress();
    hiddenLoading();
  }

  Future confirm() async {
    if (addressController.text.isEmpty) {
      showToast(text: "Please enter the withdrawal address");
      return;
    }

    if (networkChannelId.value == null) {
      showToast(text: "Please select network channel");
      return;
    }

    if (priceController.text.isEmpty) {
      showToast(text: "Please enter the withdrawal amount");
      return;
    }

    if (passwordController.text.isEmpty) {
      showToast(text: "Please enter password");
      return;
    }

    showLoading();
    BaseBean result = await Repository.withdrawalRecord(
        password: passwordController.text,
        money: priceController.text,
        networkChannelId: networkChannelId.value,
        networkMultipleChannels: addressController.text);
    hiddenLoading();

    if (result.code == 200) {
    } else {
      showToast(text: "${result.message}");
    }
  }
}
