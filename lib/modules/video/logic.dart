import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tiktok/base/base_logic.dart';
import 'package:tiktok/modules/home/logic.dart';
import 'package:tiktok/utils/log_utils.dart';
import 'package:video_player/video_player.dart';
import 'package:visibility_detector/visibility_detector.dart';

class VideoLogic extends BaseLogic with GetTickerProviderStateMixin {
  final String videoUrl;
  final bool isLast;

  final debouncer = Debouncer(delay: const Duration(milliseconds: 500));

  late VideoPlayerController videoPlayerController;

  var duration = Duration.zero.obs;
  var position = Duration.zero.obs;

  late final AnimationController animationController;

  VideoLogic(this.videoUrl, this.isLast);

  @override
  void onInit() {
    super.onInit();
    _initVideoPlayer();

    animationController = AnimationController(
        vsync: this, lowerBound: 1.0, upperBound: 1.5, value: 1.5, duration: const Duration(milliseconds: 200));
  }

  void _initVideoPlayer() async {
    videoPlayerController = VideoPlayerController.networkUrl(Uri.parse(videoUrl));
    videoPlayerController.initialize().then((value) {
      update();
    });
    videoPlayerController
      ..setLooping(isLast)
      ..addListener(_onVideoChange);
  }

  void _onVideoChange() {
    if (videoPlayerController.value.isInitialized) {
      duration.value = videoPlayerController.value.duration;
      position.value = videoPlayerController.value.position;

      Log.d("====================${videoPlayerController.value.isCompleted}");

      if (duration.value.inMilliseconds > 0 && duration.value.inMilliseconds <= position.value.inMilliseconds) {
        videoPlayerController.seekTo(Duration.zero);
        debouncer.run(() {
          Log.d("111111111111111111111111111111111111111111111111111111111");
          Get.find<HomeLogic>().next();
        });
      }
    }
  }

  var isPaused = false.obs;

  void onVisibilityChanged(VisibilityInfo info) {
    if (info.visibleFraction == 1 && !videoPlayerController.value.isPlaying) {
      videoPlayerController.play().then((value) {
        animationController.forward();
        isPaused.value = false;
      });
    }

    if (videoPlayerController.value.isPlaying && info.visibleFraction == 0) onTogglePause();
  }

  void onTogglePause() {
    if (videoPlayerController.value.isPlaying) {
      videoPlayerController.pause();
      animationController.reverse();
    } else {
      videoPlayerController.play();
      animationController.forward();
    }
    isPaused.toggle();
  }

  @override
  void onClose() {
    videoPlayerController.dispose();
    animationController.dispose();
    super.onClose();
  }
}

class Debouncer {
  final Duration delay;
  Timer? _timer;

  Debouncer({required this.delay});

  void run(VoidCallback callback) {
    _timer?.cancel();
    _timer = Timer(delay, callback);
  }
}
