part of 'chat_bot_cubit.dart';

@freezed
class ChatBotState with _$ChatBotState {
  const factory ChatBotState.initial() = _Initial;
  const factory ChatBotState.sendMessage({required String message}) = _SendMessage;
}
