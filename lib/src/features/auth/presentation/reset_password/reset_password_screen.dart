import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:xpert/src/core/resources/color_manager.dart';
import 'package:xpert/src/core/resources/font_manager.dart';
import 'package:xpert/src/core/resources/strings_manager.dart';
import 'package:xpert/src/core/resources/styles_manager.dart';
import 'package:xpert/src/core/widgets/app_padding.dart';
import 'package:xpert/src/core/widgets/bottom_extend_app_bar.dart';
import 'package:xpert/src/core/widgets/default_app_bar.dart';

class ResetPassword extends StatelessWidget {
  const ResetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(),
      body: _buildBody(),
    );
  }

  PreferredSizeWidget? _appBar() {
    return DefaultAppBar(
      title: StringsManager.createNewPassword,
      fontSize: FontSize.s14,
    );
  }

  Widget _bottomExtendedAppBar() {
    return BottomExtendAppBar(
      height: 0.1.sh,
      child: Padding(
        padding: EdgeInsetsDirectional.only(start: 50.w),
        child: Text(
          StringsManager.resetPasswordDesc,
          style: StyleManager.getRegularStyle(
            fontSize: FontSize.s12,
            color: ColorManager.white,
          ),
        ),
      ),
    );
  }

  Widget _buildBody() {
    return Column(
      children: [
        _bottomExtendedAppBar(),
        AppPaddingWidgetHorizontal(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                16.verticalSpace,
                _buildForm(),
                32.verticalSpace,
                _buildButton()
              ],
            ),
          ),
        ),
      ],
    );
  }

  Form _buildForm() {
    return Form(
        child: Column(
      children: [
        _buildTextField(title: StringsManager.password),
        16.verticalSpace,
        _buildTextField(title: StringsManager.confirmPassword),
      ],
    ));
  }

  Widget _buildTextField({required String title}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: StyleManager.getMediumStyle(fontSize: FontSize.s16),
        ),
        16.verticalSpace,
        TextFormField(
          obscureText: true,
        ),
      ],
    );
  }

  Widget _buildButton() {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: () {},
        child: const Text(StringsManager.resetPassword),
      ),
    );
  }
}
