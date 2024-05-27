import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:xpert/src/core/resources/color_manager.dart';
import 'package:xpert/src/core/resources/font_manager.dart';
import 'package:xpert/src/core/resources/styles_manager.dart';
import 'package:xpert/src/features/onboarding/data/models.dart';
import 'package:xpert/src/features/onboarding/presentation/widgets/dots_indicator_widget.dart';

class OnBoardingDataWidget extends StatelessWidget {
  const OnBoardingDataWidget({super.key, required this.onboardingViewObject});

  final OnboardingViewObject onboardingViewObject;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 34.w),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // 16.verticalSpace,
          Expanded(
            flex: 3,
            child: _buildBackGroundImage(),
          ),
          // 40.verticalSpace,
          Expanded(flex: 1, child: _buildTitle()),
          // 24.verticalSpace,
          Expanded(flex: 1, child: _buildDescription()),
          // 32.verticalSpace,
          _dotsIndicatorWidget(),
        ],
      ),
    );
  }

  Widget _buildTitle() {
    final model = onboardingViewObject.onboardingModel;
    final buildDescription = Center(
      child: Text(
        model.title,
        textAlign: TextAlign.center,
        style: StyleManager.getBoldStyle(
          color: ColorManager.periwinkleBlue,
          fontSize: FontSize.s20,
        ),
      ),
    );
    return buildDescription;
  }

  Widget _buildDescription() {
    final model = onboardingViewObject.onboardingModel;
    final buildDescription = Text(
      model.description,
      textAlign: TextAlign.center,
      style: StyleManager.getMediumStyle(
        color: ColorManager.periwinkleBlue,
        fontSize: FontSize.s18,
      ),
    );
    return buildDescription;
  }

  Widget _dotsIndicatorWidget() {
    return Center(
      child: DotsIndicatorWidget(
        currentIndex: onboardingViewObject.currentIndex,
        dotsCount: onboardingViewObject.numOfScreens,
      ),
    );
  }

  Widget _buildBackGroundImage() {
    final model = onboardingViewObject.onboardingModel;
    return Center(
      child: SvgPicture.asset(model.image, fit: BoxFit.scaleDown),
    );
  }
}
