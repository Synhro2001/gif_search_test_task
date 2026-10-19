import 'package:flutter/material.dart';
import 'package:gif_search_test_task/models/gif.model.dart';
import 'package:gif_search_test_task/widgets/gif_details_info.dart';
import 'package:gif_search_test_task/widgets/navbar.dart';

class GifDetailsScreen extends StatelessWidget {
  const GifDetailsScreen({
    super.key,
    required this.gif,
    required this.onBack,
  });

  final Gif gif;
  final VoidCallback onBack;

  String _orUnknown(String value) => value.isEmpty ? 'Unknown' : value;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Navbar(title: 'GIF Details', onBack: onBack),
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(16),
                    child: Image.network(gif.url, width: double.maxFinite, fit: BoxFit.contain),
                  ),
                  const SizedBox(height: 24),
                  Text(
                    gif.title.isEmpty ? 'Unknown GIF' : gif.title,
                    style: const TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 24),
                  GifDetailsInfoRow(label: 'Author', value: _orUnknown(gif.username)),
                  GifDetailsInfoRow(
                    label: 'Create date',
                    value: gif.createDateTime.isEmpty
                        ? 'Unknown'
                        : gif.createDateTime.toUpperCase(),
                  ),
                  GifDetailsInfoRow(label: 'Source', value: _orUnknown(gif.source)),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}