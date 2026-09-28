import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:gif_search_test_task/services/giphy_services.dart';

import 'app.dart';

Future<void> main() async {
  await dotenv.load();

  final giphyService = GiphyService();

  try {
    final gifs = await giphyService.getTrendingGifs();

    print('GIFs count: ${gifs.length}');

    for (final gif in gifs) {
        print(gif.id);
        print(gif.title);
        print(gif.url);
    }
  } catch (e) {
    print('ERROR: $e');
  }

  runApp(const MyApp());
}
