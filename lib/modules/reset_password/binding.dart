import 'package:get/get.dart';

import 'logic.dart';

class ResetPasswordBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ResetPasswordLogic>(() => ResetPasswordLogic());
  }
}
