part of 'doctor_chat_cubit.dart';

@freezed
class DoctorChatState with _$DoctorChatState {
  const factory DoctorChatState.initial() = _Initial;
  const factory DoctorChatState.sendMessage({required String message}) =
      _SendMessage;
  const factory DoctorChatState.chatLoading() = _ChatLoading;
  const factory DoctorChatState.chatLoaded(
      {required List<ChatModel> listOfChat}) = _ChatLoaded;
  const factory DoctorChatState.chatError({required String error}) = _ChatError;
  const factory DoctorChatState.onPusherEvent({required ChatModel model}) =
      _OnPusherEvent;

  const factory DoctorChatState.getMessagesLoading() = _GetMessagesLoading;
  
  const factory DoctorChatState.gerMessagesLoaded(
      {required List<MessagesModel> list}) = _GetMessagesLoaded;

  const factory DoctorChatState.gerMessagesError({required String error}) =
      _GerMessagesError;
}
