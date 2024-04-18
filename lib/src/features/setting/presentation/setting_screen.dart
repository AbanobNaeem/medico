import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:xpert/src/core/resources/assets_manager.dart';
import 'package:xpert/src/core/resources/color_manager.dart';
import 'package:xpert/src/core/resources/font_manager.dart';
import 'package:xpert/src/core/resources/route_manager.dart';
import 'package:xpert/src/core/resources/strings_manager.dart';
import 'package:xpert/src/core/resources/styles_manager.dart';
import 'package:xpert/src/core/widgets/app_padding.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(),
      body: _body(),
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
    return AppPaddingWidgetHorizontal(
      child: Column(
        children: [
          10.verticalSpace,
          Expanded(flex: 2, child: _buildFirstBox()),
          Expanded(flex: 3, child: _buildSceBox()),
          Expanded(flex: 3, child: _buildThirdBox()),
        ],
      ),
    );
  }

  Widget _bottomNavigationBar(context) {
    return Padding(
      padding: EdgeInsets.only(
        left: 0.3.sw,
        right: 0.3.sw,
        bottom: kBottomNavigationBarHeight + 0.05.sh,
      ),
      child: _logOut(context),
    );
  }

  Widget _buildFirstBox() {
    return Column(
      children: [
        _buildContainer(
          widget: Column(
            children: [
              _listTile(
                title: StringsManager.setting,
                icon: AssetsManager.setting,
                trailing: true,
              ),
              const Divider(),
              _listTile(
                title: StringsManager.editProfile,
                icon: AssetsManager.editProfileIc,
                trailing: true,
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildSceBox() {
    return Column(
      children: [
        _buildContainer(
          widget: Column(
            children: [
              _listTile(
                title: StringsManager.notifications,
                icon: AssetsManager.notificationsIc,
              ),
              const Divider(),
              _listTile(
                title: StringsManager.password,
                icon: AssetsManager.keyIc,
              ),
              const Divider(),
              _listTile(
                title: StringsManager.language,
                icon: AssetsManager.lang,
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildThirdBox() {
    return Column(
      children: [
        _buildContainer(
          widget: Column(
            children: [
              _listTile(
                title: StringsManager.country,
                icon: AssetsManager.location,
              ),
              const Divider(),
              _listTile(
                title: StringsManager.editEmail,
                icon: AssetsManager.email,
              ),
              const Divider(),
              _listTile(
                title: StringsManager.facebook,
                icon: AssetsManager.unfilledFacebookIc,
              ),
            ],
          ),
        ),
      ],
    );
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

  Widget _listTile({
    required String title,
    required String icon,
    bool? trailing,
  }) {
    return ListTile(
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

  Widget _logOut(context) {
    return ElevatedButton(
      onPressed: () {
        Navigator.pushNamedAndRemoveUntil(
            context, Routes.authTapBar, (route) => false);
      },
      style: ElevatedButton.styleFrom(
        fixedSize: Size(140.w, 60.h),
        backgroundColor: ColorManager.white,
        foregroundColor: ColorManager.black,
        shape: const OvalBorder(
          side: BorderSide(
            color: ColorManager.royalBlue,
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
