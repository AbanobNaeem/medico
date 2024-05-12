import 'package:dio/dio.dart' hide Headers;
import 'package:retrofit/retrofit.dart';
import 'package:xpert/src/core/resources/constants.dart';
import 'package:xpert/src/features/chat/data/models/chat_model.dart';

part 'chat_web_services.g.dart';

@RestApi(baseUrl: AppConstants.chatDomain)
abstract class ChatWebServices {
  factory ChatWebServices(Dio dio, {String baseUrl}) = _ChatWebServices;

  /////////////////////////// chat /////////////////////////////////////

  @POST("Chat/AddMessage1")
  Future<Map<String, String>> sendChatMessage(
    @Field() String senderID,
    @Field() String receiverID,
    @Field() String content,
  );

  @GET("Chat/GetMessages1")
  Future<List<ChatModel>> getChatMessages(
    @Field() String senderID,
    @Field() String receiverID,
  );

  //\\\\\\\\\\\\\\\\\\\\\\\\\ chat \\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
}
