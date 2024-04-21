import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../presentation/screens/temp2.dart';

part 'doctor_chat_state.dart';
part '../doctor_chat_cubit.freezed.dart';

class DoctorChatCubit extends Cubit<DoctorChatState> {
  DoctorChatCubit() : super(const DoctorChatState.initial());

  void sendMessage(String message) {
    tempChatList.insert(0,TempChatModel(message: message, from: "user"));
    emit(DoctorChatState.sendMessage(message: message));
  }
}
