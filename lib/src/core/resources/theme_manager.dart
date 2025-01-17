// Flutter imports:
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

// Package imports:
import 'package:flutter_screenutil/flutter_screenutil.dart';

// Project imports:
import 'package:xpert/src/core/resources/styles_manager.dart';
import 'package:xpert/src/core/resources/values_manager.dart';
import 'package:xpert/src/core/resources/color_manager.dart';
import 'package:xpert/src/core/resources/font_manager.dart';

mixin AppTheme implements ThemeData {
  static ThemeData get kLightTheme => ThemeData(
        brightness: Brightness.light,
        useMaterial3: true,

        //! Main Color
        scaffoldBackgroundColor: ColorManager.white,

        hintColor: ColorManager.mediumGray,
        // primaryColor: ,
        // primaryColorLight: ,
        // primaryColorDark: ,
        // disabledColor: ,
        // splashColor: ,  //ripple effect

        //!Divider
        dividerTheme: DividerThemeData(
          color: ColorManager.paleSilver,
          indent: 10.w,
          endIndent: 10.w,
          thickness: 2,
        ),

        //!App bar
        appBarTheme: AppBarTheme(
          systemOverlayStyle: const SystemUiOverlayStyle(
            statusBarColor: Colors.transparent,
            statusBarIconBrightness: Brightness.dark,
            systemNavigationBarColor: Colors.transparent,
          ),
          centerTitle: true,
          elevation: 0.0,
          backgroundColor: Colors.transparent,
          titleTextStyle: StyleManager.getSemiBoldStyle(fontSize: FontSize.s18),
        ),

        //! Page Transition
        // pageTransitionsTheme: const PageTransitionsTheme(
        //   builders: {
        //     TargetPlatform.android: ZoomPageTransitionsBuilder(),
        //     TargetPlatform.iOS: ZoomPageTransitionsBuilder(),
        //   },
        // ),

        //! Action Icon
        actionIconTheme: ActionIconThemeData(
          backButtonIconBuilder: (context) {
            return Icon(
              size: 20.h,
              Icons.arrow_back_ios_new_rounded,
              color: ColorManager.white,
            );
          },
        ),

        //!ElevatedButtonTheme
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
              fixedSize: Size(311.w, 72.h),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50.r)),
              backgroundColor: ColorManager.primary,
              foregroundColor: Colors.white,
              textStyle: StyleManager.getMediumStyle(
                  fontSize: FontSize.s20, color: ColorManager.white)
              // surfaceTintColor: Colors.white,
              ),
        ),

        //!TextTheme
        textTheme: TextTheme(
          headlineLarge: StyleManager.getSemiBoldStyle(fontSize: FontSize.s20),
          labelLarge: StyleManager.getSemiBoldStyle(
              fontSize: FontSize.s18, color: ColorManager.white),
          labelMedium: StyleManager.getMediumStyle(fontSize: FontSize.s20),
          labelSmall: StyleManager.getRegularStyle(
              fontSize: FontSize.s18, color: ColorManager.white),
          bodyMedium: StyleManager.getMediumStyle(fontSize: FontSize.s18),
          bodySmall: StyleManager.getRegularStyle(fontSize: FontSize.s16),
        ),

        //! TFF Theme
        inputDecorationTheme: InputDecorationTheme(
          contentPadding: const EdgeInsets.all(AppPadding.p16),
          hintStyle: getTFFFontStyle(),
          labelStyle: getTFFFontStyle(),
          errorStyle: getTFFFontStyle(error: true),
          //enabledBorder the border before click on field
          enabledBorder: getTFFBorderStyle(),
          disabledBorder: getTFFBorderStyle(),
          //focusedBorder the border after click on field
          focusedBorder: getTFFBorderStyle(color: ColorManager.primary),
          errorBorder: getTFFBorderStyle(color: ColorManager.brightRed),
          focusedErrorBorder: getTFFBorderStyle(),

          // disabledBorder: getTFFBorderStyle(),
          // border: getTFFBorderStyle(),
          // iconColor: ColorManager.secondary,
          // suffixIconColor: ColorManager.secondary,
        ),

        //! Switch Theme
        switchTheme: SwitchThemeData(
          thumbColor: WidgetStateProperty.all(ColorManager.white),
          trackColor: WidgetStateProperty.all(Colors.green),
        ),

        //! Bottom Sheet Theme
        bottomSheetTheme: BottomSheetThemeData(
          backgroundColor: ColorManager.white,
          // dragHandleSize: Size(100.w, 3.h),
          // dragHandleColor: ColorManager.lightGrey,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30.r),
              topRight: Radius.circular(30.r),
            ),
          ),
        ),

        textButtonTheme: TextButtonThemeData(
            style: ButtonStyle(
          foregroundColor:
              const WidgetStatePropertyAll<Color>(ColorManager.black),
          textStyle: WidgetStatePropertyAll<TextStyle>(
            StyleManager.getMediumStyle(
                color: ColorManager.black, fontSize: FontSize.s14),
          ),
        )),

        listTileTheme: ListTileThemeData(
          titleTextStyle: StyleManager.getRegularStyle(fontSize: FontSize.s16),
          horizontalTitleGap: 16.w,
        ),

        //! Checkbox Theme
        checkboxTheme: CheckboxThemeData(
          side: const BorderSide(width: 1),
          fillColor: const WidgetStatePropertyAll(ColorManager.primary),
          checkColor: const WidgetStatePropertyAll(ColorManager.white),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.r)),
        ),
        radioTheme: const RadioThemeData(
          fillColor: WidgetStatePropertyAll<Color?>(Colors.black),
        ),

        //! search bar
        searchBarTheme: SearchBarThemeData(
          backgroundColor: WidgetStateProperty.all(
            ColorManager.paleSilver,
          ),
          elevation: const WidgetStatePropertyAll(0),
          shape: WidgetStatePropertyAll(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.r),
            ),
          ),
          hintStyle: WidgetStatePropertyAll(
            StyleManager.getRegularStyle(
              color: ColorManager.mediumGray,
              fontSize: FontSize.s16,
            ),
          ),
        ),

        //! Bottom Nav Bar Theme
        bottomNavigationBarTheme: const BottomNavigationBarThemeData(
          selectedLabelStyle: TextStyle(fontSize: 0),
          unselectedLabelStyle: TextStyle(fontSize: 0),
          backgroundColor: ColorManager.transparent,
          type: BottomNavigationBarType.fixed,
          elevation: 0,
        ),
      );

  static TextStyle getTFFFontStyle({bool? error}) {
    return error ?? false
        ? StyleManager.getRegularStyle(
            color: ColorManager.brightRed,
            fontSize: 13.spMin,
          )
        : StyleManager.getRegularStyle(
            color: ColorManager.mediumGray,
            fontSize: 16.spMin,
          );
  }

  static InputBorder getTFFBorderStyle({Color? color}) {
    return OutlineInputBorder(
      borderSide: BorderSide(color: color ?? ColorManager.silver, width: 1.5.w),
      borderRadius: BorderRadius.circular(10.r),
    );
  }
}
