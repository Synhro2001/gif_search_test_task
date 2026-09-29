import 'package:flutter/material.dart';
import 'package:gif_search_test_task/models/gif.model.dart';
import 'package:gif_search_test_task/services/giphy_services.dart';
import 'package:gif_search_test_task/widgets/gif_card.dart';
import 'package:gif_search_test_task/widgets/navbar.dart';

// HomeScreen -> Widget
//_HomeScreen -> Widget state
//final means that variables itself cannot be reassigned

class HomeScreen extends StatefulWidget { // changed screen state
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  
  final GiphyService giphyService = GiphyService(); // don't change link 

  List<Gif> gifs = [];
  String searchQuery = '';

  bool isLoading = false;
  String? errorMessage;

  // parameter for pagination
  final int pageSize = 20;
  int offset = 0;
  bool isLoadingMore = false;
  bool hasMore = true;

  Future<void> loadTrendingGifs() async {
    setState(() {
      isLoading = true;
      errorMessage = null;
    });

    try {
      final result = await giphyService.getTrendingGifs(
        limit: pageSize,
        offset: 0
      );

      if(!mounted) return;

      setState(() {
        gifs = result;
        offset = result.length;
        isLoading = false;
      });
    } catch(e) {
      if(!mounted) return; // determined state if user finished program

      setState(() {
        errorMessage = e.toString();
        isLoading = false;
      });
    }
  }

  Future<void> loadMoreGifs() async {
    if(isLoadingMore || !hasMore) {
      return;
    }

    setState(() {
      isLoadingMore = true;
    });

    try {
      final result = await giphyService.getTrendingGifs(
        limit: pageSize,
        offset: offset
      );

      if(!mounted) return;

      setState(() {
        gifs.addAll(result);
        offset += result.length;
        isLoadingMore = false;

        if(result.length < pageSize){
          hasMore = false;
        }
      });
    } catch (e) {
      if(!mounted) return;

      setState(() {
        isLoadingMore = false;
      });
    }
  }

  @override
  void initState() {
    super.initState();

    loadTrendingGifs();
  }
  

  void searchGifs(String query) {
    print(query);
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
        Expanded(child: _buildContent()), // take available space 
        
        ],
      ),
    );
  }

  Widget _buildContent() {
    if(isLoading) {
      return const Center(
        child:  CircularProgressIndicator(),
      );
    }
    if (errorMessage != null) {
      return Center(
        child: Text(errorMessage!),
      );
    }

    if(gifs.isEmpty) {
      return const Center(
        child: Text('No GIFs found'),
      );
    }
      return GridView.builder( // this constructor use for a large number of children
      padding: const EdgeInsets.all(12),

      gridDelegate:
          const SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: 200, // maxWidth: 200px
        crossAxisSpacing: 12, // column-gap: 12px
        mainAxisSpacing: 12,
        childAspectRatio: 1,
      ),

      itemCount: gifs.length,

      itemBuilder: (context, index) {
        final gif = gifs[index];

        return GifCard(
          gif: gif,
        );
      },
    );
   
  }


}
