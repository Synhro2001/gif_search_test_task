
import 'package:gif_search_test_task/models/gif.model.dart';
import 'package:gif_search_test_task/services/giphy_services.dart';

// Create a GiphyService for test.
// This class don't send HTTP requests
class TestService extends GiphyService{
  final List<Gif> testGifs;
  // if true, simulate an error when request a GIF
  final bool shouldThrowError;

  TestService({
    required this.testGifs,
    this.shouldThrowError = false,
    
  });

  @override
  Future<List<Gif>> getTrendingGifs({
    int limit = 20,
    int offset = 0,
  }) async {
    if (shouldThrowError) {
      throw Exception('Failed to load GIFs');
    }
    return testGifs;
  }

  @override
  Future<List<Gif>> searchGifs(
    String query, {
      int limit = 20,
      int offset = 0,
    }
  ) async {
    if(shouldThrowError){
      throw Exception('Failed to find GIFs');
    }
    return testGifs;
  }
}