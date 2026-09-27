

import 'package:flutter/material.dart';

class GifCard extends StatelessWidget{
  const GifCard({
    required this.imageUrl,
    required this.title,
    super.key
  });

  final String imageUrl;
  final String title;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(16),
      child: Stack(
        fit: StackFit.expand,
        children: [
          Image.network(imageUrl,fit: BoxFit.cover),
          Positioned(
            left: 8,
            right: 8,
            bottom: 8, 
            child: Text(
              title,
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