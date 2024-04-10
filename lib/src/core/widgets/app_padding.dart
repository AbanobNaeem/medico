import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class AppPaddingWidgetHorizontal extends StatelessWidget {
  const AppPaddingWidgetHorizontal({
    super.key,
    this.child,
  });
  final Widget? child;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: child,
    );
  }
}

class AppPaddingWidgetVertical extends StatelessWidget {
  const AppPaddingWidgetVertical({
    super.key,
    this.child,
  });
  final Widget? child;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 16.h),
      child: child,
    );
  }
}

class AppPaddingWidgetOnly extends StatelessWidget {
  const AppPaddingWidgetOnly({
    super.key,
    this.child,
    this.top,
    this.bottom,
    this.left,
    this.right,
  });
  final Widget? child;
  final double? top, bottom, left, right;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        top: top ?? 16.h,
        bottom: bottom ?? 16.h,
        left: left ?? 16.w,
        right: right ?? 16.w,
      ),
      child: child,
    );
  }
}

class AppPaddingWidgetAll extends StatelessWidget {
  const AppPaddingWidgetAll({
    super.key,
    this.child,
  });
  final Widget? child;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
      child: child,
    );
  }
}
