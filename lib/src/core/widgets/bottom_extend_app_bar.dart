import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:xpert/src/core/resources/color_manager.dart';

class BottomExtendAppBar extends StatelessWidget {
  const BottomExtendAppBar({
    super.key,
    this.height,
    this.child,
    this.width,
  });

  final double? height;
  final double? width;
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height ?? 0.3.sh,
      width: width ?? 1.sw,
      decoration: BoxDecoration(
        color: ColorManager.primary,
        borderRadius: BorderRadiusDirectional.only(
          bottomStart: Radius.circular(50.r),
        ),
      ),
      child: child,
    );
  }
}
