import 'dart:convert';
import 'dart:io';
import 'dart:developer'; // For log()
import 'package:http/http.dart';
import 'package:yukta_ai/helper/global.dart';
import 'package:translator_plus/translator_plus.dart';

class APIs {
  static Future<String> getAnswer(String question) async {
    try {
      final res = await post(
        Uri.parse('https://api.openai.com/v1/chat/completions'),
        headers: {
          HttpHeaders.contentTypeHeader: 'application/json',
          HttpHeaders.authorizationHeader: 'Bearer $apiKey',
        },
        body: jsonEncode({
          "model": "gpt-4o-mini",
          "max_tokens": 2000,
          "temperature": 0,
          "store": true,
          "messages": [
            {"role": "user", "content": question},
          ],
        }),
      );

      final data = jsonDecode(res.body);

      // Log the response safely
      log('Response body: ${res.body}');

      return data['choices'][0]['message']['content'];
    } catch (e) {
      log('getAnswerE: ${e.toString()}'); // Ensure exception is logged properly
      return 'Sorry, I am not able to answer this question';
    }
  }

  static Future<List<String>> searchAiImages(String prompt) async {
    try {
      final res = await get(
        Uri.parse('https://lexica.art/api/v1/search?q=$prompt'),
      );

      final data = jsonDecode(res.body);

      //
      return List.from(data['images']).map((e) => e['src'].toString()).toList();
    } catch (e) {
      log('searchAiImagesE: $e');
      return [];
    }
  }

  static Future<String> googleTranslate({
    required String from,
    required String to,
    required String text,
  }) async {
    try {
      final res = await GoogleTranslator().translate(text, from: from, to: to);
      return res.text;
    } catch (e) {
      log('googleTranslateE: $e');
      return 'Sorry, I am not able to translate this text';
    }
  }
}
