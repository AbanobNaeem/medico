// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chat_web_services.dart';

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps,no_leading_underscores_for_local_identifiers

class _ChatWebServices implements ChatWebServices {
  _ChatWebServices(
    this._dio, {
    this.baseUrl,
  }) {
    baseUrl ??= 'https://ertdemo.azurewebsites.net/api/';
  }

  final Dio _dio;

  String? baseUrl;

  @override
  Future<SendChatModel> sendChatMessage({
    required int senderID,
    required int receiverID,
    required String content,
  }) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = {
      'senderID': senderID,
      'receiverID': receiverID,
      'content': content,
    };
    final _result = await _dio
        .fetch<Map<String, dynamic>>(_setStreamType<SendChatModel>(Options(
      method: 'POST',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              'Chat/AddMessage1',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(
                baseUrl: _combineBaseUrls(
              _dio.options.baseUrl,
              baseUrl,
            ))));
    final value = SendChatModel.fromJson(_result.data!);
    return value;
  }

  @override
  Future<List<ChatModel>> getChatMessages({
    required int senderID,
    required int receiverID,
  }) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = {
      'senderID': senderID,
      'receiverID': receiverID,
    };
    final _result =
        await _dio.fetch<List<dynamic>>(_setStreamType<List<ChatModel>>(Options(
      method: 'GET',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              'Chat/GetMessages1',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(
                baseUrl: _combineBaseUrls(
              _dio.options.baseUrl,
              baseUrl,
            ))));
    var value = _result.data!
        .map((dynamic i) => ChatModel.fromJson(i as Map<String, dynamic>))
        .toList();
    return value;
  }

  RequestOptions _setStreamType<T>(RequestOptions requestOptions) {
    if (T != dynamic &&
        !(requestOptions.responseType == ResponseType.bytes ||
            requestOptions.responseType == ResponseType.stream)) {
      if (T == String) {
        requestOptions.responseType = ResponseType.plain;
      } else {
        requestOptions.responseType = ResponseType.json;
      }
    }
    return requestOptions;
  }

  String _combineBaseUrls(
    String dioBaseUrl,
    String? baseUrl,
  ) {
    if (baseUrl == null || baseUrl.trim().isEmpty) {
      return dioBaseUrl;
    }

    final url = Uri.parse(baseUrl);

    if (url.isAbsolute) {
      return url.toString();
    }

    return Uri.parse(dioBaseUrl).resolveUri(url).toString();
  }
}
