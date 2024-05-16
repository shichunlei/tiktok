import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class PostVideoButton extends StatelessWidget {
  const PostVideoButton({super.key, required this.inverted});

  final bool inverted;

  @override
  Widget build(BuildContext context) {
    return Stack(clipBehavior: Clip.none, children: [
      Positioned(
          right: 20,
          child: Container(
              height: 30,
              width: 25,
              padding: EdgeInsets.symmetric(horizontal: 8.r),
              decoration: BoxDecoration(color: const Color(0xff61D4F0), borderRadius: BorderRadius.circular(8.r)))),
      Positioned(
          left: 20,
          child: Container(
              height: 30,
              width: 25,
              padding: EdgeInsets.symmetric(horizontal: 8.r),
              decoration:
                  BoxDecoration(color: Theme.of(context).primaryColor, borderRadius: BorderRadius.circular(8.r)))),
      Container(
          height: 30,
          padding: EdgeInsets.symmetric(horizontal: 12.w),
          decoration:
              BoxDecoration(color: !inverted ? Colors.white : Colors.black, borderRadius: BorderRadius.circular(6.r)),
          child: Center(child: FaIcon(FontAwesomeIcons.plus, color: inverted ? Colors.white : Colors.black, size: 18)))
    ]);
  }
}
