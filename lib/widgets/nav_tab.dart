import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NavTab extends StatelessWidget {
  final bool isChecked;
  final IconData icon;
  final VoidCallback? onTap;

  const NavTab({super.key, this.isChecked = false, required this.icon, this.onTap});

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: GestureDetector(
            behavior: HitTestBehavior.translucent,
            onTap: onTap?.call,
            child: Column(mainAxisSize: MainAxisSize.min, crossAxisAlignment: CrossAxisAlignment.center, children: [
              Icon(icon, color: Colors.white, size: 20.r),
              Container(
                  margin: EdgeInsets.symmetric(vertical: 5.h),
                  color: isChecked ? Colors.white : Colors.transparent,
                  height: 2.h,
                  width: 30.w)
            ])));
  }
}
