part of 'chat_bot_cubit.dart';

@freezed
class ChatBotState with _$ChatBotState {
  const factory ChatBotState.initial() = _Initial;

  const factory ChatBotState.sendMessageToBotLoading() =
      _SendMessageToBotLoading;
  const factory ChatBotState.botResponse({required List<ChatBotModel> list}) =
      _BotResponse;

  const factory ChatBotState.botResponseError({required String error}) =
      _BotResponseError;

  const factory ChatBotState.botFinish({required String finish}) = _BotFinish;
}
