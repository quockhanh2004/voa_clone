import 'package:dio/dio.dart';

class DetailService {
  final Dio _dio = Dio();

  Future<String> getHtmlContent(String url) async {
    try {
      final response = await _dio.get(url);
      if (response.statusCode == 200) {
        return response.data.toString();
      }
      throw Exception('Failed to load HTML content');
    } catch (e) {
      throw Exception('Error loading HTML content: $e');
    }
  }
}
