import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:xpert/src/core/resources/color_manager.dart';
import 'package:xpert/src/core/resources/font_manager.dart';
import 'package:xpert/src/core/resources/route_manager.dart';
import 'package:xpert/src/core/resources/styles_manager.dart';
import 'package:xpert/src/core/widgets/app_padding.dart';
import 'package:xpert/src/features/chat_bot/business_logic/chat_bot_cubit.dart';
import 'package:xpert/src/features/chat_bot/constants/temp_model.dart';
import 'package:xpert/src/features/chat_bot/presentation/widgets/chatbot_app_bar.dart';
import 'package:xpert/src/core/widgets/chat_text_field.dart';

class ChatBotScreen extends StatefulWidget {
  const ChatBotScreen({super.key});

  @override
  State<ChatBotScreen> createState() => _ChatBotScreenState();
}

class _ChatBotScreenState extends State<ChatBotScreen> {
  late TextEditingController controller;
  @override
  void initState() {
    super.initState();
    controller = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.midnightBlue,
      appBar: const ChatBotAppBar(),
      body: _buildBloc(),
    );
  }

  Widget _buildBloc() {
    return BlocConsumer<ChatBotCubit, ChatBotState>(
      listener: (context, state) {},
      builder: (context, state) => _buildBody(),
    );
  }

  Widget _buildBody() {
    return AppPaddingWidgetAll(
      child: Column(
        children: [
          Expanded(
            child: _buildChatMessageBox(),
          ),
          _chatTextField(),
        ],
      ),
    );
  }

  Widget _buildChatMessageBox() {
    return SizedBox(
      width: 1.sw,
      child: ListView.separated(
        separatorBuilder: (context, index) => 16.verticalSpace,
        itemCount: tempChatList.length,
        itemBuilder: (context, index) {
          final message = tempChatList[index].message;
          final from = tempChatList[index].from;
          if (from == "user") {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                _message(from: from, text: message),
              ],
            );
          }
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _message(from: from, text: message),
            ],
          );
        },
      ),
    );
  }

  Widget _message({required String text, required String from}) {
    bool fromUser = (from == "user");
    return Container(
      width: 255.w,
      height: 48.h,
      decoration: BoxDecoration(
        color: fromUser ? ColorManager.primary : ColorManager.white,
        borderRadius: BorderRadius.circular(10.r),
      ),
      child: Center(
        child: Text(
          text,
          textAlign: TextAlign.center,
          style: StyleManager.getLightStyle(
            fontSize: FontSize.s16,
            color: fromUser ? ColorManager.white : ColorManager.black,
          ),
        ),
      ),
    );
  }

  Widget _chatTextField() {
    return ChatTextField(
      controller: controller,
      onSubmitted: (message) {
        if (message.isNotEmpty) {
          RouteGenerator.chatBotCubit.sendMessage(message);
        }
        controller.clear();
      },
    );
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}
