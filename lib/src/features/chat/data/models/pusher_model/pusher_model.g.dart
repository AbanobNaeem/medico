// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pusher_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PusherChatModelImpl _$$PusherChatModelImplFromJson(
        Map<String, dynamic> json) =>
    _$PusherChatModelImpl(
      senderID: json['SenderID'] as int?,
      receiverID: json['ReceiverID'] as int?,
      message: json['Content'] as String?,
      timestamp: json['Timestamp'] as String?,
      id: json['id'] as String?,
    );

Map<String, dynamic> _$$PusherChatModelImplToJson(
        _$PusherChatModelImpl instance) =>
    <String, dynamic>{
      'SenderID': instance.senderID,
      'ReceiverID': instance.receiverID,
      'Content': instance.message,
      'Timestamp': instance.timestamp,
      'id': instance.id,
    };
