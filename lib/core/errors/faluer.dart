import 'package:dio/dio.dart';

abstract class Falure {
  final String massege;

  Falure({required this.massege});
}

class ServerFalure extends Falure {
  ServerFalure({required super.massege});

  factory ServerFalure.fromDioError(DioException e) {
    switch (e.type) {
      case DioExceptionType.connectionTimeout:
        return ServerFalure(massege: 'connection Time Out wth the server');
      case DioExceptionType.sendTimeout:
        return ServerFalure(massege: ' Sending time out with the server');
      case DioExceptionType.receiveTimeout:
        return ServerFalure(massege: ' receiving itme out the server');
      case DioExceptionType.badCertificate:
        return ServerFalure(massege: ' badcertificate error with the server');
      case DioExceptionType.badResponse:
        return ServerFalure.fromBadResponse(
            responseBody: e.response!.statusMessage!,
            responseStatuseCode: e.response!.statusCode);
      case DioExceptionType.cancel:
        return ServerFalure(massege: 'the request is cancelled');
      case DioExceptionType.connectionError:
        return ServerFalure(massege: ' connection error with the server');
      case DioExceptionType.unknown:
        return ServerFalure(massege: 'oops there is an error with the server');
    }
  }

  factory ServerFalure.fromBadResponse(
      {required String responseBody, required int? responseStatuseCode}) {
    if (responseStatuseCode! >= 500) {
      return ServerFalure(massege: 'there is an error from server side');
    } else if (responseStatuseCode >= 400 && responseStatuseCode != 401) {
      return ServerFalure(
          massege: 'there is an error from the client side or page not found');
    } else if (responseStatuseCode == 401) {
      return ServerFalure(massege: '401');
    } else {
      return ServerFalure(massege: 'There is an error calld $responseBody');
    }
  }
}
