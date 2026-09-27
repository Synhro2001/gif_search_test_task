import 'dart:convert';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;

class GiphyService {
  Future<List<String>> getTrendingGifs() async {
    final apiKey = dotenv.env['GIPHY_API_KEY'];

    final url = Uri.https(
      'api.giphy.com',
      '/v1/gifs/trending',
      {
        'api_key': apiKey,
        'limit': '20',
      },
    );

    final response = await http.get(url);

    if (response.statusCode != 200) {
      throw Exception(
        'Failed to load GIFs: ${response.statusCode}',
      );
    }

    final json = jsonDecode(response.body);

    final data = json['data'] as List;

    return data.map<String>((gif) {
      return gif['images']['original']['url'] as String;
    }).toList();
  }
}
