import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:tiktok/global/icon_font.dart';
import 'package:tiktok/modules/discover/page.dart';
import 'package:tiktok/modules/home/page.dart';
import 'package:tiktok/modules/mine/page.dart';
import 'package:tiktok/modules/wallet/page.dart';
import 'package:tiktok/utils/toast_util.dart';
import 'package:tiktok/widgets/frame_stack.dart';
import 'package:tiktok/widgets/keep_alive_view.dart';
import 'package:tiktok/widgets/nav_tab.dart';

import 'logic.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  MainLogic get logic => Get.find<MainLogic>();

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Scaffold(
          body: FrameStack(controller: logic.indexController, initIndex: 0, children: const [
            KeepAliveView(child: HomePage()),
            KeepAliveView(child: DiscoverPage()),
            KeepAliveView(child: WalletPage()),
            KeepAliveView(child: MinePage())
          ]),
          bottomNavigationBar: SizedBox(
              height: 70.h,
              child: Row(children: [
                NavTab(
                    icon: IconFont.home, onTap: () => logic.onItemTapped(0), isChecked: logic.selectedIndex.value == 0),
                NavTab(
                    icon: IconFont.search,
                    onTap: () => logic.onItemTapped(1),
                    isChecked: logic.selectedIndex.value == 1),
                Expanded(
                    child: Center(
                        child: GestureDetector(
                            onTap: () {
                              showToast(text: "暂未开发");
                            },
                            child: Container(
                                padding: EdgeInsets.only(bottom: 10.h),
                                child: Icon(IconFont.video, color: Colors.white, size: 30.r))))),
                NavTab(
                    icon: IconFont.wallet,
                    onTap: () => logic.onItemTapped(2),
                    isChecked: logic.selectedIndex.value == 2),
                NavTab(
                    icon: IconFont.user, onTap: () => logic.onItemTapped(3), isChecked: logic.selectedIndex.value == 3)
              ])));
    });
  }
}
