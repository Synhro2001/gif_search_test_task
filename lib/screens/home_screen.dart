import 'package:flutter/material.dart';
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
  String searchQuery = '';

  bool isLoading = false;

  String? errorMessage;

  final List<String> gifs = [
    'https://media.giphy.com/media/ICOgUNjpvO0PC/giphy.gif',
    'https://media.giphy.com/media/3o6ZtaO9BZHcOjmErm/giphy.gif',
    'https://media.giphy.com/media/5GoVLqeAOo6PK/giphy.gif',
    'https://media.giphy.com/media/l0MYt5jPR6QX5pnqM/giphy.gif',
    'https://media.giphy.com/media/26BRv0ThflsHCqDrG/giphy.gif',
    'https://media.giphy.com/media/xT9IgG50Fb7Mi0prBC/giphy.gif',
  ];

  void searchGifs(String query) {
    setState(() {
      searchQuery = query;
    });
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

          Expanded( // Fill all the remaining free space.
            child: GridView.builder( // display: grid
              padding: const EdgeInsets.all(12),
              gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: 200,
                crossAxisSpacing: 12,
                mainAxisSpacing: 12,
                childAspectRatio: 1,
              ),
              itemCount: gifs.length,
              itemBuilder: (context, index) {
                return GifCard(
                  imageUrl: gifs[index],
                  title: 'Funny GIF $index',
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
