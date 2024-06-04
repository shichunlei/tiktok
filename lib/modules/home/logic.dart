import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:tiktok/base/base_list_logic.dart';
import 'package:tiktok/beans/video.dart';
import 'package:tiktok/repository/repository.dart';
import 'package:tiktok/utils/log_utils.dart';
import 'package:wakelock_plus/wakelock_plus.dart';

class HomeLogic extends BaseListLogic<Video> {
  PageController pageController = PageController();

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

  @override
  void onInit() {
    initData();
    super.onInit();
  }

  @override
  Future<List<Video>> loadData() async {
    return await Repository.videoUpload();
  }

  @override
  void onCompleted(List<Video> data) {
    if (data.isNotEmpty) earnings();
  }

  Future earnings() async {
    await Repository.earnings();
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
