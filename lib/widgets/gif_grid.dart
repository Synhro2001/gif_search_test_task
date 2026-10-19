import 'package:flutter/material.dart';
import 'package:gif_search_test_task/models/gif.model.dart';
import 'package:gif_search_test_task/widgets/gif_card.dart';

class GifGrid extends StatelessWidget {
  const GifGrid({
    super.key,
    required this.gifs,
    required this.scrollController,
    required this.isLoadingMore,
    required this.onGifTap,
  });

  final List<Gif> gifs;
  final ScrollController scrollController;
  final bool isLoadingMore;
  final void Function(Gif gif) onGifTap;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      controller: scrollController,
      padding: const EdgeInsets.all(12),
      gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: 200,
        crossAxisSpacing: 12,
        mainAxisSpacing: 12,
        childAspectRatio: 1,
      ),
      itemCount: gifs.length + (isLoadingMore ? 1 : 0),
      itemBuilder: (context, index) {
        if (index == gifs.length) {
          return const Center(child: CircularProgressIndicator());
        }
        final gif = gifs[index];
        return GifCard(gif: gif, onTap: () => onGifTap(gif));
      },
    );
  }
}