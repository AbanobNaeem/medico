import 'package:xpert/src/core/web_services/api_result.dart';
import 'package:xpert/src/core/web_services/network_exceptions.dart';
import 'package:xpert/src/features/chat/data/models/chat_model.dart';
import 'package:xpert/src/features/chat/data/models/send_chat_model.dart';
import 'package:xpert/src/features/chat/web_services/chat_web_services.dart';

class ChatRepo {
  final ChatWebServices _webServices;

  ChatRepo(
    ChatWebServices webServices,
  ) : _webServices = webServices;

  Future<ApiResult<List<ChatModel>>> getChatMessage({
    required int senderID,
    required int receiverID,
  }) async {
    try {
      var response = await _webServices.getChatMessages(
        receiverID: receiverID,
        senderID: senderID,
      );

      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(DioExceptionTypes.getDioException(error));
    }
  }

  Future<ApiResult<SendChatModel>> sendMessage({
    required String message,
    required int senderID,
    required int receiverID,
  }) async {
    try {
      var response = await _webServices.sendChatMessage(
        senderID: senderID,
        receiverID: receiverID,
        content: message,
      );

      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(DioExceptionTypes.getDioException(error));
    }
  }
}
