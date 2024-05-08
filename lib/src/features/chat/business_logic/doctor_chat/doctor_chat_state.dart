part of 'doctor_chat_cubit.dart';

@freezed
class DoctorChatState with _$DoctorChatState {
  const factory DoctorChatState.initial() = _Initial;
  const factory DoctorChatState.sendMessage({required String message}) = _SendMessage;
}
