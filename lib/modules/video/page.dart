import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:tiktok/beans/video.dart';
import 'package:tiktok/global/config.dart';
import 'package:tiktok/global/icon_font.dart';
import 'package:tiktok/widgets/avatar_image.dart';
import 'package:video_player/video_player.dart';
import 'package:visibility_detector/visibility_detector.dart';

import 'logic.dart';

class VideoPage extends StatelessWidget {
  final String tag;
  final Video video;

  const VideoPage({super.key, required this.tag, required this.video});

  VideoLogic get logic => Get.put(VideoLogic(video.url!), tag: tag);

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return VisibilityDetector(
          key: Key(tag),
          onVisibilityChanged: logic.onVisibilityChanged,
          child: Stack(children: [
            GetBuilder<VideoLogic>(
                init: logic,
                tag: tag,
                builder: (_) {
                  return Positioned.fill(
                      child: logic.videoPlayerController.value.isInitialized
                          ? Center(
                              child: AspectRatio(
                                  aspectRatio: logic.videoPlayerController.value.aspectRatio,
                                  child: VideoPlayer(logic.videoPlayerController)))
                          : const SizedBox.shrink());
                }),
            Positioned.fill(child: GestureDetector(onTap: logic.onTogglePause)),
            Positioned.fill(
                child: IgnorePointer(
                    child: Center(
                        child: AnimatedBuilder(
                            animation: logic.animationController,
                            builder: (context, child) {
                              return Transform.scale(scale: logic.animationController.value, child: child);
                            },
                            child: AnimatedOpacity(
                                opacity: logic.isPaused.value ? 1 : 0,
                                duration: const Duration(milliseconds: 200),
                                child: Icon(IconFont.play, color: const Color(0xffcccccc), size: 80.r)))))),
            Positioned(
                bottom: 20.h,
                left: 10.w,
                right: 10.w,
                child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                  Text("${video.label}",
                      style: TextStyle(fontSize: 20.sp, color: Colors.white, fontWeight: FontWeight.bold)),
                  SizedBox(height: 10.h),
                  Text('${video.info}', style: TextStyle(fontSize: 16.sp, color: Colors.white))
                ])),
            Positioned(
                bottom: 20.h,
                right: 10.w,
                child: Column(children: [
                  Stack(clipBehavior: Clip.none, children: [
                    AvatarImageView("${AppConfig.baseUrl}img/avatar/${video.profileFile}",
                        radius: 30.r, borderWidth: 2.r, borderColor: Colors.white),
                    Positioned(
                        bottom: -8.h,
                        right: 0,
                        left: 0,
                        child: Center(
                            child: Container(
                                height: 20.r,
                                width: 20.r,
                                decoration: BoxDecoration(borderRadius: BorderRadius.circular(10), color: Colors.red),
                                child: Icon(Icons.add, color: Colors.white, size: 13.r))))
                  ]),
                  SizedBox(height: 10.h),
                  Text("${video.name}", style: TextStyle(color: Colors.white, fontSize: 15.sp)),
                  SizedBox(height: 40.h),
                  Icon(IconFont.like, color: Colors.white, size: 35.r),
                  SizedBox(height: 5.h),
                  Text("${video.likeCount}", style: TextStyle(color: Colors.white, fontSize: 14.sp)),
                  SizedBox(height: 20.h),
                  Icon(IconFont.comment, color: Colors.white, size: 35.r),
                  SizedBox(height: 5.h),
                  Text("${video.commentsCount}", style: TextStyle(color: Colors.white, fontSize: 14.sp)),
                  SizedBox(height: 20.h),
                  Icon(IconFont.share, color: Colors.white, size: 35.r),
                  SizedBox(height: 5.h),
                  Text("${video.shareCount}", style: TextStyle(color: Colors.white, fontSize: 14.sp)),
                  SizedBox(height: 80.h),
                ])),
            Positioned(
                left: 0,
                right: 0,
                bottom: 0,
                child: SizedBox(
                    height: 1,
                    width: double.infinity,
                    child: GetBuilder<VideoLogic>(
                        tag: tag,
                        init: logic,
                        builder: (_) {
                          return Obx(() {
                            return LinearProgressIndicator(
                                value: logic.duration.value.inMilliseconds == 0 ||
                                        !logic.videoPlayerController.value.isInitialized
                                    ? null
                                    : logic.duration.value.inMilliseconds == 0
                                        ? 0
                                        : logic.position.value.inMilliseconds / logic.duration.value.inMilliseconds,
                                valueColor: const AlwaysStoppedAnimation<Color>(Colors.white),
                                backgroundColor: Colors.grey);
                          });
                        })))
          ]));
    });
  }
}
