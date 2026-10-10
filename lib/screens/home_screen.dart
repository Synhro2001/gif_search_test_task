import 'package:flutter/material.dart';
import 'package:gif_search_test_task/constants/app_color.dart';

import 'package:gif_search_test_task/controllers/gif_controller.dart';
import 'package:gif_search_test_task/widgets/gif_display_error.dart';
import 'package:gif_search_test_task/widgets/gif_grid.dart';
import 'package:gif_search_test_task/widgets/gif_loading_indicator.dart';
import 'package:gif_search_test_task/widgets/navbar.dart';
import 'package:gif_search_test_task/widgets/search_input.dart';

class HomeScreen extends StatefulWidget {

  final bool isDarkMode;
  final VoidCallback onToggleTheme;

  const HomeScreen({
    super.key,
    required this.isDarkMode,
    required this.onToggleTheme,
  });

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final GifController gifController = GifController();
  final TextEditingController searchTextController = TextEditingController();
  final ScrollController scrollController = ScrollController();

  @override
  void initState() {
    super.initState();

    scrollController.addListener(onScroll);

    loadGifs();
  }

  Future<void> loadGifs() async {
    await gifController.loadTrendingGifs();

    if (!mounted) return;

    setState(() {});
  }

  void onScroll() {
    if (!scrollController.hasClients) {
      return;
    }

    final currentPosition =
        scrollController.position.pixels;

    final maxPosition =
        scrollController.position.maxScrollExtent;

    if (currentPosition >= maxPosition - 300) {
      loadMoreGifs();
    }
  }

  Future<void> loadMoreGifs() async {
    await gifController.loadMoreGifs();

    if (!mounted) return;

    setState(() {});
  }

  void searchGifs(String query) {
    gifController.searchGifsDebounce(query);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: Column(
        children: [
          Navbar(
            title: 'Gif Search',
            isDarkMode: widget.isDarkMode,
            onToggleTheme: widget.onToggleTheme
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 16, 16 , 8),
            child: SearchInput(
              onChanged: searchGifs, controller: searchTextController,
            ),
            
          ),

          Expanded(
            child: AnimatedBuilder( // animatedBuilder works when notifyListener calls  
              animation: gifController, 
              builder: (context, child){
                return _buildContent(); // show new gifController.gifs
              }),
          ),
        ],
      ),
    );
  }

  Widget _buildContent() {
    if (gifController.isLoading) {
      return const LoadingIndicator();
    }

    if (gifController.errorMessage != null) {
      return GifDisplayError(
        onRetry: loadGifs,
      );
    }

    if (gifController.gifs.isEmpty) {
      return const Center(
        child: Text('No GIFs found'),
      );
    }

    return GifGrid(
      gifs: gifController.gifs,
      scrollController: scrollController,
      isLoadingMore: gifController.isLoadingMore,
    );
  }

   //Lifecycle ends
  @override
  void dispose() {
    scrollController.removeListener(onScroll);
    scrollController.dispose();
    searchTextController.dispose();
    gifController.dispose();
    super.dispose();
  }
}