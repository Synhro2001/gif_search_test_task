

import 'package:flutter/material.dart';
import 'package:gif_search_test_task/models/gif.model.dart';

class GifCard extends StatelessWidget{
  
  final Gif gif;
  final VoidCallback onTap;

  const GifCard({
    required this.gif,
    required this.onTap,
    super.key
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(18),
      child: InkWell(
        onTap: onTap,
        child: Stack(
          fit: StackFit.expand,
          children: [
            Image.network(
              gif.url,
              fit: BoxFit.cover,
            ),
            Positioned(
              left: 0,
              right: 0,
              bottom: 0, 
              child: Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: AlignmentGeometry.bottomCenter,
                    end: AlignmentGeometry.topCenter,
                    colors: [
                      Colors.black.withValues(alpha: 0.7),
                      Colors.transparent
                    ]
                  )
                ),
               child: Text(
                gif.title,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                  fontWeight: FontWeight.w600
                ),
               ),
                
              ),
            ),
          ]
        )
      ),
    );
  }
}