import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';
import 'package:xpert/src/core/resources/color_manager.dart';
import 'package:xpert/src/core/resources/constants.dart';
import 'package:xpert/src/core/resources/font_manager.dart';
import 'package:xpert/src/core/resources/route_manager.dart';
import 'package:xpert/src/core/resources/styles_manager.dart';
import 'package:xpert/src/core/resources/utils.dart';
import 'package:xpert/src/core/widgets/app_padding.dart';
import 'package:xpert/src/core/widgets/chat_text_field.dart';
import 'package:xpert/src/features/chat/data/models/chat_model.dart';
import 'package:xpert/src/features/chat/screens/messages_screen.dart';
import 'package:xpert/src/features/chat/business_logic/doctor_chat/doctor_chat_cubit.dart';

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
  late ItemScrollController _scrollList;

  List<ChatModel>? chat;

  @override
  void initState() {
    super.initState();
    RouteGenerator.doctorChatCubit.getMessageData(
      senderID: 1,
      receiverID: 2,
    );
    _loadChatData();
    _scrollList = ItemScrollController();
    _controller = TextEditingController();
  }

  Future<void> _loadChatData() async {
    await RouteGenerator.doctorChatCubit
        .pusherInit(channelName: AppConstants.pusherPrefixChannelName);
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
      listener: (context, state) {
        state.mapOrNull(
          chatLoaded: (state) {
            chat = state.listOfChat;
          },
          chatError: (state) {
            showErrorToast(state.error, context);
          },
        );
      },
      builder: (context, state) {
        if (chat != null) {
          return _buildBody(chat!);
        } else if (state == const DoctorChatState.chatLoading()) {
          return _twistingDots();
        } else {
          return const SizedBox();
        }
      },
    );
  }

  Widget _buildBody(List<ChatModel> chat) {
    return Column(
      children: [
        Expanded(
          child: AppPaddingWidgetHorizontal(child: _buildChatMessageBox(chat)),
        ),
        _chatTextField(),
      ],
    );
  }

  Widget _twistingDots() {
    return Center(
      child: LoadingAnimationWidget.twistingDots(
        leftDotColor: ColorManager.black,
        rightDotColor: ColorManager.primary,
        size: 100,
      ),
    );
  }

  Widget _buildChatMessageBox(List<ChatModel> chat) {
    return SizedBox(
      width: 1.sw,
      child: ScrollablePositionedList.separated(
        reverse: true,
        itemScrollController: _scrollList,
        separatorBuilder: (context, index) => 16.verticalSpace,
        itemCount: chat.length,
        itemBuilder: (context, index) => _message(model: chat[index]),
      ),
    );
  }

  Widget _message({required ChatModel model}) {
    bool fromUser = (model.senderID == 1);
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
              model.content ?? '',
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

  Widget _chatTextField() {
    return ChatTextField(
      onSendWithPrefixIcon: () {
        if (_controller.text.isNotEmpty) {
          RouteGenerator.doctorChatCubit.sendMessage(
            senderID: 1,
            receiverID: 2,
            message: _controller.text,
          );
        }
        _controller.clear();
      },
      // suffixIcon: Padding(
      //   padding: EdgeInsetsDirectional.only(end: 20.w),
      //   child: Row(
      //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //     children: [
      //       InkWell(child: SvgPicture.asset(AssetsManager.documentIc)),
      //       InkWell(
      //         onTap: onClickEmoji,
      //         child: _isEmojiVisible
      //             ? const Icon(Icons.keyboard_alt_outlined,
      //                 color: ColorManager.white)
      //             : SvgPicture.asset(
      //                 AssetsManager.emojiIc,
      //               ),
      //       ),
      //     ],
      //   ),
      // ),
      controller: _controller,
      // focusNode: _focusNode,
      onSubmitted: (message) {
        if (message.isNotEmpty) {
          RouteGenerator.doctorChatCubit.sendMessage(
            senderID: 1,
            receiverID: 2,
            message: message,
          );
          _scrollList.jumpTo(index: 0);
        }
        _controller.clear();
      },
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    RouteGenerator.doctorChatCubit.chatList.clear();
    RouteGenerator.doctorChatCubit
        .disposePusher(channelName: AppConstants.pusherPrefixChannelName);
    super.dispose();
  }
}
