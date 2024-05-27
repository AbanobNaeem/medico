import 'dart:developer';
import 'dart:io';

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:image_picker/image_picker.dart';
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
import 'package:xpert/src/core/widgets/default_button.dart';
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

  late final TextEditingController _usernameController;
  late final TextEditingController _descController;
  ProfileModel? model;

  ImagePicker? _imagePicker;

  @override
  void initState() {
    super.initState();
    _imagePicker = ImagePicker();
    _usernameController = TextEditingController();
    _descController = TextEditingController();

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
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                model.username ?? '',
                style: StyleManager.getBoldStyle(
                  fontSize: FontSize.s20,
                  color: ColorManager.white,
                ),
              ),
              IconButton(
                onPressed: () {
                  _dialog();
                },
                icon: const Icon(
                  Icons.edit,
                  color: ColorManager.white,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  AwesomeDialog _dialog() {
    return AwesomeDialog(
      context: context,
      dialogType: DialogType.infoReverse,
      animType: AnimType.rightSlide,
      padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
      body: Column(
        children: [
          TextFormField(
            controller: _usernameController,
            onTapOutside: (event) => FocusScope.of(context).unfocus(),
            decoration: InputDecoration(
              hintText: model?.username ?? '',
              hintStyle: StyleManager.getBoldStyle(
                fontSize: FontSize.s20,
              ),
            ),
          ),
          30.verticalSpace,
          DefaultButton(
            width: 150.w,
            height: 50.h,
            onPressed: () async {
              try {
                profileType = CacheHelper.getData(key: AppConstants.myType);
                int id = CacheHelper.getData(key: AppConstants.myId);

                switch (profileType) {
                  case AppConstants.userTypeDoctor:
                    RouteGenerator.profileCubit
                        .updateDoctorUsername(
                            id: id, newUsername: _usernameController.text)
                        .then(
                      (value) {
                        Navigator.pop(context);
                        _getData();
                      },
                    );

                  case AppConstants.userTypeNurse:
                    RouteGenerator.profileCubit
                        .updateNurseUsername(
                            id: id, newUsername: _usernameController.text)
                        .then(
                      (value) {
                        Navigator.pop(context);
                        _getData();
                      },
                    );

                  case AppConstants.userTypeUser:
                    RouteGenerator.profileCubit
                        .updateUserUsername(
                            id: id, newUsername: _usernameController.text)
                        .then(
                      (value) {
                        Navigator.pop(context);
                        _getData();
                      },
                    );
                }
              } catch (e) {
                showErrorToast(e.toString(), context);
              }
            },
            title: StringsManager.edit,
          ),
        ],
      ),
    )..show();
  }

  AwesomeDialog _dialogDesc() {
    return AwesomeDialog(
      context: context,
      dialogType: DialogType.infoReverse,
      animType: AnimType.rightSlide,
      padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
      body: Column(
        children: [
          TextFormField(
            controller: _descController,
            onTapOutside: (event) => FocusScope.of(context).unfocus(),
            decoration: InputDecoration(
              hintText: model?.description ?? '',
              hintStyle: StyleManager.getBoldStyle(
                fontSize: FontSize.s20,
              ),
            ),
          ),
          30.verticalSpace,
          DefaultButton(
            width: 150.w,
            height: 50.h,
            onPressed: () async {
              try {
                profileType = CacheHelper.getData(key: AppConstants.myType);
                int id = CacheHelper.getData(key: AppConstants.myId);

                switch (profileType) {
                  case AppConstants.userTypeDoctor:
                    RouteGenerator.profileCubit
                        .updateDoctorDescription(
                            id: id, description: _descController.text)
                        .then(
                      (value) {
                        Navigator.pop(context);
                        _getData();
                      },
                    );

                  case AppConstants.userTypeNurse:
                    RouteGenerator.profileCubit
                        .updateNurseDescription(
                            id: id, description: _descController.text)
                        .then(
                      (value) {
                        Navigator.pop(context);
                        _getData();
                      },
                    );
                }
              } catch (e) {
                showErrorToast(e.toString(), context);
              }
            },
            title: StringsManager.edit,
          ),
        ],
      ),
    )..show();
  }

  Widget _buildProfilePic(ProfileModel model) {
    return Center(
      child: Stack(
        alignment: Alignment.bottomRight,
        children: [
          CircleAvatar(
            radius: 75.r,
            backgroundImage:
                CachedNetworkImageProvider(model.profileImage ?? ''),
          ),
          IconButton(
            onPressed: _openGallery,
            icon: const Icon(
              size: 35,
              Icons.camera_alt_rounded,
              color: ColorManager.white,
            ),
          ),
        ],
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
            InkWell(
              onTap: () {
                _dialogDesc();
              },
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 8.h),
                width: double.infinity,
                height: 150.h,
                decoration: BoxDecoration(
                  color: ColorManager.primary,
                  borderRadius: BorderRadius.circular(20.r),
                ),
                child: Text(
                  model.description ?? '',
                  style: StyleManager.getBoldStyle(
                    fontSize: FontSize.s20,
                    color: ColorManager.white,
                  ),
                ),
              ),
            ),
          if (myType != AppConstants.userTypeUser) 8.verticalSpace,
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
        if (getData(model)[index].isNotEmpty) 8.verticalSpace,
        if (getData(model)[index].isNotEmpty)
          TextFormField(
            keyboardType:
                profileTextFelidTitles[index] == StringsManager.yourPhone
                    ? TextInputType.phone
                    : TextInputType.text,
            textInputAction: TextInputAction.send,
            onFieldSubmitted: (value) {
              try {
                profileType = CacheHelper.getData(key: AppConstants.myType);
                int id = CacheHelper.getData(key: AppConstants.myId);

                switch (profileType) {
                  case AppConstants.userTypeDoctor:
                    switch (profileTextFelidTitles[index]) {
                      case StringsManager.yourPhone:
                        RouteGenerator.profileCubit
                            .updateDoctorPhoneNum(
                                id: id, phoneNum: profileController[index].text)
                            .then(
                          (value) {
                            _getData();
                          },
                        );
                      case StringsManager.workingTime:
                        RouteGenerator.profileCubit
                            .updateDoctorWorkTime(
                                id: id, workTime: profileController[index].text)
                            .then(
                          (value) {
                            _getData();
                          },
                        );

                      case StringsManager.address:
                        RouteGenerator.profileCubit
                            .updateDoctorAddress(
                                id: id, address: profileController[index].text)
                            .then(
                          (value) {
                            _getData();
                          },
                        );

                      case StringsManager.governorates:
                        RouteGenerator.profileCubit
                            .updateDoctorGovernorates(
                                id: id,
                                governorates: profileController[index].text)
                            .then(
                          (value) {
                            _getData();
                          },
                        );

                      case StringsManager.speciality:
                        RouteGenerator.profileCubit
                            .updateDoctorSpeciality(
                                id: id,
                                speciality: profileController[index].text)
                            .then(
                          (value) {
                            _getData();
                          },
                        );
                    }
                  case AppConstants.userTypeNurse:
                    switch (profileTextFelidTitles[index]) {
                      case StringsManager.yourPhone:
                        RouteGenerator.profileCubit
                            .updateNursePhoneNum(
                                id: id, phoneNum: profileController[index].text)
                            .then(
                          (value) {
                            _getData();
                          },
                        );
                      case StringsManager.workingTime:
                        RouteGenerator.profileCubit
                            .updateNurseWorkTime(
                                id: id, workTime: profileController[index].text)
                            .then(
                          (value) {
                            _getData();
                          },
                        );

                      case StringsManager.priceperhour:
                        RouteGenerator.profileCubit
                            .updateNursePriceperhour(
                                id: id,
                                priceperhour: profileController[index].text)
                            .then(
                          (value) {
                            _getData();
                          },
                        );

                      case StringsManager.governorates:
                        RouteGenerator.profileCubit
                            .updateNurseGovernorates(
                                id: id,
                                governorates: profileController[index].text)
                            .then(
                          (value) {
                            _getData();
                          },
                        );

                      case StringsManager.speciality:
                        RouteGenerator.profileCubit
                            .updateNurseSpeciality(
                                id: id,
                                speciality: profileController[index].text)
                            .then(
                          (value) {
                            _getData();
                          },
                        );
                    }
                }
              } catch (e) {
                log("$e");
              }
            },
            decoration: InputDecoration(
              hintText: getData(model)[index],
              hintStyle: StyleManager.getMediumStyle(
                fontSize: FontSize.s16,
              ),
            ),
            onTapOutside: (event) => FocusScope.of(context).unfocus(),
            enabled: profileTextFelidTitles[index] == StringsManager.yourEmail
                ? false
                : true,
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

  Future _openGallery() async {
    int myId = CacheHelper.getData(key: AppConstants.myId);
    final returnImage =
        await _imagePicker?.pickImage(source: ImageSource.gallery);
    if (returnImage == null) return;
    final image = File(returnImage.path);
    RouteGenerator.profileCubit.addImage(id: myId, image: image).then(
      (value) {
        _getData();
      },
    );
  }

  @override
  void dispose() {
    _usernameController.dispose();
    _descController.dispose();
    for (var controller in profileController) {
      controller.dispose();
    }
    super.dispose();
  }
}
