
import 'package:flutter/material.dart';
import 'package:gif_search_test_task/models/gif.model.dart';
import 'package:gif_search_test_task/screens/gif_details_screen.dart';

class AppNavigator {
  static void openGifDetails(BuildContext context, Gif gif) {
    Navigator.of(context).push(
      MaterialPageRoute<void>(
        builder: (_) => GifDetailsScreen(gif: gif),
      )
    );
  }

  static void goBack(BuildContext context) {
    Navigator.of(context).pop();
  }
}

// create class to separate UI navigation 
// create a static method because we dont needed create objet when call it