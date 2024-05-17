import 'package:get/get.dart';

import 'logic.dart';

class PromotionBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PromotionLogic>(() => PromotionLogic());
  }
}
