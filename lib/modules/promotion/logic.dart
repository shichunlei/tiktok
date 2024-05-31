import 'package:get/get.dart';
import 'package:tiktok/base/base_object_logic.dart';
import 'package:tiktok/repository/repository.dart';

class PromotionLogic extends BaseObjectLogic<String?> {
  var downloadLink = "".obs;

  @override
  void onInit() {
    showLoading();
    initData();
    super.onInit();
  }

  @override
  Future<String?> loadData() async {
    return await Repository.downloadAddress();
  }

  @override
  void onCompleted(String? data) {
    hiddenLoading();
  }
}
