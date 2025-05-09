import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:tiktok/global/icon_font.dart';
import 'package:tiktok/widgets/radius_inkwell_widget.dart';

import 'logic.dart';

class DiscoverPage extends StatelessWidget {
  DiscoverLogic get logic => Get.find<DiscoverLogic>();

  const DiscoverPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
            systemOverlayStyle: SystemUiOverlayStyle.dark,
            backgroundColor: const Color(0xffF6F6F6),
            titleSpacing: 0,
            title: RadiusInkWellWidget(
                color: Colors.white,
                radius: 4.r,
                margin: EdgeInsets.symmetric(horizontal: 10.w),
                child: Container(
                    height: kToolbarHeight - 20.h,
                    alignment: Alignment.center,
                    child: Row(mainAxisSize: MainAxisSize.min, children: [
                      Icon(IconFont.search, color: Colors.black, size: 16.r),
                      SizedBox(width: 3.w),
                      Text("search", style: TextStyle(color: Colors.black, fontSize: 15.sp))
                    ])),
                onPressed: () {})),
        body: Container());
  }
}
