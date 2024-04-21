import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:xpert/src/core/resources/assets_manager.dart';
import 'package:xpert/src/core/resources/color_manager.dart';
import 'package:xpert/src/core/resources/font_manager.dart';
import 'package:xpert/src/core/resources/strings_manager.dart';
import 'package:xpert/src/core/resources/styles_manager.dart';
import 'package:xpert/src/core/widgets/app_padding.dart';
import 'package:xpert/src/features/home/constants/doctors_list_constants.dart';
import 'package:xpert/src/features/home/presentation/widgets/calendar_lib/table_calendar.dart';
import 'package:xpert/src/features/home/presentation/widgets/gradient_button.dart';
import 'package:readmore/readmore.dart';

class AppointmentScreen extends StatelessWidget {
  const AppointmentScreen({
    super.key,
    required this.model,
  });
  final DoctorsListModel model;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.offWhite,
      appBar: _appBar(context),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            16.verticalSpace,
            _customListTile(),
            16.verticalSpace,
            _buildRow(),
            24.verticalSpace,
            AppPaddingWidgetHorizontal(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _label(StringsManager.aboutDoctors),
                  8.verticalSpace,
                  _readMoreText(),
                  24.verticalSpace,
                  _label(StringsManager.workingTime),
                  8.verticalSpace,
                  _bodyText("Mon - Sat (08:30 AM - 09:00PM)"),
                  24.verticalSpace,
                  _label(StringsManager.schedule),
                  16.verticalSpace,
                  const TableCalendarWidget(),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: _bottomNavigationBar(),
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
    );
  }

  Widget _customListTile() {
    return AppPaddingWidgetHorizontal(
      child: Row(
        children: [
          Container(
            width: 90.h,
            height: 90.h,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(model.image),
              ),
              shape: BoxShape.circle,
            ),
          ),
          16.horizontalSpace,
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                model.drName,
                style: StyleManager.getMediumStyle(fontSize: FontSize.s18),
              ),
              Row(
                children: [
                  SvgPicture.asset(AssetsManager.star),
                  5.horizontalSpace,
                  Text(
                    '4.9 (462 ${StringsManager.reviews})',
                    style: StyleManager.getRegularStyle(
                        fontSize: FontSize.s16, color: ColorManager.mediumGray),
                  ),
                ],
              ),
              Text(
                "${model.drSpecialty}. Asian Hospital",
                style: StyleManager.getRegularStyle(
                    fontSize: FontSize.s16, color: ColorManager.mediumGray),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _readMoreText() {
    return ReadMoreText(
      style: StyleManager.getRegularStyle(
        fontSize: FontSize.s16,
        color: ColorManager.mediumGray,
      ),
      'Doctor Ailla top specialist at Asian hospital at landon .She  has achieved awards and recognition this text for display only this text for display only this text for display only',
      trimMode: TrimMode.Line,
      trimLines: 3,
      trimCollapsedText: StringsManager.seeMore,
      trimExpandedText: StringsManager.seeLess,
      lessStyle: StyleManager.getSemiBoldStyle(
        fontSize: FontSize.s16,
        color: ColorManager.brightRed,
      ),
      moreStyle: StyleManager.getSemiBoldStyle(
        fontSize: FontSize.s16,
        color: ColorManager.primary,
      ),
    );
  }

  Widget _buildRow() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 8.w),
      child: Row(
        children: List.generate(
          appointmentList.length,
          (index) => _containerContent(
            model: appointmentList[index],
          ),
        ),
      ),
    );
  }

  Widget _container({Widget? child}) {
    return Container(
      width: 112.w,
      height: 114.h,
      margin: EdgeInsets.symmetric(horizontal: 6.w),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.25),
            offset: const Offset(0, 4),
            blurRadius: 4,
            spreadRadius: 0,
          ),
        ],
      ),
      child: child,
    );
  }

  Widget _containerContent({required AppointmentModel model}) {
    return Expanded(
      child: _container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            14.verticalSpace,
            Expanded(child: SvgPicture.asset(model.image)),
            Expanded(
              flex: 2,
              child: Column(
                children: [
                  Text(
                    model.text1,
                    style: StyleManager.getMediumStyle(fontSize: FontSize.s20),
                  ),
                  Text(
                    model.text2,
                    style: StyleManager.getRegularStyle(
                      fontSize: FontSize.s16,
                      color: ColorManager.mediumGray,
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _label(String text) {
    return Text(
      text,
      style: StyleManager.getMediumStyle(fontSize: FontSize.s18),
    );
  }

  Widget _bodyText(String text) {
    return Text(
      text,
      style: StyleManager.getRegularStyle(
          fontSize: FontSize.s16, color: ColorManager.mediumGray),
    );
  }

  Widget _bottomNavigationBar() {
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 30.w),
        child: GradientButton(
          height: 72.h,
          title: StringsManager.appointment,
          textStyle: StyleManager.getMediumStyle(
              fontSize: FontSize.s20, color: ColorManager.white),
        ),
      ),
    );
  }
}

class AppointmentModel {
  final String image;
  final String text1;
  final String text2;

  AppointmentModel({
    required this.image,
    required this.text1,
    required this.text2,
  });
}

List<AppointmentModel> appointmentList = [
  AppointmentModel(
      image: AssetsManager.people,
      text1: "1000+",
      text2: StringsManager.people),
  AppointmentModel(
      image: AssetsManager.experience,
      text1: "5 yr+",
      text2: StringsManager.experience),
  AppointmentModel(
      image: AssetsManager.yellowStar,
      text1: "4.9",
      text2: StringsManager.rating),
];
