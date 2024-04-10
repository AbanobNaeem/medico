
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:xpert/src/core/resources/font_manager.dart';
import 'package:xpert/src/core/resources/strings_manager.dart';
import 'package:xpert/src/core/resources/styles_manager.dart';
import 'package:xpert/src/core/widgets/app_padding.dart';
import 'package:xpert/src/core/widgets/default_app_bar.dart';

class ResetPassword extends StatelessWidget {
  const ResetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const DefaultAppBar(),
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    return AppPaddingWidgetHorizontal(
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(StringsManager.createNewPassword,
                style: StyleManager.getMediumStyle(fontSize: FontSize.s14)),
            8.verticalSpace,
            Text(
              StringsManager.resetPasswordDesc,
              style: StyleManager.getRegularStyle(fontSize: FontSize.s12),
            ),
            16.verticalSpace,
            _buildForm(),
            32.verticalSpace,
            _buildButton()
          ],
        ),
      ),
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
