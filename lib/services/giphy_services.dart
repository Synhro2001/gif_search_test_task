import 'dart:convert';

import 'package:flutter_dotenv/flutter_dotenv.dart';

import 'package:gif_search_test_task/models/gif.model.dart';

import 'package:http/http.dart' as http;

class GiphyService {
  Future<List<Gif>> getTrendingGifs({
    int limit = 20,
    int offset = 0
  }) async {
    final apiKey = dotenv.env['GIPHY_API_KEY'];

    final url = Uri.https(
      'api.giphy.com',
      '/v1/gifs/trending',
      {
        'api_key': apiKey,
        'limit': limit.toString(),
        'offset': offset.toString()
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

  Future<List<Gif>> searchGifs(
    String query,
    {
      int limit = 20,
      int offset = 0
    }
  ) async {
    final apiKey = dotenv.env['GIPHY_API_KEY'];

    final url = Uri.https(
      'api.giphy.com',
      '/v1/gifs/search',
      {
        'api_key': apiKey,
        'q': query,
        'limit': limit.toString(),
        'offset': offset.toString()
      },
    );

    final response = await http.get(url);

    if(response.statusCode != 200) {
      throw Exception(
        'Failed to search: ${response.statusCode}',
      );
    }

    final json = jsonDecode(response.body);
    final data = json['data'] as List;

    return data.map<Gif>((gif) => Gif.fromJson(gif)).toList();

  }
}
