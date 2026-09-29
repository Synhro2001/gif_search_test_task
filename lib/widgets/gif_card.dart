

import 'package:flutter/material.dart';
import 'package:gif_search_test_task/models/gif.model.dart';

class GifCard extends StatelessWidget{
  
  final Gif gif;

  const GifCard({
    required this.gif,
    super.key
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(16),
      child: Stack(
        fit: StackFit.expand,
        children: [
          Image.network(gif.url ,fit: BoxFit.cover),
          Positioned(
            left: 8,
            right: 8,
            bottom: 8, 
            child: Text(
              gif.title,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 14,
                fontWeight: FontWeight.w600,
                shadows: [
                  Shadow(
                    color: Colors.black,
                    blurRadius: 4
                  )
                ]
              ),
            ),)
        ],
      ),
    );
  }
}