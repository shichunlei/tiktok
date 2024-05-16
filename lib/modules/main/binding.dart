import 'package:get/get.dart';
import 'package:tiktok/modules/discover/logic.dart';
import 'package:tiktok/modules/home/logic.dart';
import 'package:tiktok/modules/mine/logic.dart';
import 'package:tiktok/modules/wallet/logic.dart';

import 'logic.dart';

class MainBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MainLogic>(() => MainLogic());
    Get.lazyPut<MineLogic>(() => MineLogic());
    Get.lazyPut<HomeLogic>(() => HomeLogic());
    Get.lazyPut<WalletLogic>(() => WalletLogic());
    Get.lazyPut<DiscoverLogic>(() => DiscoverLogic());
  }
}
