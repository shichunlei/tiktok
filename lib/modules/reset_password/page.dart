import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:tiktok/widgets/radius_inkwell_widget.dart';

import 'logic.dart';

class ResetPasswordPage extends StatelessWidget {
  ResetPasswordLogic get logic => Get.find<ResetPasswordLogic>();

  const ResetPasswordPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            systemOverlayStyle: SystemUiOverlayStyle.dark,
            centerTitle: true,
            title: const Text("Change password", style: TextStyle(color: Colors.black)),
            backgroundColor: Colors.white,
            elevation: 0,
            iconTheme: const IconThemeData(color: Colors.black)),
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
            padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 20.h),
            child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text("Original password", style: TextStyle(color: const Color(0xff333333), fontSize: 16.sp)),
              SizedBox(height: 10.h),
              TextField(
                  keyboardType: TextInputType.visiblePassword,
                  obscureText: true,
                  controller: logic.originalPasswordController,
                  decoration: InputDecoration(
                      hintText: "Please enter the original password",
                      hintStyle: TextStyle(color: Colors.grey, fontSize: 16.sp, fontWeight: FontWeight.normal))),
              SizedBox(height: 15.h),
              Text("New password", style: TextStyle(color: const Color(0xff333333), fontSize: 16.sp)),
              SizedBox(height: 10.h),
              TextField(
                  keyboardType: TextInputType.visiblePassword,
                  obscureText: true,
                  controller: logic.newPasswordController,
                  decoration: InputDecoration(
                      hintText: "Please enter a new password",
                      hintStyle: TextStyle(color: Colors.grey, fontSize: 16.sp, fontWeight: FontWeight.normal))),
              SizedBox(height: 15.h),
              Text("Confirm password", style: TextStyle(color: const Color(0xff333333), fontSize: 16.sp)),
              SizedBox(height: 10.h),
              TextField(
                  keyboardType: TextInputType.visiblePassword,
                  obscureText: true,
                  controller: logic.confirmPasswordController,
                  decoration: InputDecoration(
                      hintText: "Please enter your password again",
                      hintStyle: TextStyle(color: Colors.grey, fontSize: 16.sp, fontWeight: FontWeight.normal))),
              SizedBox(height: 45.h),
              RadiusInkWellWidget(
                  onPressed: () {},
                  radius: 0,
                  color: Colors.black,
                  child: Container(
                      alignment: Alignment.center,
                      height: 50.h,
                      width: double.infinity,
                      child: Text("Confirm modifications", style: TextStyle(color: Colors.white, fontSize: 16.sp))))
            ])));
  }
}
