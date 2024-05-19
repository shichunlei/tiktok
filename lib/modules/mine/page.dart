import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:tiktok/global/icon_font.dart';
import 'package:tiktok/route/route_path.dart';
import 'package:tiktok/widgets/avatar_image.dart';

import 'logic.dart';

class MinePage extends StatelessWidget {
  MineLogic get logic => Get.find<MineLogic>();

  const MinePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(systemOverlayStyle: SystemUiOverlayStyle.light),
        body: SingleChildScrollView(
            padding: EdgeInsets.zero,
            child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              SizedBox(height: 80.h),
              Row(children: [
                SizedBox(width: 15.w),
                AvatarImageView(
                    "https://img.zcool.cn/community/0107c35ba37431a801213dea3bc6d2.jpg@1280w_1l_2o_100sh.jpg",
                    radius: 35.r,
                    borderColor: Colors.white,
                    borderWidth: 1),
                SizedBox(width: 15.w),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text("XXX123",
                          style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600, fontSize: 15.sp)),
                      Container(
                          margin: EdgeInsets.only(top: 10.h),
                          padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 1.h),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30),
                              border: Border.all(width: 1, color: const Color(0xffE39940))),
                          child: Text("1year",
                              style: TextStyle(
                                  color: const Color(0xffF8C702), fontWeight: FontWeight.w600, fontSize: 14.sp)))
                    ],
                  ),
                ),
                SizedBox(width: 15.w)
              ]),
              Container(
                  width: double.infinity,
                  padding: EdgeInsets.only(left: 35.w, top: 25.h, bottom: 25.h),
                  margin: EdgeInsets.only(left: 15.w, right: 15.w, top: 30.h, bottom: 50.h),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(6.r), border: Border.all(color: Colors.white, width: 1)),
                  child: Column(children: [
                    GestureDetector(
                        onTap: () {
                          Get.toNamed(RoutePath.REGISTER_PAGE);
                        },
                        behavior: HitTestBehavior.translucent,
                        child: Row(children: [
                          CircleAvatar(
                              backgroundColor: const Color(0xff3ED987),
                              radius: 30.r,
                              child: const Icon(IconFont.userGroup, color: Colors.white)),
                          SizedBox(width: 20.w),
                          Text("Team management", style: TextStyle(color: Colors.white, fontSize: 18.sp))
                        ])),
                    SizedBox(height: 40.h),
                    Row(children: [
                      Text("10%",
                          style:
                              TextStyle(color: const Color(0xffF9632A), fontSize: 38.sp, fontWeight: FontWeight.w600)),
                      SizedBox(width: 20.w),
                      Text("Rebate ratio", style: TextStyle(color: Colors.white, fontSize: 18.sp))
                    ])
                  ])),
              Container(
                  padding: EdgeInsets.only(left: 30.w),
                  child: Text("system\nmanagement",
                      style: TextStyle(color: Colors.white, fontSize: 18.sp, fontWeight: FontWeight.bold))),
              SizedBox(height: 20.h),
              Row(children: [
                SizedBox(width: 30.w),
                GestureDetector(
                    onTap: () {
                      Get.toNamed(RoutePath.RESET_PASSWORD_PAGE);
                    },
                    behavior: HitTestBehavior.translucent,
                    child: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
                      Icon(IconFont.userManager, color: Colors.white, size: 25.r),
                      SizedBox(height: 10.h),
                      Text("Password modification", style: TextStyle(color: Colors.white, fontSize: 14.sp))
                    ])),
                SizedBox(width: 35.w),
                GestureDetector(
                    onTap: () {
                      Get.toNamed(RoutePath.PROMOTION_PAGE);
                    },
                    behavior: HitTestBehavior.translucent,
                    child: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
                      Icon(IconFont.share_2, color: Colors.white, size: 25.r),
                      SizedBox(height: 10.h),
                      Text("share", style: TextStyle(color: Colors.white, fontSize: 14.sp))
                    ])),
                SizedBox(width: 45.w),
                GestureDetector(
                    onTap: () {},
                    behavior: HitTestBehavior.translucent,
                    child: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
                      Icon(IconFont.quit, color: Colors.white, size: 25.r),
                      SizedBox(height: 10.h),
                      Text("quit", style: TextStyle(color: Colors.white, fontSize: 14.sp))
                    ]))
              ])
            ])));
  }
}
