import 'package:dio/dio.dart';

class ApiService {
  final Dio _dio;
  final String baseUrl = 'https://www.googleapis.com/books/v1/';

  ApiService({required Dio dio}) : _dio = dio;

  Future<Map<String, dynamic>> get({
    required String endPoint,
  }) async {
    var response = await _dio.get('$baseUrl$endPoint');
    return response.data;
  }

  Future<Map<String, dynamic>> delet({
    required String endPoint,
    required Map<String, dynamic> data,
    required String accessToken,
  }) async {
    var response = await _dio.post('$baseUrl$endPoint',
        data: data,
        options: Options(headers: {"Authorization": "Bearer $accessToken"}));
    print(response.data);
    return response.data;
  }

  Future<Map<String, dynamic>> add({
    required String endPoint,
    required Map<String, dynamic> data,
    required String accessToken,
  }) async {
    var response = await _dio.post('$baseUrl$endPoint',
        data: data,
        options: Options(headers: {"Authorization": "Bearer $accessToken"}));
    print(response.data);
    return response.data;
  }
}
