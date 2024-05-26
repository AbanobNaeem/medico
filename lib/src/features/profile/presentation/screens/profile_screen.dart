import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:xpert/src/core/resources/assets_manager.dart';
import 'package:xpert/src/core/resources/color_manager.dart';
import 'package:xpert/src/core/resources/constants.dart';
import 'package:xpert/src/core/resources/font_manager.dart';
import 'package:xpert/src/core/resources/route_manager.dart';
import 'package:xpert/src/core/resources/shared_preferences.dart';
import 'package:xpert/src/core/resources/strings_manager.dart';
import 'package:xpert/src/core/resources/styles_manager.dart';
import 'package:xpert/src/core/resources/utils.dart';
import 'package:xpert/src/core/widgets/app_padding.dart';
import 'package:xpert/src/core/widgets/bottom_extend_app_bar.dart';
import 'package:xpert/src/core/widgets/default_app_bar.dart';
import 'package:xpert/src/features/profile/business_logic/profile/profile_cubit.dart';
import 'package:xpert/src/features/profile/constants/profile_constants.dart';
import 'package:xpert/src/features/profile/data/models/profile_model.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  late List<TextEditingController> profileController;
  ProfileModel? model;

  @override
  void initState() {
    super.initState();

    _getData();
    _profileController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(),
      body: _bodyBloc(),
    );
  }

  PreferredSizeWidget? _appBar() {
    return DefaultAppBar(
      automaticallyImplyLeading: false,
      title: StringsManager.profile,
      centerTitle: true,
      actions: [
        Padding(
          padding: EdgeInsetsDirectional.only(end: 16.w),
          child: InkWell(
            onTap: () {
              RouteGenerator.navBarCubit.onTap(2);
            },
            child: SvgPicture.asset(
              AssetsManager.setting,
            ),
          ),
        ),
      ],
    );
  }

  Widget _bodyBloc() {
    return BlocConsumer<ProfileCubit, ProfileState>(
      listener: (context, state) {
        state.mapOrNull(
          getDoctorProfile: (state) {
            model = state.model;
          },
          getNurseProfile: (state) {
            model = state.model;
          },
          getUserProfile: (state) {
            model = state.model;
          },
          doctorProfileError: (state) {
            showErrorToast(state.error, context);
          },
          nurseProfileError: (state) {
            showErrorToast(state.error, context);
          },
          userProfileError: (state) {
            showErrorToast(state.error, context);
          },
        );
      },
      builder: (context, state) {
        if (state == const ProfileState.loading()) {
          return _twistingDots();
        } else if (model != null) {
          return _body(model!);
        } else {
          return const SizedBox();
        }
      },
    );
  }

  Widget _twistingDots() {
    return Center(
      child: LoadingAnimationWidget.twistingDots(
        leftDotColor: ColorManager.black,
        rightDotColor: ColorManager.primary,
        size: 100,
      ),
    );
  }

  Widget _body(ProfileModel model) {
    return SizedBox(
      height: 0.8.sh,
      child: ListView(
        children: [
          _bottomExtendAppBar(model),
          AppPaddingWidgetAll(
            child: _buildForm(model),
          ),
        ],
      ),
    );
  }

  Widget _bottomExtendAppBar(ProfileModel model) {
    return BottomExtendAppBar(
      child: Column(
        children: [
          Expanded(
            flex: 3,
            child: _buildProfilePic(model),
          ),
          Expanded(
            child: Text(
              model.username ?? '',
              style: StyleManager.getBoldStyle(
                fontSize: FontSize.s20,
                color: ColorManager.white,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildProfilePic(ProfileModel model) {
    return Center(
      child: CircleAvatar(
        radius: 75.r,
        backgroundImage: NetworkImage(model.profileImage!),
      ),
    );
  }

  Widget _buildForm(ProfileModel model) {
    return Form(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (profileType != AppConstants.userTypeUser)
            Text(
              StringsManager.aboutDoctors.toUpperCase(),
              style: StyleManager.getMediumStyle(
                color: ColorManager.mediumGray,
                fontSize: FontSize.s16,
              ),
            ),
          if (profileType != AppConstants.userTypeUser) 8.verticalSpace,
          if (profileType != AppConstants.userTypeUser)
            Container(
              padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 8.h),
              width: double.infinity,
              height: 150.h,
              decoration: BoxDecoration(
                color: ColorManager.primary,
                borderRadius: BorderRadius.circular(20.r),
              ),
              child: Text(
                // textAlign: TextAlign.center,
                model.description ?? '',
                style: StyleManager.getBoldStyle(
                  fontSize: FontSize.s20,
                  color: ColorManager.white,
                ),
              ),
            ),
          if (myType != AppConstants.userTypeNurse) 8.verticalSpace,
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: List.generate(profileTextFelidTitles.length,
                (index) => _buildTextField(index, model)),
          ),
        ],
      ),
    );
  }

  Widget _buildTextField(int index, ProfileModel model) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (getData(model)[index].isNotEmpty)
          Text(
            profileTextFelidTitles[index].toUpperCase(),
            style: StyleManager.getMediumStyle(
              color: ColorManager.mediumGray,
              fontSize: FontSize.s16,
            ),
          ),
        8.verticalSpace,
        if (getData(model)[index].isNotEmpty)
          TextFormField(
            decoration: InputDecoration(
              hintText: getData(model)[index],
              hintStyle: StyleManager.getMediumStyle(
                fontSize: FontSize.s16,
              ),
            ),
            onTapOutside: (event) => FocusScope.of(context).unfocus(),
            controller: profileController[index],
            obscureText: index == 1 ? true : false,
          ),
        8.verticalSpace,
      ],
    );
  }

  void _getData() {
    try {
      String type = CacheHelper.getData(key: AppConstants.myType);
      int id = CacheHelper.getData(key: AppConstants.myId);

      switch (type) {
        case AppConstants.userTypeDoctor:
          RouteGenerator.profileCubit.getDoctorProfile(id: id);
        case AppConstants.userTypeNurse:
          RouteGenerator.profileCubit.getNurseProfile(id: id);
        case AppConstants.userTypeUser:
          RouteGenerator.profileCubit.getUserProfile(id: id);
      }
    } catch (e) {
      log("$e");
    }
  }

  late String profileType;
  void _profileController() {
    try {
      profileType = CacheHelper.getData(key: AppConstants.myType);

      switch (profileType) {
        case AppConstants.userTypeDoctor:
          profileController = List.generate(
            8,
            (index) => TextEditingController(),
          );
        case AppConstants.userTypeNurse:
          profileController = List.generate(
            8,
            (index) => TextEditingController(),
          );
        case AppConstants.userTypeUser:
          profileController = List.generate(
            3,
            (index) => TextEditingController(),
          );
      }
    } catch (e) {
      log("$e");
    }
  }

  @override
  void dispose() {
    for (var controller in profileController) {
      controller.dispose();
    }
    super.dispose();
  }
}
