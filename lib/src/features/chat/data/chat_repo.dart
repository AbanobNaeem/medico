import 'package:xpert/src/core/web_services/api_result.dart';
import 'package:xpert/src/core/web_services/network_exceptions.dart';
import 'package:xpert/src/features/chat/data/models/chat_model.dart';
import 'package:xpert/src/features/chat/web_services/chat_web_services.dart';

class ChatRepo {
  final ChatWebServices _webServices;

  ChatRepo(
    ChatWebServices webServices,
  ) : _webServices = webServices;

  Future<ApiResult<List<ChatModel>>> getChatMessage() async {
    try {
      var response = await _webServices.getChatMessages("2", "1");

      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(DioExceptionTypes.getDioException(error));
    }
  }

  Future<ApiResult<Map<String, String>>> sendMessage(
      {required String message}) async {
    try {
      var response = await _webServices.sendChatMessage(
        "1",
        "2",
        message,
      );

      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(DioExceptionTypes.getDioException(error));
    }
  }
}
