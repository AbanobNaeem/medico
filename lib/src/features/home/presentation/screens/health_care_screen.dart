import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:xpert/src/core/resources/assets_manager.dart';
import 'package:xpert/src/core/resources/color_manager.dart';
import 'package:xpert/src/core/resources/font_manager.dart';
import 'package:xpert/src/core/resources/route_manager.dart';
import 'package:xpert/src/core/resources/strings_manager.dart';
import 'package:xpert/src/core/resources/styles_manager.dart';
import 'package:xpert/src/features/home/data/constants/doctors_list_constants.dart';

class HealthCareScreen extends StatelessWidget {
  const HealthCareScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.offWhite,
      appBar: _appBar(context),
      body: _body(),
    );
  }

  PreferredSizeWidget _appBar(context) {
    return AppBar(
      leading: IconButton(
        onPressed: () {
          Navigator.of(context).pop();
        },
        icon: const Icon(
          Icons.arrow_back_ios_new_rounded,
        ),
        iconSize: 20.h,
        color: ColorManager.black,
      ),
      title: const Text(StringsManager.healthCareTitle),
      actions: [
        Padding(
          padding: EdgeInsetsDirectional.only(end: 16.w),
          child: SvgPicture.asset(
            width: 17.w,
            height: 17.h,
            AssetsManager.searchIc,
            colorFilter: const ColorFilter.mode(
              ColorManager.black,
              BlendMode.srcIn,
            ),
          ),
        ),
      ],
    );
  }

  Widget _body() {
    return GridView.builder(
      padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 24.h),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 20.w,
        mainAxisSpacing: 16.h,
        mainAxisExtent: 0.23.sh,
      ),
      itemCount: doctorsList.length,
      itemBuilder: (context, index) => _containerBody(
        context,
        model: doctorsList[index],
      ),
    );
  }

  Widget _containerBody(
    context, {
    required DoctorsListModel model,
  }) {
    return _containerDecoration(
      child: Column(
        children: [
          8.verticalSpace,
          CircleAvatar(
            radius: 35.r,
            backgroundImage: AssetImage(model.image),
          ),
          4.verticalSpace,
          Text(
            model.drName,
            style: StyleManager.getRegularStyle(fontSize: FontSize.s16),
          ),
          Text(
            model.drSpecialty,
            style: StyleManager.getRegularStyle(fontSize: FontSize.s16),
          ),
          9.verticalSpace,
          ElevatedButton(
            onPressed: () {
              Navigator.pushNamed(context, Routes.appointmentScreen,
                  arguments: {
                    "model": model,
                  });
            },
            style: ElevatedButton.styleFrom(
              fixedSize: Size(132.w, 38.h),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(50.r),
              ),
              elevation: 0,
              foregroundColor: ColorManager.black,
              backgroundColor: ColorManager.offWhite,
            ),
            child: Text(StringsManager.appointment,
                style: StyleManager.getSemiBoldStyle(
                  fontSize: FontSize.s14,
                )),
          ),
        ],
      ),
    );
  }

  Widget _containerDecoration({Widget? child}) {
    return Container(
      clipBehavior: Clip.antiAliasWithSaveLayer,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.r),
        color: Colors.white,
        boxShadow: const [
          BoxShadow(
            color: Color.fromRGBO(0, 0, 0, 0.25),
            offset: Offset(0, 4),
            blurRadius: 4,
            spreadRadius: 0,
          ),
        ],
      ),
      child: child,
    );
  }
}
