import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:tiktok/base/base_list_logic.dart';
import 'package:tiktok/beans/earnings.dart';
import 'package:tiktok/beans/video.dart';
import 'package:tiktok/repository/repository.dart';
import 'package:tiktok/utils/log_utils.dart';
import 'package:tiktok/utils/toast_util.dart';
import 'package:wakelock_plus/wakelock_plus.dart';

class HomeLogic extends BaseListLogic<Video> {
  PageController pageController = PageController(initialPage: 0);

  double viewWidth = 60.r;

  var leftTopX = (15.w).obs;
  var leftTopY = (100.h).obs;

  HomeLogic();

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

  Rx<Earnings?> earningsBean = Rx<Earnings?>(null);

  Future earnings() async {
    earningsBean.value = await Repository.earnings(
        time: earningsBean.value?.duration,
        amount: earningsBean.value?.bigDecimal,
        furtive: earningsBean.value?.furtiveToken);
    if (earningsBean.value != null) {
      countdownTime.value = earningsBean.value!.duration;
      startCountdown();
    }
  }

  var currentIndex = 0.obs;

  void onPageChanged(int page) {
    currentIndex.value = page;
  }

  void next() {
    if (currentIndex.value >= list.length - 1) {
      showToast(text: "没有更多视频了");
    } else {
      pageController.animateToPage(currentIndex.value + 1,
          duration: const Duration(milliseconds: 200), curve: Curves.linear);
    }
  }

  /// 开一个定时器
  //定义变量
  Timer? _timer;

  // 倒计时数值
  var countdownTime = 30.obs;

  // 倒计时是否正在进行
  bool _isCountingDown = false;

  void startCountdown() {
    if (_isCountingDown) return; // 如果已经在倒计时，则不重复启动
    _isCountingDown = true;
    if (_timer != null) _timer!.cancel();
    _timer = null;
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (countdownTime.value < 1) {
        _isCountingDown = false;
        Log.d("================>${countdownTime.value}");
        // 调取接口获取金额数据
        earnings();
      } else {
        countdownTime.value -= 1;
      }
    });
  }

  void pauseTimer() {
    if (_timer != null && _isCountingDown) {
      _timer?.cancel();
      _isCountingDown = false;
    }
  }

  @override
  void onClose() {
    WakelockPlus.disable();
    _timer?.cancel();
    pageController.dispose();
    super.onClose();
  }
}
