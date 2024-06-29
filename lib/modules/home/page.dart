import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:tiktok/modules/video/page.dart';
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
                      // await logic.refreshData();
                    },
                    displacement: 50,
                    edgeOffset: 20,
                    color: Theme.of(context).primaryColor,
                    child: PageView.builder(
                        controller: logic.pageController,
                        scrollDirection: Axis.vertical,
                        onPageChanged: logic.onPageChanged,
                        itemCount: logic.list.length,
                        itemBuilder: (_, index) => VideoPage(
                            tag: "$index", video: logic.list[index], isLast: logic.list.length - 1 == index))),
                // Obx(() {
                //   return Positioned(
                //       left: max(min(logic.leftTopX.value, 1.sw - logic.viewWidth), 15.w),
                //       top: logic.leftTopY.value,
                //       child: GestureDetector(
                //           onPanUpdate: (DragUpdateDetails details) {
                //             logic.leftTopX.value = details.globalPosition.dx;
                //             logic.leftTopY.value = details.globalPosition.dy;
                //             Log.d(
                //                 "onPanUpdate===============>${details.globalPosition.dx}====${details.globalPosition.dy}");
                //           },
                //           onPanEnd: (DragEndDetails details) {
                //             Log.d("onPanEnd===============>${details.toString()}");
                //             if (logic.leftTopX.value - logic.viewWidth < .5.sw) logic.leftTopX.value = 15.w;
                //
                //             if (logic.leftTopX.value > .5.sw) logic.leftTopX.value = 1.sw - logic.viewWidth - 15.w;
                //           },
                //           child:
                // SizedBox(
                //     width: logic.viewWidth,
                //     height: logic.viewWidth,
                //     child: Stack(children: [
                //       Positioned.fill(
                //           child: CircularProgressIndicator(
                //               strokeWidth: 2,
                //               value: (30 - logic.countdownTime.value) / 30,
                //               valueColor: const AlwaysStoppedAnimation<Color>(Color(0xffFFCC02)),
                //               backgroundColor: const Color(0xff484d59))),
                //       Center(child: Obx(() {
                //         return Text("${logic.countdownTime.value}S",
                //             style: TextStyle(color: const Color(0xffFFCC02), fontSize: 14.sp));
                //       }))
                //     ]))
                //       ));
                // }),
                Positioned(
                    right: 10.w,
                    top: 180,
                    child: SizedBox(
                        width: 60.r,
                        height: 60.r * 219 / 183,
                        child: Stack(children: [
                          Image.asset("assets/images/wallet.png", width: 60.r, fit: BoxFit.fitWidth),
                          Positioned(
                              left: 0,
                              right: 0,
                              bottom: 0,
                              top: 147.w * 60.r / 183,
                              child: Center(child: Obx(() {
                                return FittedBox(
                                    fit: BoxFit.contain,
                                    child: Padding(
                                        padding: const EdgeInsets.symmetric(horizontal: 3),
                                        child: Text("${logic.earningsBean.value?.bigDecimal ?? 0}USDT",
                                            style: TextStyle(
                                                fontSize: 12.sp,
                                                fontWeight: FontWeight.w600,
                                                color: const Color(0xffFFCC02)))));
                              })))
                        ])))
              ]);
            }));
  }
}
