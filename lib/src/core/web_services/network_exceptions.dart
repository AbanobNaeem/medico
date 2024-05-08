// ignore_for_file: deprecated_member_use

import 'dart:developer';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:xpert/src/core/resources/common.dart';
import 'package:xpert/src/core/resources/strings_manager.dart';

import 'error_model.dart';

part 'network_exceptions.freezed.dart';

@freezed
class DioExceptionTypes with _$DioExceptionTypes {
  const factory DioExceptionTypes.requestCancelled() = RequestCancelled;

  const factory DioExceptionTypes.unauthorizedRequest(String error) =
      UnauthorizedRequest;

  const factory DioExceptionTypes.badRequest(String error,
      [ErrorModel? model]) = BadRequest;

  const factory DioExceptionTypes.badResponse(String error,
      [ErrorModel? model]) = BadResponse;

  const factory DioExceptionTypes.notFound(String reason) = NotFound;

  const factory DioExceptionTypes.methodNotAllowed() = MethodNotAllowed;

  const factory DioExceptionTypes.notAcceptable() = NotAcceptable;

  const factory DioExceptionTypes.requestTimeout() = RequestTimeout;

  const factory DioExceptionTypes.sendTimeout() = SendTimeout;

  const factory DioExceptionTypes.unprocessableEntity(String reason) =
      UnprocessableEntity;

  const factory DioExceptionTypes.conflict(String error) = Conflict;

  const factory DioExceptionTypes.internalServerError() = InternalServerError;

  const factory DioExceptionTypes.notImplemented() = NotImplemented;

  const factory DioExceptionTypes.serviceUnavailable() = ServiceUnavailable;

  const factory DioExceptionTypes.noInternetConnection() = NoInternetConnection;

  const factory DioExceptionTypes.formatException() = FormatException;

  const factory DioExceptionTypes.unableToProcess() = UnableToProcess;

  const factory DioExceptionTypes.defaultError(String error) = DefaultError;

  static DioExceptionTypes handleResponse(Response? response) {
    int statusCode = response?.statusCode ?? 0;
    log("statusCode $statusCode");

    ErrorModel? errorModel;
    try {
      errorModel = ErrorModel.fromJson(response?.data);
    } catch (e) {
      log("error $e");
    }
    String error = errorModel?.message ?? StringsManager.anErrorOccurred;
    switch (statusCode) {
      case 400:
        log('400');
        return DioExceptionTypes.badRequest(error, errorModel);
      case 401:
        log('401');
        return DioExceptionTypes.unauthorizedRequest(error);
      case 403:
        log('403');

        return DioExceptionTypes.unauthorizedRequest(error);
      case 404:
        log('404');
        log(response.toString());
        log(response?.data['message']);

        return DioExceptionTypes.notFound(error);

      case 409:
        log('409');

        return DioExceptionTypes.conflict(error);
      case 408:
        log('408');

        return const DioExceptionTypes.requestTimeout();
      case 422:
        log('422');
        return DioExceptionTypes.unprocessableEntity(error);
      case 500:
        log('500');
        return const DioExceptionTypes.internalServerError();
      case 503:
        log('503');
        return const DioExceptionTypes.serviceUnavailable();
      default:
        log('default');
        log("errorModel.errors?.first.message ${errorModel?.message}");
        var responseCode = statusCode;
        return DioExceptionTypes.defaultError(
          "$responseCode",
        );
    }
  }

  static int returnStatusCode(DioExceptionTypes? exception) {
    return exception?.when(
          notImplemented: () => 501,
          requestCancelled: () => 499,
          internalServerError: () => 500,
          notFound: (String reason) => 404,
          serviceUnavailable: () => 503,
          methodNotAllowed: () => 405,
          badRequest: (String error, _) => 400,
          badResponse: (String error, _) => 400,
          unauthorizedRequest: (String error) => 401,
          unprocessableEntity: (String error) => 422,
          requestTimeout: () => 408,
          sendTimeout: () => 408,
          notAcceptable: () => 406,
          conflict: (String error) => 409,
          noInternetConnection: () => 0,
          formatException: () => 0,
          unableToProcess: () => 0,
          defaultError: (String error) => int.parse(error),
        ) ??
        0;
  }

  static DioExceptionTypes getDioException(error, [stackTrace]) {
    logger.e(
      "DioExceptionType",
      stackTrace: stackTrace,
      error: error,
    );
    if (error is Exception) {
      try {
        if (error is DioException) {
          log("error dioaooaooaoaaoo ${error.type}");
          switch (error.type) {
            case DioErrorType.cancel:
              return const DioExceptionTypes.requestCancelled();

            case DioErrorType.connectionTimeout:
              return const DioExceptionTypes.requestTimeout();

            case DioErrorType.unknown:
              // log("message ${error.message} ${error.response?.data} $stackTrace");
              return const DioExceptionTypes.noInternetConnection();

            case DioErrorType.receiveTimeout:
              return const DioExceptionTypes.sendTimeout();

            case DioErrorType.badResponse:
              log("message baaaaaad");
              return DioExceptionTypes.handleResponse(error.response);

            case DioErrorType.sendTimeout:
              return const DioExceptionTypes.sendTimeout();

            default:
              return const DioExceptionTypes.unableToProcess();
          }
        } else if (error is SocketException) {
          // log("error $error $stackTrace");

          return const DioExceptionTypes.noInternetConnection();
        } else {
          return const DioExceptionTypes.unableToProcess();
        }

        // ignore: unused_catch_clause
      } on FormatException catch (e) {
        return const DioExceptionTypes.formatException();
      } catch (_) {
        // log("error $error $stackTrace");
        return const DioExceptionTypes.unableToProcess();
      }
    } else {
      // log("error $error $stackTrace");
      if (error.toString().contains("is not a subtype of")) {
        return const DioExceptionTypes.unableToProcess();
      } else {
        return const DioExceptionTypes.unableToProcess();
      }
    }
  }

  static ErrorModel getErrorModel(DioExceptionTypes? exception) {
    return exception?.when(
          notImplemented: () => ErrorModel(message: "Not Implemented"),
          requestCancelled: () => ErrorModel(message: "Request Cancelled"),
          internalServerError: () =>
              ErrorModel(message: "Internal Server Error"),
          notFound: (String reason) => ErrorModel(message: reason),
          serviceUnavailable: () => ErrorModel(message: "Service unavailable"),
          methodNotAllowed: () => ErrorModel(message: "Method Allowed"),
          badRequest: (String error, ErrorModel? model) =>
              model ?? ErrorModel(message: error),
          badResponse: (String error, ErrorModel? model) =>
              model ?? ErrorModel(message: error),
          unauthorizedRequest: (String error) => ErrorModel(message: error),
          unprocessableEntity: (String error) => ErrorModel(message: error),
          requestTimeout: () =>
              ErrorModel(message: "Connection request timeout"),
          sendTimeout: () => ErrorModel(message: "Connection send timeout"),
          notAcceptable: () => ErrorModel(message: "Not Acceptable"),
          conflict: (String error) => ErrorModel(message: error),
          noInternetConnection: () =>
              ErrorModel(message: "No Internet Connection"),
          formatException: () => ErrorModel(message: "Format Exception"),
          unableToProcess: () =>
              ErrorModel(message: "Unable to process the data"),
          defaultError: (String error) => ErrorModel(message: error),
        ) ??
        ErrorModel(message: "Unexpected error occurred");
  }

  static String getErrorMessage(DioExceptionTypes networkExceptions) {
    return networkExceptions.when(
      notImplemented: () => "Not Implemented",
      requestCancelled: () => "Request Cancelled",
      internalServerError: () => "Internal Server Error",
      notFound: (String reason) => reason,
      serviceUnavailable: () => "Service unavailable",
      methodNotAllowed: () => "Method Allowed",
      badRequest: (String error, _) => error,
      badResponse: (String error, _) => error,
      unauthorizedRequest: (String error) => error,
      unprocessableEntity: (String error) => error,
      // unknown: () => "Unexpected error occurred",
      requestTimeout: () => "Connection request timeout",
      sendTimeout: () => "Connection send timeout",
      notAcceptable: () => "Not Acceptable",
      conflict: (String error) => error,
      noInternetConnection: () => "No Internet Connection",
      formatException: () => "Format Exception",
      // unableToProcess: () => "Unable to process the data",

      unableToProcess: () => "حدث خطأ ما يرجى المحاولة مرة اخرى",
      defaultError: (String error) => error,
    );
  }
}
