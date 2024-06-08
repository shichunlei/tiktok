import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:tiktok/global/icon_font.dart';
import 'package:tiktok/utils/toast_util.dart';
import 'package:tiktok/widgets/obx_widget.dart';
import 'package:tiktok/widgets/radius_inkwell_widget.dart';

import 'logic.dart';

class PromotionPage extends StatelessWidget {
  PromotionLogic get logic => Get.find<PromotionLogic>();

  const PromotionPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
            systemOverlayStyle: SystemUiOverlayStyle.dark,
            iconTheme: const IconThemeData(color: Colors.black),
            backgroundColor: Colors.white,
            elevation: 0),
        body: BaseWidget(
            logic: logic,
            showEmpty: false,
            showError: false,
            showLoading: false,
            builder: (PromotionLogic controller) {
              return Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
                SizedBox(height: 80.h),
                Icon(IconFont.space, color: Colors.black, size: 50.r),
                SizedBox(height: 40.h),
                Text("TikTok Changes the World Short Video Platform",
                    style: TextStyle(color: Colors.black, fontSize: 16.sp)),
                SizedBox(height: 100.h),
                Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  const Icon(IconFont.link, color: Color(0xff666666)),
                  SizedBox(width: 10.w),
                  Text("Download link.com", style: TextStyle(color: const Color(0xff999999), fontSize: 14.sp))
                ]),
                SizedBox(height: 30.h),
                RadiusInkWellWidget(
                    margin: EdgeInsets.symmetric(horizontal: 30.w),
                    onPressed: () {
                      Clipboard.setData(ClipboardData(text: "${logic.bean.value}"));
                      showToast(text: "已复制到剪切板");
                    },
                    radius: 2.r,
                    color: Colors.black,
                    child: Container(
                        height: 50.h,
                        alignment: Alignment.center,
                        child: Text("Copy Link", style: TextStyle(color: Colors.white, fontSize: 16.sp))))
              ]);
            }));
  }
}
