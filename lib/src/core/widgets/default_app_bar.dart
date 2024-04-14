import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:xpert/src/core/resources/color_manager.dart';
import 'package:xpert/src/core/resources/font_manager.dart';
import 'package:xpert/src/core/resources/styles_manager.dart';

class DefaultAppBar extends StatelessWidget implements PreferredSizeWidget {
  const DefaultAppBar({
    super.key,
    this.title,
    this.actions,
    this.backgroundColor,
    this.forceMaterialTransparency,
    this.leading,
    this.centerTitle,
    this.automaticallyImplyLeading,
    this.titleSpacing,
    this.fontSize,
    this.titleTextColor,
  });

  final String? title;
  final List<Widget>? actions;
  final Color? backgroundColor;
  final bool? forceMaterialTransparency;
  final Widget? leading;
  final bool? centerTitle;
  final bool? automaticallyImplyLeading;
  final double? titleSpacing;
  final double? fontSize;
  final Color? titleTextColor;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      bottomOpacity: 0,
      shape: Border.all(
        width: 0,
        color: ColorManager.primary,
      ),
      forceMaterialTransparency: forceMaterialTransparency ?? false,
      automaticallyImplyLeading: automaticallyImplyLeading ?? true,
      leading: leading,
      actions: actions,
      backgroundColor: backgroundColor ?? ColorManager.primary,
      centerTitle: centerTitle ?? false,
      titleSpacing: titleSpacing ?? 0,
      elevation: 0,
      title: Text(title ?? ''),
      titleTextStyle: 
          StyleManager.getMediumStyle(
            fontSize: fontSize ?? FontSize.s18,
            color: titleTextColor?? ColorManager.white,
          ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(56.h);
}
