import 'dart:io';

import 'package:emoji_picker_flutter/emoji_picker_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';
import 'package:xpert/src/core/resources/assets_manager.dart';
import 'package:xpert/src/core/resources/color_manager.dart';
import 'package:xpert/src/core/resources/font_manager.dart';
import 'package:xpert/src/core/resources/route_manager.dart';
import 'package:xpert/src/core/resources/strings_manager.dart';
import 'package:xpert/src/core/resources/styles_manager.dart';
import 'package:xpert/src/core/widgets/app_padding.dart';
import 'package:xpert/src/core/widgets/chat_text_field.dart';
import 'package:xpert/src/features/chat/screens/messages_screen.dart';
import 'package:xpert/src/features/chat/business_logic/doctor_chat/doctor_chat_cubit.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';

class DoctorChat extends StatefulWidget {
  const DoctorChat({
    super.key,
    required this.model,
  });
  final MessagesListModel model;

  @override
  State<DoctorChat> createState() => _DoctorChatState();
}

class _DoctorChatState extends State<DoctorChat> {
  late TextEditingController _controller;
  late ScrollController _scrollController;
  late ItemScrollController _scrollList;
  bool _isEmojiVisible = false;
  bool _isKeyboardVisible = false;
  late FocusNode _focusNode;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      // Scroll to the last message after the frame has been rendered
      _scrollList.jumpTo(index: 0);
    });
    _controller = TextEditingController();
    _scrollController = ScrollController();
    _scrollList = ItemScrollController();

    _focusNode = FocusNode();

    var keyboardVisibilityController = KeyboardVisibilityController();

    keyboardVisibilityController.onChange.listen((bool isKeyboardVisible) {
      setState(() {
        _isKeyboardVisible = isKeyboardVisible;
      });

      if (isKeyboardVisible && _isEmojiVisible) {
        setState(() {
          _isEmojiVisible = false;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.offWhite,
      appBar: _appBar(context),
      body: _buildBloc(),
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
      title: Text(widget.model.name),
    );
  }

  Widget _buildBloc() {
    return BlocConsumer<DoctorChatCubit, DoctorChatState>(
      listener: (context, state) {},
      builder: (context, state) => _buildBody(),
    );
  }

  Widget _buildBody() {
    return Column(
      children: [
        _onlineWidget(),
        Expanded(
          child: AppPaddingWidgetHorizontal(child: _buildChatMessageBox()),
        ),
        _chatTextField(),
        Offstage(
          offstage: !_isEmojiVisible,
          child: SizedBox(
            height: 0.35.sh,
            child: EmojiPicker(
              textEditingController: _controller,
              scrollController: _scrollController,
              config: Config(
                swapCategoryAndBottomBar: true,
                bottomActionBarConfig: const BottomActionBarConfig(
                  backgroundColor: ColorManager.primary,
                  buttonColor: ColorManager.transparent,
                  enabled: true,
                ),
                height: 256.h,
                checkPlatformCompatibility: true,
                emojiViewConfig: EmojiViewConfig(
                  emojiSizeMax: 32 * (Platform.isIOS ? 1.30 : 1.0),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildChatMessageBox() {
    return SizedBox(
      width: 1.sw,
      child: ScrollablePositionedList.separated(
        reverse: true,
        itemScrollController: _scrollList,
        separatorBuilder: (context, index) => 16.verticalSpace,
        itemCount: tempChatList.length,
        itemBuilder: (context, index) => _message(model: tempChatList[index]),
      ),
    );
  }

  Widget _message({required TempChatModel model}) {
    bool fromUser = (model.from == "user");
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment:
          fromUser ? MainAxisAlignment.end : MainAxisAlignment.start,
      children: [
        if (!fromUser)
          CircleAvatar(
            radius: 25.r,
            backgroundImage: AssetImage(widget.model.image),
          ),
        if (!fromUser) 7.horizontalSpace,
        Container(
          margin: EdgeInsets.only(top: 20.h),
          width: 255.w,
          height: 48.h,
          decoration: BoxDecoration(
            color: fromUser ? ColorManager.primary : ColorManager.white,
            borderRadius: BorderRadius.circular(10.r),
          ),
          child: Center(
            child: Text(
              model.message,
              textAlign: TextAlign.center,
              style: StyleManager.getLightStyle(
                fontSize: FontSize.s16,
                color: fromUser ? ColorManager.white : ColorManager.black,
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _onlineWidget() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          width: 9.h,
          height: 9.h,
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            color: ColorManager.vividGreen,
          ),
        ),
        3.horizontalSpace,
        Text(
          StringsManager.online,
          style: StyleManager.getMediumStyle(
            color: ColorManager.vividGreen,
            fontSize: FontSize.s18,
          ),
        )
      ],
    );
  }

  Widget _chatTextField() {
    return ChatTextField(
      onSendWithPrefixIcon: () {
        if (_controller.text.isNotEmpty) {
          RouteGenerator.doctorChatCubit.sendMessage(_controller.text);
        }
        _controller.clear();
      },
      suffixIcon: Padding(
        padding: EdgeInsetsDirectional.only(end: 20.w),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            InkWell(child: SvgPicture.asset(AssetsManager.documentIc)),
            InkWell(
              onTap: onClickEmoji,
              child: _isEmojiVisible
                  ? const Icon(Icons.keyboard_alt_outlined,
                      color: ColorManager.white)
                  : SvgPicture.asset(
                      AssetsManager.emojiIc,
                    ),
            ),
          ],
        ),
      ),
      controller: _controller,
      focusNode: _focusNode,
      onSubmitted: (message) {
        if (message.isNotEmpty) {
          RouteGenerator.doctorChatCubit.sendMessage(message);
          _scrollList.jumpTo(index: 0);
        }
        _controller.clear();
      },
    );
  }

  void onClickEmoji() async {
    if (_isEmojiVisible) {
      _focusNode.requestFocus();
    } else if (_isKeyboardVisible) {
      await SystemChannels.textInput.invokeMethod('TextInput.hide');
      await Future.delayed(const Duration(milliseconds: 100));
    }

    setState(() {
      _isEmojiVisible = !_isEmojiVisible;
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}

class TempChatModel {
  final String message;
  final String from;

  TempChatModel({
    required this.message,
    required this.from,
  });
}

List<TempChatModel> tempChatList = [
  TempChatModel(
    message: "Hello, How can help you?",
    from: "doctor",
  ),
  TempChatModel(
    message: "I don't feel good today",
    from: "user",
  ),
];