import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class EmptyPage extends StatelessWidget {
  final Color? bgColor;
  final double? height;
  final String? text;
  final VoidCallback? onRetry;
  final Widget? iconWidget;

  const EmptyPage({super.key, this.bgColor, this.height, this.text, this.onRetry, this.iconWidget});

  @override
  Widget build(BuildContext context) {
    return Material(
        color: bgColor ?? Theme.of(context).scaffoldBackgroundColor,
        child: LayoutBuilder(builder: (BuildContext context, BoxConstraints constraints) {
          return Container(
              constraints: BoxConstraints(maxHeight: constraints.maxHeight),
              height: height,
              child: Center(
                  child: SingleChildScrollView(
                      physics: const NeverScrollableScrollPhysics(),
                      child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
                        Container(
                            constraints: BoxConstraints(maxWidth: 200.w, maxHeight: 200.w),
                            margin: EdgeInsets.only(bottom: 15.w),
                            child: iconWidget ?? Image.asset("assets/images/empty.png")),
                        onRetry != null
                            ? TextButton(onPressed: onRetry, child: Text("点击刷新", style: TextStyle(fontSize: 16.sp)))
                            : Text(text ?? "暂无数据", style: TextStyle(color: const Color(0xff999999), fontSize: 16.sp))
                      ]))));
        }));
  }
}
