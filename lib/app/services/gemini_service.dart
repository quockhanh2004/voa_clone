import 'dart:convert';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:path_provider/path_provider.dart';
// ignore: depend_on_referenced_packages
import 'package:mime/mime.dart';
import 'package:voa_clone/app/constants/value.dart';
import 'package:voa_clone/model/lyric.dart';
import 'package:shared_preferences/shared_preferences.dart';

class GeminiService {
  final Dio _dio = Dio();
  final String baseUrl = "https://generativelanguage.googleapis.com/v1beta";
  final String apiKey = GeminiApiKey.key;

  // Cache để lưu lyrics đã generate trong bộ nhớ (trong một phiên)
  final Map<String, List<Lyric>> _memoryCacheMap = {};

  // Key cho SharedPreferences để lưu thông tin cache
  static const String _lyricsStorageKey = 'gemini_lyrics_cache_keys';

  // Khởi tạo SharedPreferences
  Future<SharedPreferences> get _prefs => SharedPreferences.getInstance();

  // Tạo key cho cache từ audioUrl và htmlContent
  String _createCacheKey(String audioUrl, String htmlContent) {
    // Sử dụng hash đơn giản để rút gọn key
    final contentHash = htmlContent.hashCode.toString();
    final urlLastPart = audioUrl.split('/').last;
    return '$urlLastPart-$contentHash';
  }

  // Kiểm tra xem có lyrics trong cache không (bộ nhớ hoặc local storage)
  Future<List<Lyric>?> _checkCache(String audioUrl, String htmlContent) async {
    final cacheKey = _createCacheKey(audioUrl, htmlContent);

    // Kiểm tra cache trong bộ nhớ trước
    if (_memoryCacheMap.containsKey(cacheKey)) {
      if (kDebugMode) {
        print('✅ Lyrics found in memory cache');
      }
      return _memoryCacheMap[cacheKey];
    }

    // Nếu không có trong bộ nhớ, kiểm tra trong local storage
    try {
      final prefs = await _prefs;
      final String? cachedLyricsJson = prefs.getString(cacheKey);

      if (cachedLyricsJson != null) {
        if (kDebugMode) {
          print('✅ Lyrics found in disk cache');
        }
        // Chuyển đổi JSON thành danh sách Lyric
        final List<dynamic> lyricsData = jsonDecode(cachedLyricsJson);
        final lyrics =
            lyricsData.map((data) {
              return Lyric(
                timestamp: Duration(milliseconds: data['timestamp']),
                text: data['text'],
              );
            }).toList();

        // Lưu vào bộ nhớ để truy cập nhanh hơn lần sau
        _memoryCacheMap[cacheKey] = lyrics;

        return lyrics;
      }
    } catch (e) {
      if (kDebugMode) {
        print('❌ Error reading from disk cache: $e');
      }
    }

    return null;
  }

  // Lưu lyrics vào cả bộ nhớ và local storage
  Future<void> _saveLyricsToCache(
    String audioUrl,
    String htmlContent,
    List<Lyric> lyrics,
  ) async {
    final cacheKey = _createCacheKey(audioUrl, htmlContent);

    // Lưu vào bộ nhớ
    _memoryCacheMap[cacheKey] = lyrics;

    // Lưu vào local storage
    try {
      final prefs = await _prefs;

      // Chuyển đổi danh sách Lyric thành dạng có thể lưu được
      final lyricsData =
          lyrics.map((lyric) {
            return {
              'timestamp': lyric.timestamp.inMilliseconds,
              'text': lyric.text,
            };
          }).toList();

      // Lưu thành JSON string
      final lyricsJson = jsonEncode(lyricsData);
      await prefs.setString(cacheKey, lyricsJson);

      // Cập nhật danh sách keys đã lưu trữ
      final cachedKeys = prefs.getStringList(_lyricsStorageKey) ?? [];
      if (!cachedKeys.contains(cacheKey)) {
        cachedKeys.add(cacheKey);
        await prefs.setStringList(_lyricsStorageKey, cachedKeys);
      }

      if (kDebugMode) {
        print('✅ Lyrics saved to disk cache');
      }
    } catch (e) {
      if (kDebugMode) {
        print('❌ Error writing to disk cache: $e');
      }
    }
  }

  // Xóa cache cũ nếu số lượng entries quá nhiều (dọn dẹp tự động)
  Future<void> _cleanupCache(int maxEntries) async {
    try {
      final prefs = await _prefs;
      final cachedKeys = prefs.getStringList(_lyricsStorageKey) ?? [];

      if (cachedKeys.length > maxEntries) {
        // Xóa các entries cũ nhất (giữ lại maxEntries entries mới nhất)
        final keysToRemove = cachedKeys.sublist(
          0,
          cachedKeys.length - maxEntries,
        );
        final keysToKeep = cachedKeys.sublist(cachedKeys.length - maxEntries);

        for (final key in keysToRemove) {
          await prefs.remove(key);
        }

        await prefs.setStringList(_lyricsStorageKey, keysToKeep);
        if (kDebugMode) {
          print('🧹 Cleaned up ${keysToRemove.length} old cache entries');
        }
      }
    } catch (e) {
      if (kDebugMode) {
        print('❌ Error cleaning cache: $e');
      }
    }
  }

  /// 1️⃣ Bước 1: Lấy URL tải lên từ Google
  Future<String?> getUploadUrl(File file) async {
    try {
      final mimeType = lookupMimeType(file.path) ?? 'audio/mp3';
      final numBytes = await file.length();

      Response response = await _dio.post(
        "$baseUrl/media/upload?key=$apiKey",
        options: Options(
          headers: {
            'Content-Type': 'application/json',
            'X-Upload-Content-Type': mimeType,
            'X-Upload-Content-Length': numBytes.toString(),
          },
        ),
        data: {'name': file.uri.pathSegments.last, 'mimeType': mimeType},
      );

      final location = response.headers.value('x-goog-upload-url');
      if (location == null) {
        throw Exception('No upload URL in response');
      }
      return location;
    } catch (e) {
      if (kDebugMode) {
        print("❌ Lỗi lấy upload URL: $e");
      }
      return null;
    }
  }

  /// 2️⃣ Bước 2: Tải file lên Google
  Future<String?> uploadFile(String uploadUrl, File file) async {
    try {
      final bytes = await file.readAsBytes();

      Response response = await _dio.put(
        uploadUrl,
        data: Stream.fromIterable([bytes]),
        options: Options(
          headers: {
            'Content-Type': 'application/octet-stream',
            'Content-Length': bytes.length.toString(),
          },
        ),
      );

      if (response.statusCode != 200) {
        throw Exception('Upload failed with status ${response.statusCode}');
      }

      return response.data['name']; // Return the file ID/name
    } catch (e) {
      if (kDebugMode) {
        print("❌ Lỗi tải file lên: $e");
      }
      return null;
    }
  }

  /// 3️⃣ Bước 3: Gửi yêu cầu tạo nội dung từ file đã tải lên
  Future<String?> generateContent(String fileUri, String htmlContent) async {
    try {
      Response response = await _dio.post(
        "$baseUrl/models/gemini-2.0-flash-lite:generateContent?key=$apiKey",
        options: Options(headers: {"Content-Type": "application/json"}),
        data: jsonEncode({
          "contents": [
            {
              "parts": [
                {
                  "text": '''
                    # HIGH-PRECISION LRC GENERATION SYSTEM

                    You are a specialized AI system for creating perfectly synchronized LRC files from audio and text content. Your task requires exceptional precision in both text matching and timing alignment.

                    ## PREPARATION PROCESS

                    1. PRELIMINARY TEXT ANALYSIS:
                       - First, thoroughly analyze the provided HTML text
                       - Extract all full sentences and paragraphs exactly as written
                       - Do NOT modify the original text in any way
                       - Identify and mark sentence boundaries, paragraph breaks, and potential challenging pronunciation points
                       - Create a sequential text map to ensure no content is missed or duplicated

                    2. AUDIO SEGMENTATION:
                       - Divide the audio into 30-second segments for analysis
                       - For each segment, identify clear audio markers (sentence starts, pauses, distinct words)
                       - Use these markers as synchronization checkpoints
                       - Process each segment independently, then verify continuity across segment boundaries

                    3. SYNCHRONIZATION PROTOCOL:
                       - Match each audio segment with its corresponding text section
                       - For each identified phrase in the audio:
                         a) Record the exact timestamp when the phrase begins
                         b) Extract the exact matching text from the HTML content
                         c) Create an LRC line in format [mm:ss.xx]exact text
                       - When uncertain about a word's pronunciation or timing:
                         a) Use surrounding context to infer position
                         b) Place timestamp slightly BEFORE the estimated start time
                         c) Cross-verify with nearby clear audio markers

                    ## MANDATORY QUALITY STANDARDS

                    1. ABSOLUTE TEXT FIDELITY:
                       - Each LRC line must contain EXACT text from the HTML, with no modifications
                       - Preserve all original capitalization, punctuation, and spacing
                       - Never substitute, rephrase, or summarize text
                       - Include ALL content from the HTML in the same order

                    2. TIMESTAMP PRECISION PROTOCOL:
                       - Use millisecond-precise timestamps: [mm:ss.xx]
                       - Apply the Recalibration Rule: At least every 30 seconds, find a clear audio marker to reset timing
                       - Implement Drift Correction: If timing becomes misaligned, return to the nearest clear audio point
                       - Always ensure timestamps are strictly sequential
                       - Round timestamps to nearest 100ms (xx value multiple of 10) for stability

                    3. SEGMENTATION GUIDELINES:
                       - Optimal segment length: 5-15 words per line
                       - Break at natural sentence or clause boundaries
                       - Balance readability with timing precision
                       - Avoid excessively long or short segments
                       - For very short phrases, combine only if spoken together without pause

                    ## ERROR PREVENTION STRATEGIES

                    1. MISALIGNMENT PREVENTION:
                       - Reset timing reference points at clear speech markers every 20-30 seconds
                       - When uncertainty occurs, prioritize text sequence integrity over uncertain pronunciations
                       - If timing drift is detected, recalibrate at next clear audio point
                       - For sections with unclear audio, mark timestamps based on surrounding clear sections

                    2. HANDLING CHALLENGING AUDIO:
                       - For mispronunciations or unclear speech: Follow the text as written, not as spoken
                       - For specialized terminology: Pay extra attention to exact pronunciation timing
                       - For background noise/music: Focus on vocal elements only
                       - For very fast speech: Break into shorter segments, maintaining text integrity

                    ## OUTPUT SPECIFICATION

                    Generate LRC content in this exact format:
                    [00:00.00]First text segment exactly matching HTML
                    [00:03.50]Second text segment exactly matching HTML
                    [00:07.90]Third text segment exactly matching HTML

                    Your output must:
                    - Include ONLY the LRC content (no explanations or comments)
                    - Contain every piece of text from the HTML
                    - Have precise, accurate timestamps
                    - Follow strict chronological order
                    - Be ready for immediate use in a media player
                  ''',
                },
                {
                  "audio": {"mime_type": "audio/mp3", "data": fileUri},
                },
                {"text": htmlContent},
              ],
            },
          ],
        }),
      );

      if (response.statusCode != 200) {
        throw Exception(
          'Generate content failed with status ${response.statusCode}',
        );
      }

      return response.data['candidates']?[0]['content']['parts']?[0]['text'];
    } catch (e) {
      if (kDebugMode) {
        print("❌ Lỗi tạo nội dung: $e");
      }
      return null;
    }
  }

  Future<List<Lyric>> generateLyrics(
    String audioUrl,
    String htmlContent,
  ) async {
    try {
      // Kiểm tra cache trước
      final cachedLyrics = await _checkCache(audioUrl, htmlContent);
      if (cachedLyrics != null && cachedLyrics.isNotEmpty) {
        return cachedLyrics;
      }

      // 1. Tải file audio với chunk size nhỏ hơn
      final audioFile = await _downloadAudioWithChunks(audioUrl);
      if (audioFile == null) {
        throw Exception('Failed to download audio file');
      }

      // 2. Chuyển file audio thành base64 với chunk size
      final base64Audio = await _encodeAudioToBase64(audioFile);

      // 3. Gọi API Gemini với prompt được cải thiện
      final response = await _dio.post(
        "$baseUrl/models/gemini-2.0-flash:generateContent?key=$apiKey",
        options: Options(
          headers: {"Content-Type": "application/json"},
          validateStatus: (status) => status! < 500,
        ),
        data: {
          "contents": [
            {
              "parts": [
                {
                  "text": '''
                    # HƯỚNG DẪN TẠO LRC FILE CHÍNH XÁC

                    Bạn là một hệ thống AI chuyên biệt để tạo file LRC đồng bộ từ audio và văn bản. Nhiệm vụ của bạn là tạo ra file LRC với độ chính xác cao nhất có thể.

                    ## QUY TẮC CHÍNH

                    1. ĐỊNH DẠNG OUTPUT:
                       - Mỗi dòng PHẢI theo format chính xác: [mm:ss.xx]text
                       - mm: phút (00-99)
                       - ss: giây (00-59)
                       - xx: mili giây (00-99)
                       - text: nội dung văn bản CHÍNH XÁC từ HTML
                       
                    2. ĐỒNG BỘ THỜI GIAN:
                       - Timestamp phải CHÍNH XÁC với thời điểm bắt đầu của từng câu trong audio
                       - Khoảng cách tối thiểu giữa các timestamp: 200ms
                       - Không được có timestamp trùng lặp
                       - Timestamp phải theo thứ tự tăng dần
                       
                    3. NỘI DUNG VĂN BẢN:
                       - Copy CHÍNH XÁC từ HTML, không thay đổi/thêm/bớt
                       - Giữ nguyên dấu câu, chữ hoa/thường
                       - Chia câu dựa vào ngữ điệu người nói
                       - Mỗi dòng nên có độ dài vừa phải (5-15 từ)

                    ## XỬ LÝ TRƯỜNG HỢP ĐẶC BIỆT

                    1. Khi audio không rõ:
                       - Vẫn sử dụng text từ HTML
                       - Đặt timestamp dựa vào context xung quanh
                       
                    2. Khi người nói quá nhanh:
                       - Chia thành các đoạn ngắn hơn
                       - Đảm bảo vẫn giữ nguyên text gốc
                       
                    3. Khi có nhiễu/nhạc nền:
                       - Tập trung vào giọng nói chính
                       - Bỏ qua các âm thanh phụ

                    ## VÍ DỤ OUTPUT MONG MUỐN

                    [00:00.00]This is the first line of the text
                    [00:02.50]It should match exactly with the HTML content
                    [00:05.80]And be perfectly synchronized with the audio
                    [00:08.20]Each timestamp should be precise
                    [00:10.50]And follow a logical sequence

                    ## LƯU Ý QUAN TRỌNG

                    - CHỈ trả về nội dung LRC, không kèm giải thích
                    - ĐẢM BẢO bao gồm toàn bộ nội dung từ HTML
                    - KIỂM TRA kỹ các timestamp trước khi trả về
                    - KHÔNG được bỏ sót hoặc thêm nội dung
                  ''',
                },
                {
                  "inline_data": {
                    "mime_type": "audio/mp3",
                    "data": base64Audio,
                  },
                },
                {"text": htmlContent},
              ],
            },
          ],
        },
      );

      if (response.statusCode != 200) {
        if (kDebugMode) {
          print("API Response: ${response.data}");
        }
        throw Exception(
          'Generate content failed with status ${response.statusCode}',
        );
      }

      final content =
          response.data['candidates']?[0]['content']['parts']?[0]['text'];
      if (content == null) {
        throw Exception('No content in response');
      }

      // Parse và làm tròn thời gian
      final lyrics = _parseLrcContent(content);

      // Lưu vào cache (bộ nhớ và đĩa)
      if (lyrics.isNotEmpty) {
        await _saveLyricsToCache(audioUrl, htmlContent, lyrics);
        // Dọn dẹp cache cũ nếu cần (giữ tối đa 50 bài)
        await _cleanupCache(50);
      }

      return lyrics;
    } catch (e) {
      if (kDebugMode) {
        print('Error generating lyrics: $e');
      }
      return [];
    } finally {
      // Xóa file tạm nếu tồn tại
      try {
        final tempDir = await getTemporaryDirectory();
        final fileName = audioUrl.split('/').last;
        final file = File('${tempDir.path}/$fileName');
        if (await file.exists()) {
          await file.delete();
        }
      } catch (e) {
        if (kDebugMode) {
          print('Error cleaning up temp file: $e');
        }
      }
    }
  }

  Future<File?> _downloadAudioWithChunks(String url) async {
    try {
      final tempDir = await getTemporaryDirectory();
      final fileName = url.split('/').last;
      final file = File('${tempDir.path}/$fileName');

      if (await file.exists()) {
        return file;
      }

      final response = await _dio.get(
        url,
        options: Options(
          responseType: ResponseType.stream,
          validateStatus: (status) => status! < 500,
        ),
      );

      final sink = file.openWrite();
      await for (final chunk in response.data.stream) {
        sink.add(chunk);
      }
      await sink.close();

      return file;
    } catch (e) {
      if (kDebugMode) {
        print('Error downloading audio: $e');
      }
      return null;
    }
  }

  Future<String> _encodeAudioToBase64(File file) async {
    final List<int> bytes = [];
    final stream = file.openRead();
    await for (final chunk in stream) {
      bytes.addAll(chunk);
    }
    return base64Encode(bytes);
  }

  List<Lyric> _parseLrcContent(String content) {
    final List<Lyric> lyrics = [];
    final lines = content.split('\n');
    Duration? lastTimestamp;

    for (var line in lines) {
      final match = RegExp(
        r'\[(\d{2}):(\d{2})\.(\d{2})\](.*)',
      ).firstMatch(line);

      if (match != null) {
        final minutes = int.parse(match.group(1)!);
        final seconds = int.parse(match.group(2)!);
        final milliseconds = int.parse(match.group(3)!);
        final text = match.group(4)?.trim() ?? '';

        if (text.isNotEmpty) {
          // Làm tròn thời gian đến 100ms gần nhất
          var timestamp = Duration(
            minutes: minutes,
            seconds: seconds,
            milliseconds:
                milliseconds * 10, // Sửa lỗi làm tròn (giữ đúng milliseconds)
          );

          // Đảm bảo timestamp mới luôn lớn hơn timestamp cũ ít nhất 50ms
          if (lastTimestamp != null && timestamp <= lastTimestamp) {
            timestamp = lastTimestamp + const Duration(milliseconds: 50);
          }
          // Nếu khoảng cách quá nhỏ (dưới 200ms) và không phải dòng đầu tiên, tăng lên ít nhất 200ms
          else if (lastTimestamp != null &&
              timestamp - lastTimestamp < const Duration(milliseconds: 200) &&
              lyrics.isNotEmpty) {
            timestamp = lastTimestamp + const Duration(milliseconds: 200);
          }

          lastTimestamp = timestamp;
          lyrics.add(Lyric(timestamp: timestamp, text: text));
        }
      }
    }

    // Thêm xử lý thêm: đảm bảo khoảng cách hợp lý giữa các dòng
    if (lyrics.length > 1) {
      for (int i = 1; i < lyrics.length; i++) {
        // Nếu khoảng cách quá ngắn (<200ms), tăng thời gian
        var prevTime = lyrics[i - 1].timestamp;
        var currTime = lyrics[i].timestamp;

        if (currTime.inMilliseconds - prevTime.inMilliseconds < 200) {
          lyrics[i] = Lyric(
            timestamp: prevTime + const Duration(milliseconds: 200),
            text: lyrics[i].text,
          );
        }
      }
    }

    return lyrics;
  }
}
