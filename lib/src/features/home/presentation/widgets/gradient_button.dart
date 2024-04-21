import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:xpert/src/core/resources/color_manager.dart';
import 'package:xpert/src/core/resources/styles_manager.dart';

class GradientButton extends StatelessWidget {
  const GradientButton({
    super.key,
    required this.title,
    this.width,
    this.onPressed,
    this.color,
    this.isLoading,
    this.padding,
    this.textStyle,
    this.height,
  });

  final String title;
  final double? width;
  final double? height;
  final Color? color;
  final void Function()? onPressed;
  final bool? isLoading;
  final EdgeInsets? padding;
  final TextStyle? textStyle;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      borderRadius: BorderRadius.circular(50.r),
      child: Container(
        width: width,
        height: height,
        padding: padding ?? EdgeInsets.symmetric(vertical: 15.h),
        decoration: BoxDecoration(
            gradient: color == null ? ColorManager.chatBotGradient : null,
            color: color,
            borderRadius: BorderRadius.circular(50.r)),
        child: Center(
          child: isLoading == true
              ? SizedBox(
                  height: 20.h,
                  width: 20.h,
                  child: CircularProgressIndicator(
                      color: Colors.white, strokeWidth: 1.5.w))
              : Text(
                  title,
                  style: textStyle ??
                      StyleManager.getSemiBoldStyle(
                        color: Colors.white,
                        fontSize: 14.spMin,
                      ),
                ),
        ),
      ),
    );
  }
}
