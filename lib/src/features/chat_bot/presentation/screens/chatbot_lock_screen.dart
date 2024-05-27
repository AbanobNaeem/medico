import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:xpert/src/core/resources/assets_manager.dart';
import 'package:xpert/src/core/resources/color_manager.dart';
import 'package:xpert/src/core/resources/font_manager.dart';
import 'package:xpert/src/core/resources/route_manager.dart';
import 'package:xpert/src/core/resources/strings_manager.dart';
import 'package:xpert/src/core/resources/styles_manager.dart';
import 'package:xpert/src/core/widgets/app_padding.dart';
import 'package:xpert/src/features/chat_bot/presentation/widgets/slider_button.dart';

class ChatBotLockScreen extends StatefulWidget {
  const ChatBotLockScreen({super.key});

  @override
  State<ChatBotLockScreen> createState() => _ChatBotLockScreenState();
}

class _ChatBotLockScreenState extends State<ChatBotLockScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        systemOverlayStyle: const SystemUiOverlayStyle(
          systemNavigationBarColor: ColorManager.midnightBlue,
        ),
      ),
      backgroundColor: ColorManager.midnightBlue,
      body: AppPaddingWidgetOnly(
        top: 0,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              StringsManager.meetThe,
              textAlign: TextAlign.center,
              style: StyleManager.getLightStyle(
                fontSize: FontSize.s36,
                color: ColorManager.white,
              ),
            ),
            Text(
              StringsManager.chatbot,
              textAlign: TextAlign.center,
              style: StyleManager.getBoldStyle(
                fontSize: FontSize.s36,
                color: ColorManager.periwinkleBlue,
              ),
            ),
            42.verticalSpace,
            _buildBot(),
            const Spacer(),
            _buildSlider(context),
          ],
        ),
      ),
    );
  }

  _buildBot() {
    return Center(
      child: Column(
        children: [
          Padding(
            padding: EdgeInsetsDirectional.only(start: 95.w),
            child: _gradientBox(),
          ),
          8.verticalSpace,
          Padding(
            padding: EdgeInsetsDirectional.only(end: 90.w),
            child: Image.asset(AssetsManager.chatBubbles),
          ),
          8.verticalSpace,
          Image.asset(AssetsManager.chatBot),
        ],
      ),
    );
  }

  Widget _gradientBox() {
    return Container(
      width: 162.w,
      height: 61.h,
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        gradient: ColorManager.chatBotGradient,
        borderRadius: BorderRadius.circular(20.r),
      ),
      child: Center(
        child: Text(
          StringsManager.needOurHelpNow,
          textAlign: TextAlign.center,
          style: StyleManager.getLightStyle(
            fontSize: FontSize.s16,
            color: ColorManager.white,
          ),
        ),
      ),
    );
  }

  Widget _buildSlider(context) {
    return Expanded(
      flex: 20,
      child: Center(
        child: SliderButton(
          gradient: ColorManager.chatBotGradient,
          width: 311.w,
          height: 72.h,
          action: () async {
            Navigator.pushNamed(context, Routes.chatBotScreen);
            return true;
          },
          alignLabel: Alignment.center,
          shimmer: false,
          label: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              120.horizontalSpace,
              Text(
                StringsManager.getStarted,
                style: StyleManager.getLightStyle(
                  fontSize: FontSize.s16,
                  color: ColorManager.white,
                ),
              ),
              const Spacer(),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 32.w),
                child: Image.asset(AssetsManager.threeArrows),
              )
            ],
          ),
          buttonSize: 55,
          icon: Container(
            decoration: const BoxDecoration(
              color: ColorManager.darkMidnightBlue,
              shape: BoxShape.circle,
            ),
            child: const Center(
              child: Icon(
                size: 13,
                Icons.arrow_forward_ios_rounded,
                color: ColorManager.white,
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        systemNavigationBarColor: ColorManager.white,
      ),
    );
    super.dispose();
  }
}
