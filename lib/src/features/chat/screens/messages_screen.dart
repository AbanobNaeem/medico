import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:xpert/src/app/app.dart';
import 'package:xpert/src/core/resources/assets_manager.dart';
import 'package:xpert/src/core/resources/color_manager.dart';
import 'package:xpert/src/core/resources/font_manager.dart';
import 'package:xpert/src/core/resources/route_manager.dart';
import 'package:xpert/src/core/resources/strings_manager.dart';
import 'package:xpert/src/core/resources/styles_manager.dart';

class MessagesScreen extends StatelessWidget {
  const MessagesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(context),
      body: _body(),
    );
  }

  PreferredSizeWidget _appBar(context) {
    return AppBar(
      forceMaterialTransparency: true,
      leading: IconButton(
        onPressed: () {
          Navigator.of(context).pop();
        },
        icon: const Icon(
          Icons.arrow_back_ios_new_rounded,
        ),
        iconSize: 20.h,
        color: ColorManager.black,
      ),
      title: const Text(StringsManager.message),
      actions: [
        Padding(
          padding: EdgeInsetsDirectional.only(end: 16.w),
          child: SvgPicture.asset(
            width: 17.w,
            height: 17.h,
            AssetsManager.searchIc,
            colorFilter: const ColorFilter.mode(
              ColorManager.black,
              BlendMode.srcIn,
            ),
          ),
        ),
      ],
    );
  }

  Widget _body() {
    return ListView.builder(
      padding: EdgeInsets.only(
        bottom: kBottomNavigationBarHeight.h,
      ),
      itemCount: 1,
      itemBuilder: (context, index) => _listTile(
        model: messagesList[0],
      ),
    );
  }

  Widget _listTile({required MessagesListModel model}) {
    return ListTile(
      onTap: () {
        Navigator.pushNamed(
          navigatorKey.currentContext!,
          Routes.doctorChat,
          arguments: {
            "model": model,
          },
        );
      },
      shape: const Border(
          bottom: BorderSide(
        color: ColorManager.mediumGray,
      )),
      horizontalTitleGap: 10.w,
      leading: Container(
        width: 68.w,
        height: 68.w,
        decoration: BoxDecoration(
            image: DecorationImage(
          image: AssetImage(model.image),
        )),
      ),
      title: Text(model.name),
      titleTextStyle: StyleManager.getMediumStyle(fontSize: FontSize.s18),
      subtitle: Text(model.lastMessage),
      subtitleTextStyle: StyleManager.getLightStyle(
          fontSize: FontSize.s16, color: ColorManager.mediumGray),
      trailing: Text(
        model.timeOfMessage,
        style: StyleManager.getSemiBoldStyle(
          fontSize: FontSize.s15,
          color: ColorManager.mediumGray,
        ),
      ),
    );
  }
}

class MessagesListModel {
  final int id;
  final String image;
  final String name;
  final String lastMessage;
  final String timeOfMessage;

  MessagesListModel({
    required this.id,
    required this.image,
    required this.name,
    required this.lastMessage,
    required this.timeOfMessage,
  });
}

List<MessagesListModel> messagesList = [
  MessagesListModel(
    id: 1,
    image: AssetsManager.temp5,
    name: "Dr. Aya Mohamed",
    lastMessage: "I don't feel good today",
    timeOfMessage: "04:30PM",
  ),
];
