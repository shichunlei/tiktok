import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
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
                Row(crossAxisAlignment: CrossAxisAlignment.end, children: [
                  SizedBox(width: 30.w, height: 50.h),
                  const Icon(Icons.manage_accounts_outlined, color: Colors.white),
                  SizedBox(width: 10.w),
                  Expanded(
                      child: TextField(
                          style: TextStyle(color: Colors.black, fontSize: 16.sp, fontWeight: FontWeight.normal),
                          controller: logic.accountController,
                          decoration: InputDecoration(
                              hintText: "Please enter XX account",
                              hintStyle:
                                  TextStyle(color: Colors.grey, fontSize: 16.sp, fontWeight: FontWeight.normal)))),
                  SizedBox(width: 30.w)
                ]),
                Row(crossAxisAlignment: CrossAxisAlignment.end, children: [
                  SizedBox(width: 30.w, height: 50.h),
                  const Icon(Icons.punch_clock_outlined, color: Colors.white),
                  SizedBox(width: 10.w),
                  Expanded(
                      child: TextField(
                          style: TextStyle(color: Colors.black, fontSize: 16.sp, fontWeight: FontWeight.normal),
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
                        child: Text("register", style: TextStyle(color: Colors.black, fontSize: 16.sp)))),
                SizedBox(height: 10.h)
              ])),
          Container(padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 15.w), child: Text("Team account")),
          Expanded(
              child: ListView.separated(
                  itemBuilder: (_, index) {
                    return Container(
                      padding: EdgeInsets.symmetric(horizontal: 15.w),
                      child: Row(children: [
                        const Icon(Icons.supervisor_account, color: Colors.black),
                        SizedBox(width: 10.w),
                        Text("XXX123242", style: TextStyle(color: Colors.black, fontSize: 16.sp))
                      ]),
                    );
                  },
                  separatorBuilder: (_, index) => SizedBox(height: 10.h),
                  itemCount: 10))
        ]));
  }
}
