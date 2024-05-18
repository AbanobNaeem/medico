//!project imports
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
import 'package:xpert/src/core/widgets/default_button.dart';
import 'package:xpert/src/features/auth/presentation/login_n_signup/widgets/social_buttons.dart';

class AuthScreen extends StatelessWidget {
  const AuthScreen({
    super.key,
    required this.title,
    required this.email,
    required this.password,
    this.userName,
    required this.isLoading,
  });

  final String title;
  final TextEditingController email;
  final TextEditingController password;
  final TextEditingController? userName;
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          if (_isLogIn()) _logInImage(),
          if (_isSignUp()) _decoration(),
          15.verticalSpace,
          AppPaddingWidgetHorizontal(
            child: Column(
              children: [
                _buildForm(),
                if (_isLogIn()) _buildTextButton(context),
                if (_isSignUp()) 32.verticalSpace,
                _buildButton(context),
                24.verticalSpace,
                _buildSocialMediaDivider(),
                24.verticalSpace,
                _buildSocialMediaButtons()
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _decoration() {
    return Container(
      height: 0.05.sh,
      decoration: BoxDecoration(
        color: ColorManager.primary,
        borderRadius: BorderRadiusDirectional.only(
          bottomStart: Radius.circular(50.r),
        ),
      ),
    );
  }

  Widget _logInImage() {
    return Container(
      height: 0.28.sh,
      decoration: BoxDecoration(
          color: ColorManager.primary,
          borderRadius: BorderRadiusDirectional.only(
            bottomStart: Radius.circular(50.r),
          )),
      child: Center(
        child: SvgPicture.asset(AssetsManager.loginBackGround),
      ),
    );
  }

  Widget _buildForm() {
    return Form(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (_isSignUp())
            _buildTextField(
              controller: userName,
              title: StringsManager.fullName,
            ),
          13.verticalSpace,
          _buildTextField(
            controller: email,
            title: StringsManager.email,
          ),
          13.verticalSpace,
          if (_isSignUp())
            _buildTextField(
              title: StringsManager.phoneNumber,
            ),
          13.verticalSpace,
          _buildTextField(
            controller: password,
            title: StringsManager.password,
            obscureText: true,
          ),
        ],
      ),
    );
  }

  Widget _buildTextField(
      {required String title,
      bool? obscureText,
      TextEditingController? controller}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: StyleManager.getMediumStyle(fontSize: FontSize.s16),
        ),
        16.verticalSpace,
        TextFormField(
          controller: controller,
          obscureText: obscureText ?? false,
        ),
      ],
    );
  }

  Widget _buildTextButton(context) {
    return Align(
      alignment: Alignment.bottomRight,
      child: TextButton(
        onPressed: () {
          Navigator.pushNamed(context, Routes.forgotPassword, arguments: {
            'email': 'husseina825@yahoo.com',
            'countryCode': '+20',
            'phoneNumber': '01020819879',
          });
        },
        child: const Text(StringsManager.forgetPassword),
      ),
    );
  }

  Widget _buildButton(context) {
    return DefaultButton(
      isLoading: isLoading,
      title: _isSignUp() ? StringsManager.signUp : StringsManager.login,
      onPressed: () {
        RouteGenerator.authLogicCubit.logIn(
          email: email.text,
          password: password.text,
        );
      },
    );
  }

  Widget _buildSocialMediaDivider() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        SizedBox(width: 85.w, child: const Divider()),
        Text(StringsManager.socialMediaAuth,
            style: StyleManager.getLightStyle(
              fontSize: FontSize.s16,
            )),
        SizedBox(width: 85.w, child: const Divider()),
      ],
    );
  }

  Widget _buildSocialMediaButtons() {
    return const SocialMediaButtons();
  }

  bool _isLogIn() {
    if (title == StringsManager.login) {
      return true;
    } else {
      return false;
    }
  }

  bool _isSignUp() {
    if (title == StringsManager.signUp) {
      return true;
    } else {
      return false;
    }
  }
}
