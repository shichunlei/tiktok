import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:tiktok/widgets/radius_inkwell_widget.dart';

import 'logic.dart';

class LoginPage extends StatelessWidget {
  LoginLogic get logic => Get.find<LoginLogic>();

  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
            padding: EdgeInsets.zero,
            child: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
              Container(
                  margin: EdgeInsets.only(top: 120.h),
                  width: 240.r,
                  height: 240.r,
                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(300), color: const Color(0xff1c1c1c)),
                  alignment: Alignment.center,
                  child: Container(
                      width: 210.r,
                      height: 210.r,
                      decoration:
                          BoxDecoration(borderRadius: BorderRadius.circular(300), color: const Color(0xff494949)),
                      alignment: Alignment.center,
                      child: Container(
                          width: 180.r,
                          height: 180.r,
                          decoration:
                              BoxDecoration(borderRadius: BorderRadius.circular(300), color: const Color(0xff9e9e9e)),
                          alignment: Alignment.center,
                          child: Image.asset("assets/images/logo_circle.png", width: 150.r, height: 150.r)))),
              SizedBox(height: 40.h),
              Container(
                  alignment: Alignment.center,
                  width: double.infinity,
                  child: Image.asset("assets/images/tiktok.webp", height: 40.h, fit: BoxFit.fitHeight)),
              Container(
                  margin: EdgeInsets.symmetric(vertical: 40.h),
                  alignment: Alignment.center,
                  width: double.infinity,
                  child: Text("Account password login",
                      style: TextStyle(color: Colors.white, fontSize: 30.sp, fontWeight: FontWeight.w100))),
              Container(
                  margin: EdgeInsets.symmetric(horizontal: 30.w),
                  decoration: const BoxDecoration(border: Border(bottom: BorderSide(color: Colors.white, width: 1))),
                  child: TextField(
                      controller: logic.accountController,
                      style: TextStyle(color: Colors.white, fontSize: 16.sp),
                      decoration: InputDecoration(
                          isCollapsed: true,
                          hintText: "Please enter your account number",
                          border: InputBorder.none,
                          hintStyle: TextStyle(color: Colors.grey, fontSize: 16.sp),
                          contentPadding: EdgeInsets.symmetric(vertical: 5.h)))),
              SizedBox(height: 20.h),
              Container(
                  margin: EdgeInsets.symmetric(horizontal: 30.w),
                  decoration: const BoxDecoration(border: Border(bottom: BorderSide(color: Colors.white, width: 1))),
                  child: TextField(
                      controller: logic.passwordController,
                      keyboardType: TextInputType.visiblePassword,
                      obscureText: true,
                      style: TextStyle(color: Colors.white, fontSize: 16.sp),
                      decoration: InputDecoration(
                          isCollapsed: true,
                          hintText: "Please enter password",
                          border: InputBorder.none,
                          hintStyle: TextStyle(color: Colors.grey, fontSize: 16.sp),
                          contentPadding: EdgeInsets.symmetric(vertical: 5.h)))),
              RadiusInkWellWidget(
                  margin: EdgeInsets.symmetric(horizontal: 50.w, vertical: 50.h),
                  onPressed: logic.login,
                  color: const Color(0xff333333),
                  radius: 40,
                  child: Container(
                      height: 50.h,
                      alignment: Alignment.center,
                      child: Text("Login", style: TextStyle(color: Colors.white, fontSize: 16.sp)))),
              Container(
                  margin: EdgeInsets.only(bottom: 40.h, left: 15.w, right: 15.w),
                  alignment: Alignment.center,
                  width: double.infinity,
                  child: RichText(
                      text: TextSpan(children: [
                        const TextSpan(text: "Login signifies agreement to the "),
                        TextSpan(
                            text: "user agreement",
                            style: const TextStyle(color: Colors.blue),
                            recognizer: TapGestureRecognizer()..onTap = () {}),
                        const TextSpan(text: " and "),
                        TextSpan(
                            text: "privacy agreement",
                            style: const TextStyle(color: Colors.blue),
                            recognizer: TapGestureRecognizer()..onTap = () {})
                      ], style: TextStyle(color: Colors.white, fontSize: 15.sp)),
                      textAlign: TextAlign.center)),
            ])));
  }
}
