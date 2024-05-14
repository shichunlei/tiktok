import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tiktok/widgets/frame_stack.dart';
import 'package:tiktok/widgets/keep_alive_view.dart';

import 'logic.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  MainLogic get logic => Get.find<MainLogic>();

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Scaffold(
          body: FrameStack(controller: logic.indexController, initIndex: 0, children: [
            KeepAliveView(child: Container()),
            KeepAliveView(child: Container()),
            KeepAliveView(child: Container()),
            KeepAliveView(child: Container()),
            KeepAliveView(child: Container()),
          ]),
          bottomNavigationBar: BottomNavigationBar(
              type: BottomNavigationBarType.fixed,
              items: [
                BottomNavigationBarItem(
                    icon: Image.asset("assets/images/tab_home.png", width: 22, height: 22),
                    label: "首页",
                    activeIcon: Image.asset("assets/images/tab_home_select.png", width: 22, height: 22)),
                BottomNavigationBarItem(
                    icon: Image.asset("assets/images/tab_bifen.png", width: 22, height: 22),
                    label: "比分",
                    activeIcon: Image.asset("assets/images/tab_bifen_select.png", width: 22, height: 22)),
                BottomNavigationBarItem(
                    icon: Image.asset("assets/images/tab_community.png", width: 22, height: 22),
                    label: "社区",
                    activeIcon: Image.asset("assets/images/tab_community_select.png", width: 22, height: 22)),
                BottomNavigationBarItem(
                    icon: Image.asset("assets/images/tab_ranking.png", width: 22, height: 22),
                    label: "榜单",
                    activeIcon: Image.asset("assets/images/tab_ranking_select.png", width: 22, height: 22)),
                BottomNavigationBarItem(
                    icon: Image.asset("assets/images/tab_mine.png", width: 22, height: 22),
                    label: "我的",
                    activeIcon: Image.asset("assets/images/tab_mine_select.png", width: 22, height: 22))
              ],
              currentIndex: logic.selectedIndex.value,
              fixedColor: Theme.of(context).primaryColor,
              onTap: logic.onItemTapped));
    });
  }
}
