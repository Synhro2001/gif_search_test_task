import 'package:flutter/material.dart';

import 'package:gif_search_test_task/models/gif.model.dart';
import 'package:gif_search_test_task/navigation/app_navigator.dart';
import 'package:gif_search_test_task/widgets/gif_card.dart';

class GifGrid extends StatelessWidget {
  final List<Gif> gifs;
  final ScrollController scrollController;
  final bool isLoadingMore;

  const GifGrid({
    super.key,
    required this.gifs,
    required this.scrollController,
    required this.isLoadingMore,
  });

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      controller: scrollController,

      padding: const EdgeInsets.all(12),

      gridDelegate:
          const SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: 200,
        crossAxisSpacing: 12,
        mainAxisSpacing: 12,
        childAspectRatio: 1,
      ),

      itemCount: gifs.length + (isLoadingMore ? 1 : 0),

      itemBuilder: (context, index) {
        // Loading indicator
        if (index == gifs.length) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }

        final gif = gifs[index];

        return GifCard(
          gif: gif,
          onTap: () {
            AppNavigator.openGifDetails(context, gif);
          },
        );
      },
    );
  }
}