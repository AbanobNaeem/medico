import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
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
  late ScrollController _scrollController;
  List<ChatBotModel> _chat = [];
  bool botFinish = false;
  String botMessage = "";

  @override
  void initState() {
    super.initState();
    controller = TextEditingController();
    _scrollController = ScrollController();
    final chatBotCubit = RouteGenerator.chatBotCubit;
    chatBotCubit.initChatBot();
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
      listener: (context, state) {
        state.maybeWhen(
          botFinish: (state) {
            botFinish = true;
            botMessage = state;
          },
          botResponse: (list) {
            botFinish = false;
            _chat = list;

            _scrollToBottom();
          },
          orElse: () {
            botFinish = false;
          },
        );
      },
   builder: (context, state) {
        if (state == const ChatBotState.sendMessageToBotLoading()) {
          return _twistingDots();
        } else {
        return _buildBody();
          
        }
      },
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


  void _scrollToBottom() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (_scrollController.hasClients) {
        _scrollController.animateTo(
          _scrollController.position.maxScrollExtent,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeOut,
        );
      }
    });
  }

  Widget _buildBody() {
    return AppPaddingWidgetAll(
      child: Column(
        children: [
          Expanded(
            child: _buildChatMessageBox(_chat),
          ),
          _chatTextField(),
          if (botFinish == true) _completionIndicator(),
        ],
      ),
    );
  }

  Widget _buildChatMessageBox(List<ChatBotModel> list) {
    return SizedBox(
      width: 1.sw,
      child: ListView.separated(
        controller: _scrollController,
        separatorBuilder: (context, index) => 16.verticalSpace,
        itemCount: list.length,
        itemBuilder: (context, index) {
          final message = list[index].message;
          final from = list[index].from;
          if (from == "user") {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                _message(from: from ?? '', text: message ?? ''),
              ],
            );
          }
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _message(from: from ?? '', text: message ?? ''),
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
          RouteGenerator.chatBotCubit.sentChatToBot(message: message);
        }
        controller.clear();
      },
    );
  }

  Widget _completionIndicator() {
    return Container(
      padding: EdgeInsets.all(16.w),
      child: Text(
        botMessage,
        style: StyleManager.getMediumStyle(
            color: ColorManager.white, fontSize: FontSize.s16),
      ),
    );
  }

  @override
  void dispose() {
    controller.dispose();
    _scrollController.dispose();
    RouteGenerator.chatBotCubit.dispose();
    super.dispose();
  }
}
