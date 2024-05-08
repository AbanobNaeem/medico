import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:xpert/src/features/chat_bot/constants/temp_model.dart';

part 'chat_bot_state.dart';
part 'chat_bot_cubit.freezed.dart';

class ChatBotCubit extends Cubit<ChatBotState> {
  ChatBotCubit() : super(const ChatBotState.initial());

  void sendMessage(String message) {
    tempChatList.add(TempChatModel(message: message, from: "user"));
    emit(ChatBotState.sendMessage(message: message));
  }
}
