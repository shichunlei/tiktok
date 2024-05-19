import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:tiktok/base/base_logic.dart';
import 'package:tiktok/utils/log_utils.dart';
import 'package:wakelock_plus/wakelock_plus.dart';

class HomeLogic extends BaseLogic {
  PageController pageController = PageController();

  List<String> videos = [
    "https://vt1.doubanio.com/202405181946/ebb339dca83cf0e120be77f3bb2b3e98/view/movie/M/703150994.mp4",
    "https://vt1.doubanio.com/202405181947/7757960e18bfd54004cbead3a7064bac/view/movie/M/703140979.mp4",
    "https://vt1.doubanio.com/202405181947/d832dc06339856ebe5ff4dc12e96adda/view/movie/M/703130745.mp4",
    "https://vt1.doubanio.com/202405181948/4d16d5d770140ea12f36a9d05254ef9b/view/movie/M/703150389.mp4",
    "https://vt1.doubanio.com/202405181949/7f65539f806afca2a7f1a6a1481e6098/view/movie/M/703160023.mp4",
    "https://vt1.doubanio.com/202405181950/c77e648f0a09eb44536f62345ff70652/view/movie/M/703150852.mp4"
  ];

  double viewWidth = 50.r;

  var leftTopX = (15.w).obs;
  var leftTopY = (100.h).obs;

  HomeLogic() {
    startCountdown();
  }

  @override
  void onReady() {
    WakelockPlus.enable();
    super.onReady();
  }

  void onPageChanged(int page) {}

  /// 开一个定时器
  //定义变量
  Timer? _timer;

  //倒计时数值
  var countdownTime = 30.obs;

  void startCountdown() {
    if (_timer != null) _timer?.cancel();
    _timer = null;
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (countdownTime.value < 1) {
        Log.d("================>${countdownTime.value}");
        countdownTime.value = 30;
        // todo 调取接口获取金额数据
        startCountdown();
      } else {
        countdownTime.value -= 1;
      }
    });
  }

  @override
  void onClose() {
    WakelockPlus.disable();
    pageController.dispose();
    super.onClose();
  }
}
