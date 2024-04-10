import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:xpert/src/core/resources/color_manager.dart';
import 'package:xpert/src/core/resources/font_manager.dart';
import 'package:xpert/src/core/resources/strings_manager.dart';
import 'package:xpert/src/core/resources/styles_manager.dart';
import 'package:xpert/src/core/resources/utils.dart';

class CustomForgetCard extends StatelessWidget {
  const CustomForgetCard({
    super.key,
    required this.radioValue,
    this.radioGroupValue,
    this.radioOnChanged,
    this.title,
    required this.icon,
    this.subtitle,
    this.countryCode,
  });

  final String radioValue;
  final String? radioGroupValue;
  final void Function(String?)? radioOnChanged;
  final String? title;
  final String icon;
  final String? subtitle;
  final String? countryCode;

  @override
  Widget build(BuildContext context) {
    return _buildCardDetails();
  }

  Widget _buildCard({Widget? child}) {
    return Container(
      width: double.infinity,
      height: 102.h,
      decoration: BoxDecoration(
        border: Border.all(color: ColorManager.silver),
        borderRadius: BorderRadius.circular(5.r),
      ),
      child: child,
    );
  }

  Widget _buildCardDetails() {
    return _buildCard(
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 10.h),
        child: Row(
          children: [
            Radio(
              value: radioValue,
              groupValue: radioGroupValue,
              onChanged: radioOnChanged,
            ),
            SvgPicture.asset(icon),
            16.horizontalSpace,
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title ?? '',
                  style: StyleManager.getSemiBoldStyle(fontSize: FontSize.s16),
                ),
                8.verticalSpace,
                Text(
                  StringsManager.getPasswordCode,
                  style: StyleManager.getRegularStyle(fontSize: FontSize.s14),
                ),
                8.verticalSpace,
                Text(
                  obscureText(text: subtitle, countryCode: countryCode),
                  style: StyleManager.getRegularStyle(fontSize: FontSize.s14),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
