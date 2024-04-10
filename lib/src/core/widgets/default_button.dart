
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DefaultButton extends StatelessWidget {
  const DefaultButton({
    super.key,
    required this.title,
    this.width,
    this.onPressed,
    this.color,
    this.isLoading,
    this.padding,
    this.textStyle,
    this.height,
    this.fontSize,
  });

  final String title;
  final double? width;
  final double? height;
  final Color? color;
  final void Function()? onPressed;
  final bool? isLoading;
  final EdgeInsets? padding;
  final TextStyle? textStyle;
  final double? fontSize;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        fixedSize: Size(width ?? 311.w, height ?? 72.h),
      ),
      onPressed: onPressed,
      child: Center(
        child: isLoading == true
            ? SizedBox(
                height: 20.h,
                width: 20.h,
                child: CircularProgressIndicator(
                    color: Colors.white, strokeWidth: 1.5.w),
              )
            : Text(
                title,
                style: textStyle,
              ),
      ),
    );
  }
}
