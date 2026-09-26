import 'package:flutter/material.dart';
import 'package:gif_search_test_task/widgets/navbar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String searchQuery = '';

  bool isLoading = false;

  List<String> gifs = [];

  String? errorMessage;

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
          Navbar(title: 'Gif Search', onSearch: searchGifs),

          const Expanded(
            child: Center(
              child: Text(
                'Hello World',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
