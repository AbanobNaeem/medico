import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:google_generative_ai/google_generative_ai.dart';
import 'package:xpert/src/core/resources/constants.dart';
import 'package:xpert/src/features/chat_bot/constants/temp_model.dart';

part 'chat_bot_state.dart';
part 'chat_bot_cubit.freezed.dart';

class ChatBotCubit extends Cubit<ChatBotState> {
  ChatBotCubit() : super(const ChatBotState.initial());
  late GenerativeModel _model;
  ChatSession? _chat;
  StreamSubscription<GenerateContentResponse>? _subscription;

  List<ChatBotModel> list = [];

  void initChatBot() {
    if (_chat == null) {
      _model = GenerativeModel(
        model: AppConstants.chatBotModel,
        apiKey: AppConstants.chatBotToken,
      );
      _chat = _model.startChat();
    }
  }

  void dispose() {
    _subscription?.cancel();
    list.clear();
    _chat = null; // Reset _chat to null
  }

  Future<void> sentChatToBot({String? message}) async {
    if (_chat == null) {
      return;
    }

    emit(const ChatBotState.sendMessageToBotLoading());

    list.add(ChatBotModel(message: message, from: "user"));

    try {
      _subscription =
          _chat!.sendMessageStream(Content.text(message ?? '')).listen((event) {
        final model = ChatBotModel(
          message: event.text ?? '',
          from: event.candidates.first.content.role,
        );
        list.add(model);

        emit(ChatBotState.botResponse(list: List.from(list)));
      }, onDone: () {
        emit(const ChatBotState.botFinish(finish: "Bot has completed the response"));
      });
    } catch (error) {
      emit(ChatBotState.botResponseError(error: error.toString()));
    }
  }
}
