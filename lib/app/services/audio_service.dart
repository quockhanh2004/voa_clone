import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:voa_clone/app/constants/value.dart';
import 'package:voa_clone/model/response_audio.dart';

class AudioService {
  final Dio _dio = Dio(
    BaseOptions(baseUrl: BaseUrl.baseUrl, headers: HeaderDefault.headers),
  );

  Future<ResponseAudio> getAudios() async {
    try {
      final response = await _dio.post(
        'voale/classes/Article',
        data: {
          "keys":
              "like_count,audio_caption_ok,cf_url,branch_link,hero,title,article_id,cover,duration,subtitle,original_pubtime,audio_hq,audio,view_count",
          "limit": "30",
          "where": "{\"status\":\"published\"}",
          "order": "-original_pubtime,-article_id",
          "_method": "GET",
        },
        options: Options(headers: HeaderDefault.headers),
      );

      if (response.statusCode == 200) {
        return ResponseAudio.fromJson(response.data);
      }
      throw Exception('Failed to load audios');
    } catch (e) {
      print('Error get audios: ${e.toString()}');
      throw Exception('Error loading audios: $e');
    }
  }
}
