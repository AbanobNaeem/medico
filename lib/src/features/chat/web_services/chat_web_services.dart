import 'package:dio/dio.dart' hide Headers;
import 'package:retrofit/retrofit.dart';
import 'package:xpert/src/core/resources/constants.dart';
import 'package:xpert/src/features/chat/data/models/chat_model.dart';
import 'package:xpert/src/features/chat/data/models/messages_model.dart';
import 'package:xpert/src/features/chat/data/models/send_chat_model.dart';

part 'chat_web_services.g.dart';

@RestApi(baseUrl: AppConstants.domain)
abstract class ChatWebServices {
  factory ChatWebServices(Dio dio, {String baseUrl}) = _ChatWebServices;

  /////////////////////////// chat /////////////////////////////////////

  @POST("Chat/AddMessage1")
  Future<SendChatModel> sendChatMessage({
    @Field() required int senderID,
    @Field() required int receiverID,
    @Field() required String content,
  });

  @GET("Chat/GetMessages1")
  Future<List<ChatModel>> getChatMessages({
    @Field() required int senderID,
    @Field() required int receiverID,
  });

  //\\\\\\\\\\\\\\\\\\\\\\\\\ chat \\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\

  @GET("Chat/usernames1")
  Future<List<MessagesModel>> getMessages({
    @Field() required int id,
  });
}
