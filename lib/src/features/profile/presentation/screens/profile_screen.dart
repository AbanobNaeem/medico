import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:xpert/src/core/resources/assets_manager.dart';
import 'package:xpert/src/core/resources/color_manager.dart';
import 'package:xpert/src/core/resources/font_manager.dart';
import 'package:xpert/src/core/resources/strings_manager.dart';
import 'package:xpert/src/core/resources/styles_manager.dart';
import 'package:xpert/src/core/widgets/app_padding.dart';
import 'package:xpert/src/core/widgets/bottom_extend_app_bar.dart';
import 'package:xpert/src/core/widgets/default_app_bar.dart';
import 'package:xpert/src/features/profile/constants/profile_constants.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  late List<TextEditingController> profileController;

  @override
  void initState() {
    super.initState();
    profileController = List.generate(
      5,
      (index) => TextEditingController(
        text: profileTextFelidTempData[index],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(),
      body: _body(),
    );
  }

  PreferredSizeWidget? _appBar() {
    return DefaultAppBar(
      title: StringsManager.profile,
      centerTitle: true,
      actions: [
        Padding(
          padding: EdgeInsetsDirectional.only(end: 16.w),
          child: SvgPicture.asset(
            AssetsManager.setting,
          ),
        ),
      ],
    );
  }

  Widget _body() {
    return SizedBox(
      height: 0.8.sh,
      child: ListView(
        children: [
          _bottomExtendAppBar(),
          AppPaddingWidgetAll(
            child: _buildForm(),
          ),
        ],
      ),
    );
  }

  Widget _bottomExtendAppBar() {
    return BottomExtendAppBar(
      child: Column(
        children: [
          Expanded(
            flex: 3,
            child: _buildProfilePic(),
          ),
          Expanded(
            child: Text(
              "Tasnim Abdelmonaim",
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

  Widget _buildProfilePic() {
    return Center(
      child: CircleAvatar(
        radius: 75.r,
        backgroundImage: const AssetImage(AssetsManager.temp1),
      ),
    );
  }

  Widget _buildForm() {
    return Form(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: List.generate(5, (index) => _buildTextField(index)),
      ),
    );
  }

  Widget _buildTextField(int index) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          profileTextFelidTitles[index].toUpperCase(),
          style: StyleManager.getMediumStyle(
            color: ColorManager.mediumGray,
            fontSize: FontSize.s16,
          ),
        ),
        8.verticalSpace,
        TextFormField(
          style: StyleManager.getMediumStyle(
            fontSize: FontSize.s16,
          ),
          onTapOutside: (event) => FocusScope.of(context).unfocus(),
          controller: profileController[index],
          obscureText: index == 1 ? true : false,
        ),
        8.verticalSpace,
      ],
    );
  }

  @override
  void dispose() {
    for (var controller in profileController) {
      controller.dispose();
    }
    super.dispose();
  }
}
