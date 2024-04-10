import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:xpert/src/core/resources/color_manager.dart';
import 'package:dots_indicator/dots_indicator.dart';

class DotsIndicatorWidget extends StatelessWidget {
  const DotsIndicatorWidget(
      {super.key, required this.currentIndex, required this.dotsCount});
  final int currentIndex;
  final int dotsCount;

  @override
  Widget build(BuildContext context) {
    return DotsIndicator(
      mainAxisSize: MainAxisSize.min,
      dotsCount: dotsCount,
      position: currentIndex,
      decorator: DotsDecorator(
        activeColor: ColorManager.periwinkleBlue,
        color: ColorManager.lightGrey,
        activeSize: Size(15.w, 15.h),
        size: Size(15.w, 15.h),
      ),
    );
  }
}
