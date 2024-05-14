import 'package:get/get.dart';
import 'package:tiktok/base/base_logic.dart';

class RootLogic extends BaseLogic {
  var isLogin = false.obs;

  /// 更新登录状态
  Future updateLoginState(bool value) async {
    isLogin.value = value;
  }
}
