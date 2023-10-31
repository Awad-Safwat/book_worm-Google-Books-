import 'package:dio/dio.dart';

class ApiService {
  final Dio _dio;
  final String baseUrl = 'https://www.googleapis.com/books/v1/';

  ApiService({required Dio dio}) : _dio = dio;

  Future<Map<String, dynamic>> get({
    required String endPoint,
    String? accessToken,
    int? shilfId,
  }) async {
    if (accessToken == null) {
      var response = await _dio.get('$baseUrl$endPoint');
      return response.data;
    } else {
      var response = await _dio.get(
          '$baseUrl$endPoint${shilfId ?? 0}/volumes?access_token=$accessToken');
      return response.data;
    }
  }
}
