import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

/// 带圆角点击渐变的布局view
class RadiusInkWellWidget extends StatelessWidget {
  // 圆角半径
  final double? radius;

  final BorderRadiusGeometry? borderRadius;

  final double elevation;
  final GestureTapCallback? onDoubleTap;

  // 颜色
  final Color? color;
  final Widget child;
  final VoidCallback? onPressed;

  final BoxBorder? border;

  final GestureTapDownCallback? onTapDown;
  final GestureLongPressCallback? onLongPress;
  final GestureTapCancelCallback? onTapCancel;

  final EdgeInsetsGeometry? margin;

  final EdgeInsetsGeometry? padding;

  final List<BoxShadow>? boxShadow;

  final bool showShadow;

  final Color? shadowColor;

  final List<Color> colors;

  final AlignmentGeometry begin;

  final AlignmentGeometry end;

  const RadiusInkWellWidget({
    super.key,
    required this.child,
    this.radius,
    this.borderRadius,
    this.color,
    required this.onPressed,
    this.border,
    this.onTapDown,
    this.onLongPress,
    this.onTapCancel,
    this.margin = EdgeInsets.zero,
    this.padding = EdgeInsets.zero,
    this.showShadow = false,
    this.boxShadow,
    this.shadowColor,
    this.onDoubleTap,
    this.colors = const [],
    this.begin = Alignment.topCenter,
    this.end = Alignment.bottomCenter,
    this.elevation = 0,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: margin,
        decoration: BoxDecoration(
            boxShadow: showShadow
                ? boxShadow ??
                    [
                      BoxShadow(
                          blurRadius: 15, // 阴影模糊程度
                          spreadRadius: 1, // 阴影扩散程度
                          offset: const Offset(0, 10), // 阴影xy轴偏移量
                          color: shadowColor ?? Theme.of(context).shadowColor)
                    ]
                : [],
            border: border,
            borderRadius: borderRadius ?? BorderRadius.circular((radius ?? 15.r) + 1)),
        child: ClipRRect(
            borderRadius: borderRadius as BorderRadius? ?? BorderRadius.circular(radius ?? 15.r),
            child: Material(
                elevation: elevation,
                color: colors.isNotEmpty
                    ? Colors.transparent
                    : color ?? (onPressed == null ? const Color(0xffcfcfcf) : Theme.of(context).primaryColor),
                child: Ink(
                    decoration: BoxDecoration(
                        borderRadius: borderRadius ?? BorderRadius.circular(radius ?? 15.r),
                        gradient: colors.isNotEmpty ? LinearGradient(colors: colors, begin: begin, end: end) : null),
                    child: InkWell(
                        onLongPress: onLongPress,
                        onTapCancel: onTapCancel,
                        onTapDown: onTapDown,
                        onDoubleTap: onDoubleTap,
                        borderRadius: borderRadius as BorderRadius? ?? BorderRadius.circular(radius ?? 15.r),
                        onTap: onPressed,
                        child: Padding(padding: padding!, child: child))))));
  }
}
