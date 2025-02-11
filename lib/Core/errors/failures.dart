import 'dart:io';

import 'package:dio/dio.dart';

abstract class Failures {
  final String errorMsg;
  Failures(this.errorMsg);
}

class ServerFailure extends Failures {
  ServerFailure(super.errorMsg);

  factory ServerFailure.fromDioError(DioException dioError) {
    switch (dioError.type) {
      case DioExceptionType.connectionTimeout:
        return ServerFailure('Connection timeout with ApiServer');

      case DioExceptionType.sendTimeout:
        return ServerFailure('Send timeout with ApiServer');

      case DioExceptionType.receiveTimeout:
        return ServerFailure('Receive timeout with ApiServer');

      case DioExceptionType.badResponse:
        return ServerFailure.fromResponce(
          dioError.response!.statusCode,
          dioError.response!.data,
        );

      case DioExceptionType.cancel:
        return ServerFailure('Request to ApiServer was canceled');

      case DioExceptionType.connectionError:
        return ServerFailure('No Network Connection');

      case DioExceptionType.badCertificate:
        return ServerFailure('Bad certificate from ApiServer');

      case DioExceptionType.unknown:
        if (dioError.error is SocketException) {
          return ServerFailure('No Internet Connection');
        }
        return ServerFailure('Unexpected Error, Please try again!');
    }
  }

  factory ServerFailure.fromResponce(int? statusCode, dynamic response) {
    if (statusCode == 400 || statusCode == 401 || statusCode == 403) {
      return ServerFailure(response['error']['message']);
    } else if (statusCode == 404) {
      return ServerFailure('Not Found Error');
    } else if (statusCode == 500) {
      return ServerFailure('Internal Server Error please try again later');
    } else {
      return ServerFailure('Something went wrong please try again later');
    }
  }
}
