import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tiktok/base/base_list_logic.dart';
import 'package:tiktok/beans/card_type.dart';
import 'package:tiktok/beans/recharge_address.dart';
import 'package:tiktok/beans/withdrawal_record_info.dart';
import 'package:tiktok/repository/repository.dart';
import 'package:tiktok/widgets/pay_dialog.dart';

class WalletLogic extends BaseListLogic<CardType> {
  var withdrawalRecordInfo = Rx<WithdrawalRecordInfo?>(null);

  @override
  void onInit() {
    initData();
    super.onInit();
  }

  @override
  Future<List<CardType>> loadData() async {
    withdrawalRecordInfo.value = await Repository.withdrawalRecordInfo();
    return await Repository.cardType();
  }

  Future rechargeRecord(int index) async {
    showLoading();
    List<RechargeAddress> addresses = await Repository.rechargeAddress();
    hiddenLoading();
    if (addresses.isNotEmpty) {
      Get.dialog(PayDialog(address: addresses.first, cardId: list[index].id),
          barrierColor: Colors.white30, barrierDismissible: false);
    }
  }
}
