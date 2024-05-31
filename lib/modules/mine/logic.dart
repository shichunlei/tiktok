import 'package:get/get.dart';
import 'package:tiktok/base/base_object_logic.dart';
import 'package:tiktok/beans/user_info.dart';
import 'package:tiktok/repository/repository.dart';

class MineLogic extends BaseObjectLogic<UserInfo?> {
  MineLogic();

  var commissionRate = .0.obs;

  @override
  void onInit() {
    showLoading();
    initData();
    super.onInit();
  }

  @override
  Future<UserInfo?> loadData() async {
    _commissionRate();
    return await Repository.getUserInfoById();
  }

  @override
  void onCompleted(UserInfo? data) {
    super.onCompleted(data);
    hiddenLoading();
  }

  void _commissionRate() async {
    commissionRate.value = await Repository.commissionRate();
  }
}
