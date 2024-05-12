import 'dart:convert';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pusher_channels_flutter/pusher_channels_flutter.dart';
import 'package:xpert/src/core/resources/constants.dart';
import 'package:xpert/src/features/chat/data/chat_repo.dart';
import 'package:xpert/src/features/chat/data/models/chat_model.dart';

part 'doctor_chat_state.dart';
part 'doctor_chat_cubit.freezed.dart';

class DoctorChatCubit extends Cubit<DoctorChatState> {
  DoctorChatCubit(this.chatRepo) : super(const DoctorChatState.initial());
  final ChatRepo chatRepo;
  PusherChannelsFlutter pusher = PusherChannelsFlutter.getInstance();

  // void sendMessage(String message) {
  //   tempChatList.insert(0, TempChatModel(message: message, from: "user"));
  //   emit(DoctorChatState.sendMessage(message: message));
  // }

  final List<dynamic> listForPagination = [];
  bool hasMore = true;
  int page = 1;

  void chatDispose({required int id}) {
    page = 1;
    // listForPagination.clear();
    hasMore = true;
    disposePusher(channelName: "${AppConstants.pusherPrefixChannelName}$id");
    Fluttertoast.cancel();
  }

  Future getMessageData() async {
    emit(const DoctorChatState.chatLoading());

    final result = await chatRepo.getChatMessage();
    result.when(
      success: (response) {
     

        if (state == const DoctorChatState.onPusherEvent()) {
          log("state is onPusherEvent");
        }
        emit(DoctorChatState.chatLoaded(listOfChat: response));
      },
      failure: (error) {
        emit(DoctorChatState.chatError(error: error.toString()));
      },
    );
  }

  Future<void> pusherInit({required String channelName}) async {
    try {
      await pusher.init(
        apiKey: AppConstants.pusherApiKey,
        cluster: AppConstants.pusherCluster,
        onConnectionStateChange: onConnectionStateChange,
        onError: pusherError,
        onSubscriptionSucceeded: onSubscriptionSucceeded,
        onEvent: onEvent,
        onSubscriptionError: onSubscriptionError,
      );
      await pusher.subscribe(channelName: channelName);

      await pusher.connect();
    } catch (error) {
      emit(DoctorChatState.chatError(error: error.toString()));
    }
  }

  void onEvent(PusherEvent event) async {
    log("$event");
    if (event.data.isNotEmpty) {
      final eventData = jsonDecode(event.data);
      // final pusherChatModel = PusherChatModel.fromJson(eventData);
      // final pusherMessage = pusherChatModel.message;
      // if (pusherMessage != null) {
      //   log("$eventData");
      //   final newMessages = ChatModel();
      emit(DoctorChatState.onPusherEvent(message: eventData));
    }
  }

  void onConnectionStateChange(dynamic currentState, dynamic previousState) {
    log("Connection: $currentState");
  }

  void pusherError(String message, int? code, dynamic e) {
    emit(DoctorChatState.chatError(
        error: "PusherErrorMessage:$message=======>code:$code,=======>e:$e"));
  }

  void onSubscriptionSucceeded(String channelName, dynamic data) {
    log("onSubscriptionSucceeded: $channelName data: $data");
  }

  void onSubscriptionError(String message, dynamic e) {
    emit(DoctorChatState.chatError(
        error: "onSubscriptionErrorMessage:$message=======>e:$e"));
  }

  Future<void> disposePusher({required String channelName}) async {
    await pusher.disconnect();
    await pusher.unsubscribe(channelName: channelName);
  }

  Future<void> sendMessage({
    required String message,
  }) async {
    chatRepo
        .sendMessage(
      message: message,
    )
        .then((result) {
      result.when(
        success: (data) {
          log("$data");
        },
        failure: (error) {
          log("$error");
        },
      );
    });
  }
}
