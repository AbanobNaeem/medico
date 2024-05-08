import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:xpert/src/core/resources/assets_manager.dart';
import 'package:xpert/src/core/resources/color_manager.dart';
import 'package:xpert/src/core/resources/font_manager.dart';
import 'package:xpert/src/core/resources/styles_manager.dart';
import 'package:xpert/src/features/splash/business_logic/business_logic.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  double? size;
  @override
  void initState() {
    super.initState();
    SplashScreenLogic.splashInit();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        forceMaterialTransparency: true,
        automaticallyImplyLeading: false,
        toolbarHeight: 0,
      ),
      body: _splashBodyWidget(),
    );
  }

  Widget _splashBodyWidget() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _typer(),
          Center(
            child: Image.asset(AssetsManager.logo),
          )
        ],
      ),
    );
  }

  Widget _typer() {
    return SizedBox(
      width: 0.32.sw,
      child: DefaultTextStyle(
        style: StyleManager.getSemiBoldStyle(
            color: ColorManager.primary, fontSize: size ?? FontSize.s32),
        child: AnimatedTextKit(
          isRepeatingAnimation: false,
          onFinished: () {
            setState(() {
              size = FontSize.s34;
            });
          },
          animatedTexts: [
            TyperAnimatedText('Me'),
            TyperAnimatedText('Medico'),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    SplashScreenLogic.dispose();

    super.dispose();
  }
}
