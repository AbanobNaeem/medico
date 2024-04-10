
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:xpert/src/core/resources/color_manager.dart';
import 'package:xpert/src/core/resources/font_manager.dart';
import 'package:xpert/src/core/resources/strings_manager.dart';
import 'package:xpert/src/core/resources/styles_manager.dart';
import 'package:xpert/src/features/auth/presentation/login_n_signup/presentation/auth_screen.dart';

class AuthTabBar extends StatefulWidget {
  const AuthTabBar({super.key});

  @override
  State<AuthTabBar> createState() => _AuthTabBarState();
}

class _AuthTabBarState extends State<AuthTabBar> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: ColorManager.primary,
          automaticallyImplyLeading: false,
          bottom: TabBar(
              dividerHeight: 0,
              labelStyle: StyleManager.getMediumStyle(
                  fontSize: FontSize.s20, color: ColorManager.white),
              unselectedLabelStyle: StyleManager.getMediumStyle(
                  fontSize: FontSize.s20, color: ColorManager.lightGrey3),
              indicator: BoxDecoration(
                border: Border(
                  bottom: BorderSide(width: 1.w, color: ColorManager.white),
                ),
              ),
              tabs: const [
                Tab(
                  text: StringsManager.login,
                ),
                Tab(
                  text: StringsManager.signUp,
                ),
              ]),
        ),
        body: const TabBarView(
          children: [
            AuthScreen(title: StringsManager.login),
            AuthScreen(title: StringsManager.signUp),
          ],
        ),
      ),
    );
  }
}
