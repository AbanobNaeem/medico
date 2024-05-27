import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:xpert/src/core/resources/color_manager.dart';
import 'package:xpert/src/features/home/data/constants/home_constants.dart';

class SpecialistContainer extends StatelessWidget {
  const SpecialistContainer({
    super.key,
    required this.index,
  });
  final int index;

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
        color: ColorManager.primary,
        borderRadius: BorderRadius.circular(10.r),
      ),
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: _bodyText(context),
              ),
              Container(
                margin: EdgeInsetsDirectional.only(end: 5.w),
                child: Image.asset(
                  fit: BoxFit.fill,
                  width: 100.w,
                  height: 100.h,
                  SliderModel.sliderList[index].image,
                ),
              ),
            ],
          ),
          const Spacer(),
          _dotsIndicator(),
        ],
      ),
    );
  }

  Widget _bodyText(context) {
    return SizedBox(
      width: 195.w,
      height: 153.5.h,
      child: Padding(
        padding: EdgeInsetsDirectional.only(start: 20.w, top: 13.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              SliderModel.sliderList[index].desc,
              style: Theme.of(context).textTheme.labelLarge,
            ),
            18.verticalSpace,
            Text(
              SliderModel.sliderList[index].name ?? '',
              style: Theme.of(context).textTheme.labelLarge,
            ),
            Text(
              SliderModel.sliderList[index].speciality ?? '',
              style: Theme.of(context).textTheme.labelSmall,
            ),
          ],
        ),
      ),
    );
  }

  Widget _dotsIndicator() {
    return Center(
      child: DotsIndicator(
        mainAxisSize: MainAxisSize.min,
        dotsCount: 3,
        position: index,
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
