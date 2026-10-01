
import 'package:gif_search_test_task/models/gif.model.dart';
import 'package:gif_search_test_task/services/giphy_services.dart';

class GifController {

  final GiphyService giphyService = GiphyService(); // final - don't change link 

  // parameter for pagination
  final int pageSize = 20;
  int offset = 0;
  bool isLoadingMore = false;
  bool hasMore = true;

  List<Gif> gifs = [];
  String searchQuery = '';

  bool isLoading = false;
  String? errorMessage;

  Future<void> loadTrendingGifs() async {
    isLoading = true;
    errorMessage = null;

    try {
      final result = await giphyService.getTrendingGifs(
        limit: pageSize,
        offset: offset
      );

      gifs = result;
      offset = result.length;
    } catch (e) {
      errorMessage = e.toString();
    } finally {
      isLoading = false;
    }
  }

  Future<void> loadMoreGifs() async {
    if(isLoadingMore || !hasMore){
      return;
    }

    isLoadingMore = true;

    try {

      final List<Gif> result;
      
      if(searchQuery.isEmpty){
        result = await giphyService.getTrendingGifs(
          limit: pageSize,
          offset: offset
        );
      } else {
        result = await giphyService.searchGifs(
          searchQuery,
          limit: pageSize,
          offset: offset
        );
      }
     

      gifs.addAll(result);
      offset += result.length;

      if(result.length < pageSize){
        hasMore = false;
      }
    } catch (e) {
      print('Load error: $e');
    } finally {
      isLoadingMore = false;
    }
  }

  Future<void> searchGifs(String query) async {
    searchQuery = query;

    if(query.trim().isEmpty){
      return;
    }

    isLoading = true;
    errorMessage = null;
    offset = 0;
    hasMore = true;

    try{
      final result = await giphyService.searchGifs(
        query,
        limit: pageSize,
        offset: 0,
      );

      gifs = result;
      offset = result.length;

      if(result.length < pageSize){
        hasMore = false;
      }
    } catch(e){
      errorMessage = e.toString();
    } finally {
      isLoading = false;
    }
  }


}