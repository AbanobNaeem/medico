import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:xpert/src/core/resources/assets_manager.dart';
import 'package:xpert/src/core/resources/color_manager.dart';
import 'package:xpert/src/core/resources/strings_manager.dart';

class SpecialistContainer extends StatelessWidget {
  const SpecialistContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return _specialistContainer(context);
  }

  Widget _specialistContainer(context) {
    return Container(
      clipBehavior: Clip.antiAlias,
      width: 343.w,
      height: 158.h,
      padding: EdgeInsets.only(bottom: 9.h),
      decoration: BoxDecoration(
        color: ColorManager.royalBlue,
        borderRadius: BorderRadius.circular(10.r),
      ),
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: _bodyText(context),
              ),
              Image.asset(AssetsManager.doctorPic),
            ],
          ),
          const Spacer(),
          _dotsIndicator(),
        ],
      ),
    );
  }

  Widget _bodyText(context) {
    return Padding(
      padding: EdgeInsetsDirectional.only(start: 20.w, top: 13.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            StringsManager.specialistDesc1,
            style: Theme.of(context).textTheme.labelLarge,
          ),
          18.verticalSpace,
          Text(
            StringsManager.specialistDrName1,
            style: Theme.of(context).textTheme.labelLarge,
          ),
          Text(
            StringsManager.specialist1,
            style: Theme.of(context).textTheme.labelSmall,
          ),
        ],
      ),
    );
  }

  Widget _dotsIndicator() {
    return Center(
      child: DotsIndicator(
        mainAxisSize: MainAxisSize.min,
        dotsCount: 3,
        position: 0,
        decorator: DotsDecorator(
          spacing: EdgeInsets.symmetric(horizontal: 7.w),
          activeColor: ColorManager.white,
          color: ColorManager.silver,
          activeSize: Size(8.w, 8.h),
          size: Size(8.w, 8.h),
        ),
      ),
    );
  }
}
