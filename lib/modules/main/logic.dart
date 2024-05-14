import 'package:get/get.dart';
import 'package:tiktok/base/base_logic.dart';
import 'package:tiktok/widgets/frame_stack.dart';

class MainLogic extends BaseLogic {
  var selectedIndex = 0.obs;

  IndexController indexController = IndexController();

  void onItemTapped(int index) {
    if (index != selectedIndex.value) {
      selectedIndex.value = index;
      indexController.changeIndex!(index);
    }
  }
}
