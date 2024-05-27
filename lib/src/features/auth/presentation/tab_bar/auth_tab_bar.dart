import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:xpert/src/core/resources/color_manager.dart';
import 'package:xpert/src/core/resources/constants.dart';
import 'package:xpert/src/core/resources/font_manager.dart';
import 'package:xpert/src/core/resources/route_manager.dart';
import 'package:xpert/src/core/resources/shared_preferences.dart';
import 'package:xpert/src/core/resources/strings_manager.dart';
import 'package:xpert/src/core/resources/styles_manager.dart';
import 'package:xpert/src/core/resources/utils.dart';
import 'package:xpert/src/core/web_services/user_model.dart';
import 'package:xpert/src/features/auth/business_logic/auth_logic/cubit/auth_logic_cubit.dart';
import 'package:xpert/src/features/auth/presentation/login_n_signup/presentation/auth_screen.dart';

class AuthTabBar extends StatefulWidget {
  const AuthTabBar({super.key});

  @override
  State<AuthTabBar> createState() => _AuthTabBarState();
}

class _AuthTabBarState extends State<AuthTabBar> {
  late TextEditingController _email;
  late TextEditingController _password;
  late TextEditingController _userName;

  bool isLoading = false;
  @override
  void initState() {
    super.initState();
    _email = TextEditingController();
    _password = TextEditingController();
    _userName = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return _screenBloc();
  }

  Future<void> _saveUserDateBeforeNavigateToApp(UserModel model) async {
    CacheHelper.saveData(key: AppConstants.myId, value: model.userId);
    CacheHelper.saveData(key: AppConstants.myUserName, value: model.name);
    CacheHelper.saveData(key: AppConstants.myType, value: model.userType);
  }

  Widget _screenBloc() {
    return BlocConsumer<AuthLogicCubit, AuthLogicState>(
      listener: (context, state) {
        state.mapOrNull(
          success: (state) {
            isLoading = false;
            _saveUserDateBeforeNavigateToApp(state.model).then((value) {
              Navigator.pushNamedAndRemoveUntil(
                context,
                Routes.navigationViewRoute,
                (route) => false,
              );
            });
          },
          error: (state) {
            isLoading = false;

            showErrorToast(state.error, context);
          },
        );
      },
      builder: (context, state) {
        if (state == const AuthLogicState.loading()) {
          isLoading = true;
        }
        return _screen();
      },
    );
  }

  Widget _screen() {
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
        body: TabBarView(
          children: [
            AuthScreen(
              title: StringsManager.login,
              email: _email,
              password: _password,
              isLoading: isLoading,
            ),
            AuthScreen(
              title: StringsManager.signUp,
              email: _email,
              password: _password,
              userName: _userName,
              isLoading: isLoading,
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _email.dispose();
    _password.dispose();
    _userName.dispose();
    super.dispose();
  }
}
