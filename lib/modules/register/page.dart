import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:tiktok/global/icon_font.dart';
import 'package:tiktok/widgets/radius_inkwell_widget.dart';

import 'logic.dart';

class RegisterPage extends StatelessWidget {
  RegisterLogic get logic => Get.find<RegisterLogic>();

  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
            title: const Text("New user registration", style: TextStyle(color: Colors.white)),
            centerTitle: true,
            iconTheme: const IconThemeData(color: Colors.white),
            backgroundColor: Colors.black,
            elevation: 0),
        body: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Container(
              color: Colors.black,
              child: Column(children: [
                Row(children: [
                  SizedBox(width: 30.w, height: 50.h),
                  const Icon(IconFont.account, color: Colors.white),
                  SizedBox(width: 10.w),
                  Expanded(
                      child: TextField(
                          style: TextStyle(color: Colors.white, fontSize: 16.sp, fontWeight: FontWeight.normal),
                          controller: logic.accountController,
                          decoration: InputDecoration(
                              hintText: "Please enter XX account",
                              hintStyle:
                                  TextStyle(color: Colors.grey, fontSize: 16.sp, fontWeight: FontWeight.normal)))),
                  SizedBox(width: 30.w)
                ]),
                SizedBox(height: 5.h),
                Row(children: [
                  SizedBox(width: 30.w, height: 50.h),
                  const Icon(IconFont.lock, color: Colors.white),
                  SizedBox(width: 10.w),
                  Expanded(
                      child: TextField(
                          style: TextStyle(color: Colors.white, fontSize: 16.sp, fontWeight: FontWeight.normal),
                          controller: logic.passwordController,
                          decoration: InputDecoration(
                              hintText: "Please enter password",
                              hintStyle:
                                  TextStyle(color: Colors.grey, fontSize: 16.sp, fontWeight: FontWeight.normal)))),
                  SizedBox(width: 30.w)
                ]),
                RadiusInkWellWidget(
                    margin: EdgeInsets.symmetric(horizontal: 50.w, vertical: 10.h),
                    onPressed: () {},
                    color: Colors.white,
                    radius: 40,
                    child: Container(
                        height: 50.h,
                        alignment: Alignment.center,
                        child: Text("register",
                            style: TextStyle(color: Colors.black, fontSize: 16.sp, fontWeight: FontWeight.w600)))),
                SizedBox(height: 10.h)
              ])),
          Container(
              padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 15.w),
              child: Text("Team account",
                  style: TextStyle(color: Colors.black, fontSize: 16.sp, fontWeight: FontWeight.w600))),
          Expanded(
              child: ListView.separated(
                  itemBuilder: (_, index) {
                    return Container(
                        padding: EdgeInsets.symmetric(horizontal: 15.w),
                        child: Row(children: [
                          Icon(IconFont.user, color: Colors.black, size: 15.r),
                          SizedBox(width: 10.w),
                          Text("XXX123242", style: TextStyle(color: Colors.black, fontSize: 14.sp)),
                          SizedBox(width: 8.w),
                          Container(
                              height: 25.h,
                              alignment: Alignment.topRight,
                              padding: EdgeInsets.only(top: 5.h),
                              child: Container(
                                  height: 8.r,
                                  width: 8.r,
                                  decoration:
                                      BoxDecoration(borderRadius: BorderRadius.circular(5), color: Colors.green)))
                        ]));
                  },
                  separatorBuilder: (_, index) => SizedBox(height: 10.h),
                  itemCount: 10))
        ]));
  }
}
