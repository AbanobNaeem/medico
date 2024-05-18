// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

part 'pusher_model.freezed.dart';
part 'pusher_model.g.dart';

@freezed
abstract class PusherChatModel with _$PusherChatModel {
  const factory PusherChatModel({
    @JsonKey(name: "SenderID") int? senderID,
    @JsonKey(name: "ReceiverID") int? receiverID,
    @JsonKey(name: "Content") String? message,
    @JsonKey(name: "Timestamp") String? timestamp,
    String? id,
  }) = _PusherChatModel;

  factory PusherChatModel.fromJson(Map<String, dynamic> json) =>
      _$PusherChatModelFromJson(json);
}
