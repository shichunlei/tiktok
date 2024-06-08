import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tiktok/base/base_logic.dart';
import 'package:tiktok/beans/base_bean.dart';
import 'package:tiktok/beans/recharge_address.dart';
import 'package:tiktok/repository/repository.dart';
import 'package:tiktok/utils/toast_util.dart';
import 'package:tiktok/widgets/radius_inkwell_widget.dart';

class PayDialog extends StatelessWidget {
  final RechargeAddress address;
  final int cardId;

  const PayDialog({super.key, required this.address, required this.cardId});

  PayLogic get logic => Get.put(PayLogic(address, cardId));

  @override
  Widget build(BuildContext context) {
    return Material(
        type: MaterialType.transparency,
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Stack(clipBehavior: Clip.none, children: [
            Container(
                width: 300.w,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4.r),
                    border: Border.all(color: Colors.grey),
                    color: Colors.white),
                child: Column(mainAxisSize: MainAxisSize.min, children: [
                  SizedBox(height: 40.h),
                  Text("USDT: Recharge", style: TextStyle(color: Colors.black, fontSize: 15.sp)),
                  Text("${address.address}", style: TextStyle(color: Colors.black, fontSize: 15.sp)),
                  SizedBox(height: 10.h),
                  Text("Select network: ${address.name}", style: TextStyle(color: Colors.black, fontSize: 16.sp)),
                  SizedBox(height: 10.h),
                  Text("Payment received within 24 hours of successful payment",
                      style: TextStyle(color: Colors.black, fontSize: 10.sp)),
                  SizedBox(height: 10.h),
                  Row(children: [
                    SizedBox(width: 30.w),
                    RadiusInkWellWidget(
                        color: const Color(0xffA3ADB3),
                        radius: 4.r,
                        onPressed: logic.copy,
                        border: Border.all(color: const Color(0xffA3ADB3), width: 1),
                        child: Container(
                            height: 35.h,
                            padding: EdgeInsets.symmetric(horizontal: 10.w),
                            alignment: Alignment.center,
                            child: Text("Copy Link", style: TextStyle(color: Colors.white, fontSize: 16.sp)))),
                    const Spacer(),
                    RadiusInkWellWidget(
                        color: const Color(0xffFFC605),
                        radius: 4.r,
                        onPressed: logic.complete,
                        border: Border.all(color: const Color(0xffA3ADB3), width: 1),
                        child: Container(
                            height: 35.h,
                            padding: EdgeInsets.symmetric(horizontal: 10.w),
                            alignment: Alignment.center,
                            child: Text("complete", style: TextStyle(color: Colors.black, fontSize: 16.sp)))),
                    SizedBox(width: 30.w),
                  ]),
                  SizedBox(height: 10.h)
                ])),
            // Positioned(
            //     top: 0,
            //     right: 0,
            //     child: GestureDetector(
            //         behavior: HitTestBehavior.translucent,
            //         onTap: Get.back,
            //         child: Container(
            //             margin: EdgeInsets.all(3.r),
            //             padding: EdgeInsets.all(1.r),
            //             decoration: BoxDecoration(
            //                 borderRadius: BorderRadius.circular(30), border: Border.all(color: Colors.black)),
            //             child: Icon(Icons.close, color: Colors.black, size: 18.r)))),
            Positioned(
                right: 0,
                left: 0,
                top: -15.h,
                child: Center(
                    child: Text("Payment Window",
                        style: GoogleFonts.sairaSemiCondensed(
                            color: Colors.black, fontSize: 22.sp, fontWeight: FontWeight.bold))))
          ]),
          Container(height: 20.h),
          GestureDetector(
              behavior: HitTestBehavior.translucent,
              onTap: Get.back,
              child: Container(
                  padding: EdgeInsets.all(12.r),
                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(30), color: Colors.black45),
                  child: Icon(Icons.close, color: Colors.white, size: 20.r)))
        ]));
  }
}

class PayLogic extends BaseLogic {
  final RechargeAddress address;
  final int cardTypeId;

  PayLogic(this.address, this.cardTypeId);

  void copy() {
    Clipboard.setData(ClipboardData(text: "${address.address}"));
    showToast(text: "已复制到剪切板");
  }

  Future complete() async {
    showLoading();
    BaseBean result = await Repository.rechargeRecord(cardTypeId);
    hiddenLoading();
    if (result.code == 200) Get.back();
  }
}
