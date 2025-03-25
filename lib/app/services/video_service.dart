import 'package:dio/dio.dart';
import 'package:voa_clone/app/constants/value.dart';
import 'package:voa_clone/app/services/api_client.dart';
import 'package:voa_clone/model/response_video.dart';

class VideoService {
  final Dio _dio = ApiClient().dio;

  Future<ResponseVideo> getListVideo() async {
    Response response = await _dio.post(
      "/voale/classes/Video",
      data: {
        "keys":
            "yt_url,like_count,branch_link,title,video_hq,cover,duration,video_url,pubtime,subtitle,video_mobile,view_count,video_id",
        "limit": "30",
        "where": "{\"status\":\"published\"}",
        "order": "-pubtime,-video_id",
        "_method": "GET",
      },
      options: Options(headers: HeaderDefault.headers),
    );

    return ResponseVideo.fromJson(response.data);
  }
}
