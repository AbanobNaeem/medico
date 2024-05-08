import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:xpert/src/core/resources/color_manager.dart';
import 'package:xpert/src/core/resources/font_manager.dart';
import 'package:xpert/src/core/resources/route_manager.dart';
import 'package:xpert/src/core/resources/strings_manager.dart';
import 'package:xpert/src/core/resources/styles_manager.dart';
import 'package:xpert/src/core/widgets/app_padding.dart';
import 'package:xpert/src/core/widgets/bottom_extend_app_bar.dart';
import 'package:xpert/src/core/widgets/default_app_bar.dart';
import 'package:xpert/src/core/widgets/default_button.dart';
import 'package:xpert/src/features/auth/business_logic/cubit/otp_timer_cubit.dart';

class OTPScreen extends StatefulWidget {
  const OTPScreen({super.key});

  @override
  State<OTPScreen> createState() => _OTPScreenState();
}

class _OTPScreenState extends State<OTPScreen> {
  late List<TextEditingController> otpController;
  OtpTimerCubit otpTimerCubit = RouteGenerator.otpTimerCubit;
  bool _isButtonEnabled = false;
  int _timeCounter = 0;

  @override
  void initState() {
    super.initState();
    otpController = List.generate(4, (index) => TextEditingController());
    otpTimerCubit.startTimer();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(),
      body: _buildBody(),
    );
  }

  PreferredSizeWidget? _appBar() {
    return DefaultAppBar(
      title: StringsManager.enter4Digits,
      fontSize: FontSize.s14,
    );
  }

  Widget _buildBody() {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildHeader(),
          AppPaddingWidgetHorizontal(
            child: Column(
              children: [
                24.verticalSpace,
                _buildForm(),
                16.verticalSpace,
                _buildTimer(),
                16.verticalSpace,
                _buildButton(),
                24.verticalSpace,
                _buildTextButton(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildHeader() {
    return BottomExtendAppBar(
      height: 0.1.sh,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              50.horizontalSpace,
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  8.verticalSpace,
                  Text(
                    StringsManager.oTPDesc,
                    style: StyleManager.getRegularStyle(
                      color: ColorManager.white,
                      fontSize: FontSize.s12,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildBox({String? Function(String?)? validator, required int index}) {
    return SizedBox(
      width: 50.w,
      height: 50.h,
      child: TextFormField(
        controller: otpController[index],
        onTapOutside: (event) => FocusScope.of(context).unfocus(),
        inputFormatters: [
          FilteringTextInputFormatter.digitsOnly,
          LengthLimitingTextInputFormatter(1),
        ],
        keyboardType: TextInputType.number,
        textAlign: TextAlign.center,
        validator: validator,
        onChanged: (value) {
          if (value.isEmpty) {
            _focusPreviousField(index);
          } else {
            _focusNextField(index + 1);
          }
        },
      ),
    );
  }

  Widget _buildForm() {
    return Form(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: List.generate(4, (index) => _buildBox(index: index)),
      ),
    );
  }

  Widget _buildTimeCounterBloc() {
    return BlocConsumer<OtpTimerCubit, OtpTimerState>(
      listener: (context, state) {
        state.mapOrNull(
          counter: (state) => _timeCounter = state.sec,
        );
      },
      builder: (context, state) {
        return Text(
          '0:$_timeCounter',
          style: StyleManager.getLightStyle(
            fontSize: FontSize.s18,
            color: ColorManager.brightRed,
          ),
        );
      },
    );
  }

  Widget _buildTimer() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          StringsManager.reSendCode,
          style: StyleManager.getLightStyle(fontSize: FontSize.s18),
        ),
        _buildTimeCounterBloc(),
      ],
    );
  }

  Widget _buildButton() {
    return DefaultButton(
      title: StringsManager.verify,
      onPressed: () {
        Navigator.pushReplacementNamed(context, Routes.resetPassword);
      },
    );
  }

  Widget _buildTextButton() {
    return Center(
      child: BlocConsumer<OtpTimerCubit, OtpTimerState>(
        listener: (context, state) {
          state.mapOrNull(
            buttonState: (state) => _isButtonEnabled = state.buttonState,
          );
        },
        builder: (context, state) {
          return TextButton(
            style: ButtonStyle(
              foregroundColor: MaterialStateProperty.all<Color>(
                  _isButtonEnabled ? ColorManager.brightRed : Colors.grey),
              textStyle: MaterialStateProperty.all<TextStyle>(
                StyleManager.getLightStyle(fontSize: FontSize.s18),
              ),
            ),
            onPressed: _isButtonEnabled
                ? () {
                    otpTimerCubit.restartTimer();
                  }
                : null,
            child: const Text(StringsManager.doNotReceiveCode),
          );
        },
      ),
    );
  }

  void _focusNextField(int index) {
    if (index < 6) {
      FocusScope.of(context).nextFocus();
    }
  }

  void _focusPreviousField(int index) {
    if (index > 0) {
      FocusScope.of(context).previousFocus();
    }
  }

  @override
  void dispose() {
    for (var controller in otpController) {
      controller.dispose();
    }
    super.dispose();
  }
}
