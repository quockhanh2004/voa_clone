import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:voa_clone/app/constants/value.dart';
import 'package:voa_clone/model/response_audio.dart';

class FavoriteService {
  final Dio _dio = Dio(
    BaseOptions(baseUrl: BaseUrl.baseUrl, headers: HeaderDefault.headers),
  );

  Future<Map<String, dynamic>> favoriteArticle(Audio audio) async {
    try {
      if (kDebugMode) {
        print('Calling favorite API for articleId: ${audio.articleId}');
      }

      final body = {
        "installation": {
          "__type": "Pointer",
          "className": "_Installation",
          "objectId": "AvRq6kuR2z",
        },
        "action": "like",
        "ACL": {
          "*": {"read": true, "write": true},
        },
        "object_id": "article:${audio.articleId}",
      };
      if (kDebugMode) {
        print('Body: $body');
      }

      final response = await _dio.post('voale/classes/Activity', data: body);

      if (kDebugMode) {
        print('Response status code: ${response.statusCode}');
        print('Response data: ${response.data}');
      }

      if (response.statusCode == 201) {
        return response.data;
      } else {
        throw Exception('Failed to favorite article');
      }
    } catch (e) {
      if (kDebugMode) {
        print('Error in favoriteArticle: $e');
      }
      throw Exception('Error: $e');
    }
  }

  Future<Map<String, dynamic>?> checkFavorite(Audio audio) async {
    try {
      if (kDebugMode) {
        print('Checking favorite for articleId: ${audio.articleId}');
      }

      final body = {
        "where":
            "{\"action\":\"like\",\"object_id\":\"article:${audio.articleId}\",\"installation\":{\"__type\":\"Pointer\",\"className\":\"_Installation\",\"objectId\":\"${audio.objectId}\"}}",
        "_method": "GET",
      };
      if (kDebugMode) {
        print('Body: $body');
      }

      final response = await _dio.post('voale/classes/Activity', data: body);

      if (kDebugMode) {
        print('Response status code: ${response.statusCode}');
        print('Response data: ${response.data}');
      }

      if (response.statusCode == 200 &&
          response.data['results'] != null &&
          response.data['results'].isNotEmpty) {
        return response.data['results'][0];
      }
      return null;
    } catch (e) {
      if (kDebugMode) {
        print('Error in checkFavorite: $e');
      }
      throw Exception('Error: $e');
    }
  }

  Future<void> unfavoriteArticle(String objectId) async {
    try {
      if (kDebugMode) {
        print('Unfavorite article with objectId: $objectId');
      }

      final response = await _dio.delete('voale/classes/Activity/$objectId');

      if (kDebugMode) {
        print('Response status code: ${response.statusCode}');
      }

      if (response.statusCode != 200) {
        throw Exception('Failed to unfavorite article');
      }
    } catch (e) {
      if (kDebugMode) {
        print('Error in unfavoriteArticle: $e');
      }
      throw Exception('Error: $e');
    }
  }
}
