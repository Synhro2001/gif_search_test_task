import 'dart:convert';

import 'package:flutter_dotenv/flutter_dotenv.dart';

import 'package:gif_search_test_task/models/gif.model.dart';

import 'package:http/http.dart' as http;

class GiphyService {
  Future<List<Gif>> getTrendingGifs() async {
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

    return data
      .map<Gif>((gif) => Gif.fromJson(gif as Map<String, dynamic>)) // map iterates over each GIF
      .toList();
  }
}
