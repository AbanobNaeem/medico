import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:xpert/src/core/resources/color_manager.dart';
import 'package:xpert/src/core/resources/font_manager.dart';
import 'package:xpert/src/core/resources/strings_manager.dart';
import 'package:xpert/src/core/resources/styles_manager.dart';

class ChatBotAppBar extends StatelessWidget implements PreferredSizeWidget {
  const ChatBotAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      systemOverlayStyle: const SystemUiOverlayStyle(
        systemNavigationBarColor: ColorManager.midnightBlue,
      ),
      backgroundColor: ColorManager.midnightBlue,
      centerTitle: false,
      titleSpacing: 0,
      title: Text(
        StringsManager.chatbot,
        textAlign: TextAlign.center,
        style: StyleManager.getBoldStyle(
          fontSize: FontSize.s36,
          color: ColorManager.periwinkleBlue,
        ),
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(56.h);
}
