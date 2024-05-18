import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:xpert/src/core/resources/assets_manager.dart';
import 'package:xpert/src/core/resources/color_manager.dart';
import 'package:xpert/src/core/resources/constants.dart';
import 'package:xpert/src/core/resources/font_manager.dart';
import 'package:xpert/src/core/resources/route_manager.dart';
import 'package:xpert/src/core/resources/strings_manager.dart';
import 'package:xpert/src/core/resources/styles_manager.dart';
import 'package:xpert/src/core/resources/utils.dart';
import 'package:xpert/src/features/home/business_logic/home_cubit/home_cubit.dart';

class DropDownMenuWidget extends StatefulWidget {
  const DropDownMenuWidget({super.key});

  @override
  State<DropDownMenuWidget> createState() => _DropDownMenuWidgetState();
}

class _DropDownMenuWidgetState extends State<DropDownMenuWidget> {
  String? gov;
  String? speciality;
  @override
  Widget build(BuildContext context) {
    return _buildBloc();
  }

  Widget _buildBloc() {
    return BlocConsumer<HomeCubit, HomeState>(
      listener: (context, state) {
        state.mapOrNull(
          getDoctorError: (state) {
            if (gov == null) {
              showErrorToast("Enter Governorate", context);
            } else if (speciality == null) {
              showErrorToast("Enter Speciality", context);
            } else {
              showErrorToast(state.networkExceptions, context);
            }
          },
        );
      },
      builder: (context, state) {
        return _body();
      },
    );
  }

  Widget _body() {
    return Padding(
      padding: EdgeInsetsDirectional.only(end: 16.w),
      child: PopupMenuButton<int>(
        clipBehavior: Clip.antiAliasWithSaveLayer,
        color: ColorManager.primary,
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.r)),
        icon: SvgPicture.asset(
          AssetsManager.searchIc,
          width: 17.w,
          height: 17.h,
          colorFilter: const ColorFilter.mode(
            ColorManager.black,
            BlendMode.srcIn,
          ),
        ),
        itemBuilder: (context) => [
          PopupMenuItem<int>(
            padding: EdgeInsets.symmetric(horizontal: 50.w, vertical: 20.h),
            value: 0,
            child: Text(
              StringsManager.governorate,
              style: StyleManager.getMediumStyle(
                fontSize: FontSize.s16,
                color: Colors.white,
              ),
            ),
          ),
          PopupMenuItem<int>(
            padding: EdgeInsets.symmetric(horizontal: 50.w, vertical: 20.h),
            value: 1,
            child: Text(
              StringsManager.specialty,
              style: StyleManager.getMediumStyle(
                fontSize: FontSize.s16,
                color: Colors.white,
              ),
            ),
          ),
        ],
        onSelected: (value) {
          if (value == 0) {
            _governorate();
          } else if (value == 1) {
            _speciality();
          }
        },
      ),
    );
  }

  AwesomeDialog _governorate() {
    return AwesomeDialog(
      context: context,
      dialogType: DialogType.noHeader,
      animType: AnimType.rightSlide,
      padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
      body: Column(
        children: List.generate(
          AppConstants.governorate.length,
          (index) => ListTile(
            onTap: () {
              setState(() {
                gov = AppConstants.governorate[index];
              });
              RouteGenerator.homeCubit.getDoctor(
                  speciality: speciality ?? 'null', governorate: gov ?? 'null');
              Navigator.pop(context);
            },
            title: Text(
              AppConstants.governorate[index],
            ),
          ),
        ),
      ),
    )..show();
  }

  AwesomeDialog _speciality() {
    return AwesomeDialog(
      context: context,
      dialogType: DialogType.noHeader,
      animType: AnimType.rightSlide,
      padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
      body: Column(
        children: List.generate(
          AppConstants.speciality.length,
          (index) => ListTile(
            onTap: () {
              setState(() {
                speciality = AppConstants.speciality[index];
              });
              RouteGenerator.homeCubit.getDoctor(
                  speciality: speciality ?? 'null', governorate: gov ?? 'null');

              Navigator.pop(context);
            },
            title: Text(
              AppConstants.speciality[index],
            ),
          ),
        ),
      ),
    )..show();
  }
}
