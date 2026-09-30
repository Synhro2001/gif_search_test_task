import 'package:flutter/material.dart';

import 'package:gif_search_test_task/controllers/gif_controller.dart';
import 'package:gif_search_test_task/widgets/gif_grid.dart';
import 'package:gif_search_test_task/widgets/navbar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final GifController gifController = GifController();

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
    gifController.searchGifs(query);

    setState(() {});
  }

  @override
  void dispose() {
    scrollController.removeListener(onScroll);
    scrollController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Navbar(
            title: 'Gif Search',
            onSearch: searchGifs,
          ),

          Expanded(
            child: _buildContent(),
          ),
        ],
      ),
    );
  }

  Widget _buildContent() {
    if (gifController.isLoading) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    }

    if (gifController.errorMessage != null) {
      return Center(
        child: Text(
          gifController.errorMessage!,
        ),
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
}