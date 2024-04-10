import 'dart:developer';

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
import 'package:xpert/src/features/auth/widgets/auth_app_bar.dart';

import '../widgets/custom_forget_card.dart';

const List<String> _resetOptions = ["email", "password"];

class ForgetPasswordScreen extends StatefulWidget {
  const ForgetPasswordScreen({
    super.key,
    this.email,
    this.countryCode,
    this.phoneNumber,
  });

  final String? email, countryCode, phoneNumber;

  @override
  State<ForgetPasswordScreen> createState() => _ForgetPasswordScreenState();
}

class _ForgetPasswordScreenState extends State<ForgetPasswordScreen> {
  String currentOption = _resetOptions[0];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(),
      body: _buildBody(),
    );
  }

  PreferredSizeWidget? _appBar() {
    return const AuthAppBar(
      title: StringsManager.forgetPassword,
    );
  }

  Widget _buildBody() {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildForgetPasswordImage(),
          AppPaddingWidgetHorizontal(
              child: Column(
            children: [
              63.verticalSpace,
              CustomForgetCard(
                title: StringsManager.resetViaEmail,
                subtitle: widget.email,
                icon: AssetsManager.email,
                radioValue: _resetOptions[0],
                radioGroupValue: currentOption,
                radioOnChanged: (value) {
                  setState(() {
                    currentOption = value.toString();
                  });
                },
              ),
              24.verticalSpace,
              CustomForgetCard(
                title: StringsManager.resetViaSmg,
                countryCode: widget.countryCode,
                subtitle: widget.phoneNumber,
                icon: AssetsManager.phone,
                radioValue: _resetOptions[1],
                radioGroupValue: currentOption,
                radioOnChanged: (value) {
                  setState(() {
                    currentOption = value.toString();
                  });
                },
              ),
              32.verticalSpace,
              _buildButton(context)
            ],
          )),
        ],
      ),
    );
  }

  Widget _buildForgetPasswordImage() {
    return Container(
      height: 0.3.sh,
      decoration: BoxDecoration(
          color: ColorManager.primary,
          borderRadius: BorderRadiusDirectional.only(
            bottomStart: Radius.circular(50.r),
          )),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              65.horizontalSpace,
              Text(
                StringsManager.forgetPasswordDesc,
                style: StyleManager.getRegularStyle(
                  color: ColorManager.white,
                  fontSize: FontSize.s12,
                ),
              ),
            ],
          ),
          21.verticalSpace,
          Center(
            child: SvgPicture.asset(AssetsManager.forgetPassword),
          ),
        ],
      ),
    );
  }

  Widget _buildButton(context) {
    return DefaultButton(
      title: StringsManager.send,
      onPressed: () {
        switch (currentOption) {
          case "email":
            log('email');
            break;
          case "password":
            log('password');
            break;
        }
        Navigator.pushNamed(context, Routes.otp);
      },
    );
  }
}
