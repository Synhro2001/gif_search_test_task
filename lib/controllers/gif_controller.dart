import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';

import 'package:gif_search_test_task/models/gif.model.dart';
import 'package:gif_search_test_task/services/giphy_services.dart';

class GifController extends ChangeNotifier { // управление состоянием и автоматическое обновление UI когда меняются данные
// use changeNotifier for UI changes when data updates

  // dependency injection 
  final GiphyService giphyService;

  GifController({GiphyService? giphyService}) : giphyService = giphyService ?? GiphyService();

  // parameter for pagination
  final int pageSize = 20;
  int offset = 0;
  bool isLoadingMore = false;
  bool hasMore = true;

  List<Gif> gifs = [];
  String searchQuery = '';

  bool isLoading = false;
  String? errorMessage;

  Timer? _debounce; // private variable

  Future<void> loadTrendingGifs() async {
    isLoading = true;
    errorMessage = null;

    notifyListeners();

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

      notifyListeners();
    }
  }

  Future<void> loadMoreGifs() async {
    if(isLoadingMore || !hasMore){
      return;
    }

    isLoadingMore = true;

    notifyListeners();

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
      notifyListeners();
    }
  }

  Future<void> searchGifs(String query) async {
    searchQuery = query.trim(); // delete space

    if(query.trim().isEmpty){
      return;
    }

    isLoading = true;
    errorMessage = null;
    offset = 0;
    hasMore = true;

    notifyListeners();

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
      notifyListeners();
    }
  }

  void searchGifsDebounce(String query){
    _debounce?.cancel();

    _debounce = Timer(
      const Duration(milliseconds: 300), () {
        searchGifs(query);
      }
    );
  }

  @override
  void dispose(){
    _debounce?.cancel();
    super.dispose();
  }
}