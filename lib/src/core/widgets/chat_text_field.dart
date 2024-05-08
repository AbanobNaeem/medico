import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:xpert/src/app/app.dart';
import 'package:xpert/src/core/resources/assets_manager.dart';
import 'package:xpert/src/core/resources/color_manager.dart';
import 'package:xpert/src/core/resources/font_manager.dart';
import 'package:xpert/src/core/resources/strings_manager.dart';
import 'package:xpert/src/core/resources/styles_manager.dart';

class ChatTextField extends StatelessWidget {
  const ChatTextField({
    super.key,
    this.controller,
    this.onSubmitted,
    this.suffixIcon,
    this.onTapOutside,
    this.focusNode,
    this.onSendWithPrefixIcon,
  });
  final TextEditingController? controller;
  final void Function(String)? onSubmitted;
  final Widget? suffixIcon;
  final void Function(PointerDownEvent)? onTapOutside;
  final void Function()? onSendWithPrefixIcon;

  final FocusNode? focusNode;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 311.w,
      height: 72.h,
      margin: EdgeInsets.only(top: 10.h),
      decoration: BoxDecoration(
        gradient: ColorManager.chatBotGradient,
        borderRadius: BorderRadius.circular(50.r),
      ),
      child: TextField(
        focusNode: focusNode,
        controller: controller,
        onTapOutside: onTapOutside ??
            (event) {
             FocusScope.of(navigatorKey.currentContext!).unfocus();
            },
        onSubmitted: onSubmitted,
        textInputAction: TextInputAction.send,
        style: StyleManager.getLightStyle(
          fontSize: FontSize.s16,
          color: ColorManager.white,
        ),
        cursorColor: ColorManager.white,
        decoration: InputDecoration(
          contentPadding:
              EdgeInsets.symmetric(horizontal: 23.w, vertical: 28.h),
          hintText: StringsManager.massage,
          hintStyle: StyleManager.getLightStyle(
            fontSize: FontSize.s16,
            color: ColorManager.white,
          ),
          suffixIconConstraints: BoxConstraints.loose(Size(67.w, 56.h)),
          suffixIcon: suffixIcon,
          prefixIconConstraints: BoxConstraints.loose(Size(56.w, 56.h)),
          prefixIcon: InkWell(
            onTap: onSendWithPrefixIcon,
            child: Padding(
              padding: EdgeInsetsDirectional.only(start: 10.w, end: 10.w),
              child: SvgPicture.asset(AssetsManager.send),
            ),
          ),
          icon: const SizedBox(),
          border: _borderStyle,
          enabledBorder: _borderStyle,
          disabledBorder: _borderStyle,
          errorBorder: _borderStyle,
          focusedBorder: _borderStyle,
          focusedErrorBorder: _borderStyle,
        ),
      ),
    );
  }

  InputBorder get _borderStyle => InputBorder.none;
}
