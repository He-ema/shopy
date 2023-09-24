import 'package:dio/dio.dart';

abstract class Failure {
  final String errorMessage;

  const Failure(this.errorMessage);
}

class ServerFailure extends Failure {
  ServerFailure(super.errorMessage);

  factory ServerFailure.fromDioException(DioException dioException) {
    switch (dioException.type) {
      case DioExceptionType.badCertificate:
        return ServerFailure('Bad certifiacte');

      case DioExceptionType.badResponse:
        return ServerFailure.fromResponse(
            dioException.response!.statusCode!, dioException.response!.data);
      case DioExceptionType.cancel:
        return ServerFailure('Request was canceled ');
      case DioExceptionType.connectionError:
        return ServerFailure('Connection timeout with the api server ');
      case DioExceptionType.connectionTimeout:
        return ServerFailure('Connection timeout with the api server ');

      case DioExceptionType.receiveTimeout:
        return ServerFailure('Recieve timeout with the api server ');

      case DioExceptionType.sendTimeout:
        return ServerFailure('Send timeout with the api server ');

      case DioExceptionType.unknown:
        if (dioException.message!.contains('SocketException')) {
          return ServerFailure('No internet connection');
        }
        return ServerFailure('Unexpected error , try again');

      default:
        return ServerFailure('Unexpected error , try again');
    }
  }

  factory ServerFailure.fromResponse(int statusCode, dynamic response) {
    if (statusCode == 400 || statusCode == 401 || statusCode == 403) {
      return ServerFailure(response['error']['message']);
    } else if (statusCode == 404) {
      return ServerFailure('request not found , try again later');
    } else if (statusCode == 500) {
      return ServerFailure('internal server error , try again later');
    } else {
      return ServerFailure('Oops there is an error , try again later');
    }
  }
}
