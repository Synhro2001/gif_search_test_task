
import 'package:flutter/material.dart';
import 'package:gif_search_test_task/models/gif.model.dart';
import 'package:gif_search_test_task/screens/gif_details_screen.dart';

class AppRouter {
  final navigatorKey = GlobalKey<NavigatorState>();

  void openGifDetails(Gif gif) {
    navigatorKey.currentState?.push(
      MaterialPageRoute<void>(
        builder: (_) => GifDetailsScreen(gif: gif, onBack: back
      ))
    );
  }

  void back() => navigatorKey.currentState?.pop();
}

