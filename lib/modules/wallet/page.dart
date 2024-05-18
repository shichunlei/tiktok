import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:tiktok/widgets/radius_inkwell_widget.dart';

import 'logic.dart';

class WalletPage extends StatelessWidget {
  WalletLogic get logic => Get.find<WalletLogic>();

  const WalletPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            systemOverlayStyle: SystemUiOverlayStyle.light,
            title: const Text("wallet"),
            centerTitle: true,
            actions: [
              Center(
                  child: TextButton(onPressed: () {}, child: const Text("bill", style: TextStyle(color: Colors.white))))
            ]),
        body: Column(children: [
          SizedBox(height: 40.h),
          Text("Wallet balance", style: TextStyle(color: Colors.white, fontSize: 30.sp, fontWeight: FontWeight.w600)),
          SizedBox(height: 10.h),
          Text("200.35", style: TextStyle(color: Colors.white, fontSize: 30.sp, fontWeight: FontWeight.w600)),
          SizedBox(height: 10.h),
          Text("USDT", style: TextStyle(color: Colors.white, fontSize: 30.sp, fontWeight: FontWeight.w600)),
          RadiusInkWellWidget(
              onPressed: () {},
              radius: 50,
              color: const Color(0xff333333),
              border: Border.all(width: 1, color: Colors.white),
              child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 4.h),
                  child: Text("Withdrawal",
                      style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600, fontSize: 20.sp)))),
          Container(
              margin: EdgeInsets.only(top: 50.h, bottom: 10.h),
              alignment: Alignment.centerLeft,
              padding: EdgeInsets.symmetric(horizontal: 10.w),
              child: Text("Member activation card",
                  style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600, fontSize: 20.sp))),
          ListView.separated(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              padding: EdgeInsets.zero,
              itemBuilder: (_, index) {
                return Container(
                    padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
                    margin: EdgeInsets.symmetric(horizontal: 10.w),
                    decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(6.r)),
                    child: Row(children: [
                      Container(
                          width: 60.r,
                          height: 60.r,
                          decoration:
                              BoxDecoration(borderRadius: BorderRadius.circular(60), color: const Color(0xffF8DD96)),
                          margin: EdgeInsets.only(right: 10.w),
                          alignment: Alignment.center,
                          child: Text("24H",
                              style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600, fontSize: 18.sp))),
                      Text("Daily Card Test", style: TextStyle(color: Colors.black, fontSize: 18.sp)),
                      const Spacer(),
                      RadiusInkWellWidget(
                          radius: 40,
                          color: const Color(0xffE78546),
                          child: Container(
                              width: 100.w,
                              height: 30.h,
                              alignment: Alignment.center,
                              child: Text("411.85 USDT", style: TextStyle(color: Colors.white, fontSize: 15.sp))),
                          onPressed: () {})
                    ]));
              },
              separatorBuilder: (_, index) => SizedBox(height: 10.h),
              itemCount: 4)
        ]));
  }
}
