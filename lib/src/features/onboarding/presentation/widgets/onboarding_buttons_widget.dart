
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:xpert/src/core/resources/color_manager.dart';
import 'package:xpert/src/core/resources/font_manager.dart';
import 'package:xpert/src/core/resources/strings_manager.dart';
import 'package:xpert/src/core/resources/styles_manager.dart';
import 'package:xpert/src/features/onboarding/data/models.dart';

class OnboardingButtonsWidget extends StatelessWidget {
  const OnboardingButtonsWidget({
    super.key,
    required this.onNextTap,
    required this.onSkipTap,
    required this.onboardingViewObject,
  });

  final void Function()? onNextTap;
  final void Function()? onSkipTap;
  final OnboardingViewObject onboardingViewObject;

  @override
  Widget build(BuildContext context) {
    final currentIndex = onboardingViewObject.currentIndex;
    final listLength = onboardingViewObject.numOfScreens;
    return Column(
      children: [
        _buildNextButton(context),
        if (currentIndex != listLength - 1) _buildSkipButton(context),
      ],
    );
  }

  Widget _buildNextButton(context) {
    final currentIndex = onboardingViewObject.currentIndex;
    final listLength = onboardingViewObject.numOfScreens;
    return ElevatedButton(
      onPressed: onNextTap,
      style: ElevatedButton.styleFrom(
        fixedSize: Size(227.w, 48.h),
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.r)),
        backgroundColor: ColorManager.periwinkleBlue,
        foregroundColor: Colors.white,
        textStyle: StyleManager.getRegularStyle(
          fontSize: FontSize.s20,
          color: ColorManager.white,
        ),
      ),
      child: currentIndex != listLength - 1
          ? const Text(StringsManager.continueWord)
          : const Text(StringsManager.getStart),
    );
  }

  Widget _buildSkipButton(context) {
    return TextButton(
      onPressed: onSkipTap,
      child: Text(
        StringsManager.skip,
        style: StyleManager.getRegularStyle(
          fontSize: FontSize.s18,
        ),
      ),
    );
  }
}
