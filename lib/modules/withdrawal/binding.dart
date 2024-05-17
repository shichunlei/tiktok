import 'package:get/get.dart';

import 'logic.dart';

class WithdrawalBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<WithdrawalLogic>(() => WithdrawalLogic());
  }
}
