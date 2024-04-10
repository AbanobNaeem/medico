import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:xpert/src/core/resources/assets_manager.dart';
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
    this.onBackPress,
    this.leading,
  });

  final String? title;
  final List<Widget>? actions;
  final Color? backgroundColor;
  final bool? forceMaterialTransparency;
  final Function? onBackPress;
  final Widget? leading;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        top: MediaQuery.of(context).padding.top,
        bottom: 16.h,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(children: actions ?? [_buildActions(context)]),
          _buildTitle(),
          leading ?? const SizedBox(),
        ],
      ),
    );
  }

  Widget _buildTitle() {
    return Expanded(
      child: Text(
        title ?? "",
        textAlign: TextAlign.center,
        style: StyleManager.getSemiBoldStyle(fontSize: FontSize.s18),
      ),
    );
  }

  Widget _buildActions(BuildContext context) {
    return IconButton(
      onPressed: () => _onBackPress(context),
      icon: SvgPicture.asset(
        AssetsManager.arrowBack,
        height: 24.h,
        width: 24.w,
        matchTextDirection: true,
        colorFilter: const ColorFilter.mode(
          ColorManager.black,
          BlendMode.srcIn,
        ),
      ),
    );
  }

  void _onBackPress(BuildContext context) {
    if (onBackPress == null) {
      Navigator.of(context).pop();
    } else {
      onBackPress!();
    }
  }

  @override
  Size get preferredSize => Size.fromHeight(56.h);
}
