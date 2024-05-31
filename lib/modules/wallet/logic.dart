import 'package:get/get.dart';
import 'package:tiktok/base/base_list_logic.dart';
import 'package:tiktok/beans/card_type.dart';
import 'package:tiktok/beans/withdrawal_record_info.dart';
import 'package:tiktok/repository/repository.dart';

class WalletLogic extends BaseListLogic<CardType> {
  var withdrawalRecordInfo = Rx<WithdrawalRecordInfo?>(null);

  @override
  void onInit() {
    initData();
    super.onInit();
  }

  @override
  Future<List<CardType>?> loadData() async {
    withdrawalRecordInfo.value = await Repository.withdrawalRecordInfo();
    return await Repository.cardType();
  }
}
