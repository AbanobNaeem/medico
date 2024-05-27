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
import 'package:xpert/src/core/resources/shared_preferences.dart';
import 'package:xpert/src/core/resources/strings_manager.dart';
import 'package:xpert/src/core/resources/styles_manager.dart';
import 'package:xpert/src/core/resources/utils.dart';
import 'package:xpert/src/core/widgets/app_padding.dart';
import 'package:xpert/src/core/widgets/default_button.dart';
import 'package:xpert/src/features/profile/business_logic/profile/profile_cubit.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({super.key});

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  late final TextEditingController? _oldPasswordController;
  late final TextEditingController? _newPasswordController;

  @override
  void initState() {
    super.initState();
    _oldPasswordController = TextEditingController();
    _newPasswordController = TextEditingController();
  }

  @override
  void dispose() {
    _oldPasswordController?.dispose();
    _newPasswordController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(),
      body: _body(context),
      bottomNavigationBar: _bottomNavigationBar(context),
    );
  }

  PreferredSizeWidget? _appBar() {
    return AppBar(
      title: const Text(StringsManager.setting),
      titleTextStyle: StyleManager.getMediumStyle(
        fontSize: FontSize.s18,
        color: ColorManager.black,
      ),
    );
  }

  Widget _body(context) {
    return BlocConsumer<ProfileCubit, ProfileState>(
      listener: (context, state) {
        state.mapOrNull(
          changePasswordSuccess: (state) {
            showSuccessToast("Password has been changed", context);
          },
          changePasswordError: (state) {
            showErrorToast(state.error, context);
          },
        );
      },
      builder: (context, state) {
        return AppPaddingWidgetHorizontal(
          child: Column(
            children: [
              10.verticalSpace,
              Expanded(flex: 2, child: _buildFirstBox(context)),
              // Expanded(flex: 3, child: _buildSceBox()),
              // Expanded(flex: 3, child: _buildThirdBox()),
            ],
          ),
        );
      },
    );
  }

  Widget _bottomNavigationBar(context) {
    return Padding(
      padding: EdgeInsets.only(
        left: 0.3.sw,
        right: 0.3.sw,
        bottom: kBottomNavigationBarHeight + 0.10.sh,
      ),
      child: _logOut(context),
    );
  }

  Widget _buildFirstBox(context) {
    return Column(
      children: [
        _buildContainer(
          widget: Column(
            children: [
              // _listTile(
              //   title: StringsManager.setting,
              //   icon: AssetsManager.setting,
              //   trailing: true,
              // ),
              // const Divider(),
              _listTile(
                title: StringsManager.editProfile,
                icon: AssetsManager.editProfileIc,
                trailing: true,
                onTap: () {
                  RouteGenerator.navBarCubit.onTap(3);
                },
              ),
              _listTile(
                title: StringsManager.password,
                icon: AssetsManager.keyIc,
                onTap: () {
                  // RouteGenerator.navBarCubit.onTap(3);
                  _dialogPassword(context);
                },
              ),
              _listTile(
                title: StringsManager.editEmail,
                icon: AssetsManager.email,
                onTap: () {
                  RouteGenerator.navBarCubit.onTap(3);
                },
              ),
            ],
          ),
        ),
      ],
    );
  }

  AwesomeDialog _dialogPassword(context) {
    return AwesomeDialog(
      context: context,
      dialogType: DialogType.infoReverse,
      animType: AnimType.rightSlide,
      padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            StringsManager.oldPassword.toUpperCase(),
            style: StyleManager.getMediumStyle(
              color: ColorManager.mediumGray,
              fontSize: FontSize.s16,
            ),
          ),
          TextFormField(
            controller: _oldPasswordController,
            onTapOutside: (event) => FocusScope.of(context).unfocus(),
          ),
          15.verticalSpace,
          Text(
            StringsManager.newPassword.toUpperCase(),
            style: StyleManager.getMediumStyle(
              color: ColorManager.mediumGray,
              fontSize: FontSize.s16,
            ),
          ),
          TextFormField(
            controller: _newPasswordController,
            onTapOutside: (event) => FocusScope.of(context).unfocus(),
          ),
          30.verticalSpace,
          Center(
            child: DefaultButton(
              width: 150.w,
              height: 50.h,
              onPressed: () {
                int id = CacheHelper.getData(key: AppConstants.myId);
                RouteGenerator.profileCubit.changePassword(
                  id: id,
                  oldPassword: _oldPasswordController!.text,
                  newPassword: _newPasswordController!.text,
                ).then((value) {
                  Navigator.of(context).pop();
                  _newPasswordController.clear();
                  _oldPasswordController.clear();
                },);
              },
              title: StringsManager.edit,
            ),
          ),
        ],
      ),
    )..show();
  }


  Widget _buildContainer({
    required Widget widget,
  }) {
    return Center(
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.r),
          border: Border.all(color: ColorManager.blushRed),
        ),
        child: widget,
      ),
    );
  }

  Widget _listTile(
      {required String title,
      required String icon,
      bool? trailing,
      void Function()? onTap}) {
    return ListTile(
      onTap: onTap,
      leading: SvgPicture.asset(
        icon,
        colorFilter: const ColorFilter.mode(
          ColorManager.black,
          BlendMode.srcIn,
        ),
      ),
      title: Text(title),
      trailing: trailing ?? false ? const Icon(Icons.arrow_forward_ios) : null,
    );
  }

  Future<void> _deleteUserDataBeforeLogOut() async {
    CacheHelper.removeData(key: AppConstants.myId);
    CacheHelper.removeData(key: AppConstants.myUserName);
    CacheHelper.removeData(key: AppConstants.myType);
  }

  Widget _logOut(context) {
    return ElevatedButton(
      onPressed: () {
        _deleteUserDataBeforeLogOut().then((value) {
          Navigator.pushNamedAndRemoveUntil(
              context, Routes.authTapBar, (route) => false);
        });
      },
      style: ElevatedButton.styleFrom(
        fixedSize: Size(140.w, 60.h),
        backgroundColor: ColorManager.white,
        foregroundColor: ColorManager.black,
        shape: const OvalBorder(
          side: BorderSide(
            color: ColorManager.primary,
          ),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(Icons.logout),
          9.horizontalSpace,
          Text(
            StringsManager.logout,
            style: StyleManager.getRegularStyle(
              fontSize: FontSize.s16,
              color: ColorManager.black,
            ),
          ),
        ],
      ),
    );
  }
}
