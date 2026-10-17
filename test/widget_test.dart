// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter_test/flutter_test.dart';
import 'package:gif_search_test_task/controllers/gif_controller.dart';
import 'package:gif_search_test_task/models/gif.model.dart';

import 'test_service.dart';

void main() {
  test('Loads trending Gifs into the controller', () async {
    const testGif = Gif(
      id: '1',
      title: 'Test GIF',
      url: 'https://example.com/test.gif',
      username: 'Test user',
      createDateTime: '',
      source: ''
    );

    final testService = TestService(testGifs: [testGif],);

    final controller = GifController(giphyService: testService);

    await controller.loadTrendingGifs();

    expect(controller.gifs, hasLength(1));
    expect(controller.gifs.first.title, 'Test GIF');
    expect(controller.isLoading, isFalse);
    expect(controller.errorMessage, isNull);

    controller.dispose();
  });

  test('handle an error when trying to find GIFs', () async {
    final testService = TestService(
      testGifs: [],
      shouldThrowError: true // error
    );

    final controller = GifController(
      giphyService: testService
    );

    await controller.loadTrendingGifs();

    expect(controller.errorMessage, isNotNull);
    expect(controller.errorMessage, contains('Failed to load GIFs'));
    expect(controller.isLoading, isFalse);
  });
}
