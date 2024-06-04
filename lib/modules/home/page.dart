import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:tiktok/modules/video/page.dart';
import 'package:tiktok/utils/log_utils.dart';
import 'package:tiktok/widgets/obx_widget.dart';

import 'logic.dart';

class HomePage extends StatelessWidget {
  HomeLogic get logic => Get.find<HomeLogic>();

  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: BaseWidget(
            logic: logic,
            builder: (HomeLogic controller) {
              return Stack(children: [
                AppBar(systemOverlayStyle: SystemUiOverlayStyle.light, backgroundColor: Colors.black, elevation: 0),
                RefreshIndicator(
                    onRefresh: () async {
                      await logic.refreshData();
                    },
                    displacement: 50,
                    edgeOffset: 20,
                    color: Theme.of(context).primaryColor,
                    child: PageView.builder(
                        controller: logic.pageController,
                        scrollDirection: Axis.vertical,
                        onPageChanged: logic.onPageChanged,
                        itemCount: logic.list.length,
                        itemBuilder: (context, index) => VideoPage(tag: "$index", video: logic.list[index]))),
                Obx(() {
                  return Positioned(
                      left: max(min(logic.leftTopX.value, 1.sw - logic.viewWidth), 15.w),
                      top: logic.leftTopY.value,
                      child: GestureDetector(
                          onPanUpdate: (DragUpdateDetails details) {
                            logic.leftTopX.value = details.globalPosition.dx;
                            logic.leftTopY.value = details.globalPosition.dy;
                            Log.d(
                                "onPanUpdate===============>${details.globalPosition.dx}====${details.globalPosition.dy}");
                          },
                          onPanEnd: (DragEndDetails details) {
                            Log.d("onPanEnd===============>${details.toString()}");
                            if (logic.leftTopX.value - logic.viewWidth < .5.sw) logic.leftTopX.value = 15.w;

                            if (logic.leftTopX.value > .5.sw) logic.leftTopX.value = 1.sw - logic.viewWidth - 15.w;
                          },
                          child: SizedBox(
                              width: logic.viewWidth,
                              height: logic.viewWidth,
                              child: Stack(children: [
                                Positioned.fill(
                                    child: CircularProgressIndicator(
                                        strokeWidth: 2,
                                        value: (30 - logic.countdownTime.value) / 30,
                                        valueColor: const AlwaysStoppedAnimation<Color>(Color(0xffFFCC02)),
                                        backgroundColor: const Color(0xff484d59))),
                                Center(child: Obx(() {
                                  return Text("${logic.countdownTime.value}S",
                                      style: TextStyle(color: const Color(0xffFFCC02), fontSize: 14.sp));
                                }))
                              ]))));
                })
              ]);
            }));
  }
}
