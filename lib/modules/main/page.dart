import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:tiktok/modules/discover/page.dart';
import 'package:tiktok/modules/home/page.dart';
import 'package:tiktok/modules/mine/page.dart';
import 'package:tiktok/modules/wallet/page.dart';
import 'package:tiktok/widgets/frame_stack.dart';
import 'package:tiktok/widgets/keep_alive_view.dart';
import 'package:tiktok/widgets/nav_tab.dart';
import 'package:tiktok/widgets/post_video_button.dart';

import 'logic.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  MainLogic get logic => Get.find<MainLogic>();

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Scaffold(
          body: FrameStack(controller: logic.indexController, initIndex: 0, children: [
            const KeepAliveView(child: HomePage()),
            const KeepAliveView(child: DiscoverPage()),
            KeepAliveView(child: Container()),
            const KeepAliveView(child: WalletPage()),
            const KeepAliveView(child: MinePage())
          ]),
          bottomNavigationBar: SizedBox(
              height: 70.h,
              child: Row(children: [
                NavTab(
                    icon: FontAwesomeIcons.house,
                    onTap: () => logic.onItemTapped(0),
                    isChecked: logic.selectedIndex.value == 0),
                NavTab(
                    icon: FontAwesomeIcons.compass,
                    onTap: () => logic.onItemTapped(1),
                    isChecked: logic.selectedIndex.value == 1),
                Expanded(
                    child: Center(
                        child: GestureDetector(
                            onTap: () => logic.onItemTapped(2),
                            child: PostVideoButton(inverted: logic.selectedIndex.value == 2)))),
                NavTab(
                    icon: FontAwesomeIcons.message,
                    onTap: () => logic.onItemTapped(3),
                    isChecked: logic.selectedIndex.value == 3),
                NavTab(
                    icon: FontAwesomeIcons.user,
                    onTap: () => logic.onItemTapped(4),
                    isChecked: logic.selectedIndex.value == 4)
              ])));
    });
  }
}
