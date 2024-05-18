// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_web_services.dart';

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps,no_leading_underscores_for_local_identifiers

class _HomeWebServices implements HomeWebServices {
  _HomeWebServices(
    this._dio, {
    this.baseUrl,
  }) {
    baseUrl ??= 'https://ertdemo.azurewebsites.net/api/';
  }

  final Dio _dio;

  String? baseUrl;

  @override
  Future<GetDoctorOrNurse> getDoctor({
    required String speciality,
    required String governorate,
  }) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = {
      'speciality': speciality,
      'governorate': governorate,
    };
    final _result = await _dio
        .fetch<Map<String, dynamic>>(_setStreamType<GetDoctorOrNurse>(Options(
      method: 'GET',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              'User/GetDoctorsByLocationAndSpeciality',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(
                baseUrl: _combineBaseUrls(
              _dio.options.baseUrl,
              baseUrl,
            ))));
    final value = GetDoctorOrNurse.fromJson(_result.data!);
    return value;
  }

  @override
  Future<GetDoctorOrNurse> getNurse({required String governorate}) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = {'governorate': governorate};
    final _result = await _dio
        .fetch<Map<String, dynamic>>(_setStreamType<GetDoctorOrNurse>(Options(
      method: 'GET',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              'User/GetNurseByLocationAndSpeciality',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(
                baseUrl: _combineBaseUrls(
              _dio.options.baseUrl,
              baseUrl,
            ))));
    final value = GetDoctorOrNurse.fromJson(_result.data!);
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
